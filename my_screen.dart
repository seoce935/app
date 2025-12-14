import 'package:flutter/material.dart';
import '../models/store_model.dart';
import '../data/dummy_data.dart'; // 더미 데이터 가져오기

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  // 현재 활성화된 중간 탭 (0: 최근 본, 1: 저장, 2: 랜덤픽)
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 1. 최근 본 데이터를 날짜 기준으로 정렬 (최근 순 = 오름차순)
    final sortedRecents = recentlyViewed.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value)); // 최신 시간 순으로 정렬

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // 'MY' 텍스트를 왼쪽에 띄우기 위해 Leading과 Title 사용
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'MY',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        leadingWidth: 80,
        backgroundColor: Colors.white,
        elevation: 0, // AppBar 경계선 제거
        actions: const [
          // 알림 아이콘 (🔔)
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: null, // 기능 미구현
          ),
          // 설정 아이콘 (⚙️)
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: null, // 기능 미구현
          ),
          SizedBox(width: 10), // 오른쪽 여백
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // --- 프로필 영역 ---
              _buildProfileArea(),
              const SizedBox(height: 20),

              // --- 중간 탭 영역 (최근 본 / 저장 / 랜덤픽) ---
              _buildQuickAccessTabs(),
              const SizedBox(height: 20),

              // --- 탭 내용 표시 (최근 본 목록) ---
              if (_selectedTabIndex == 0) ...[
                _buildTabContentHeader("최근 본 가게"),
                _buildRecentlyViewedList(
                  sortedRecents.map((e) => e.key).toList(),
                ),
              ],

              // --- 내가 쓴 리뷰 헤더 ---
              _buildTabContentHeader("내가 쓴 리뷰"),

              // --- 리뷰 목록 ---
              _buildReviewItem(
                storeName: "쿠니라멘",
                rating: 5.0,
                reviewText: "엄청 맛있어요 ㅠㅠ 너무 맛있어요ㅠㅠ",
                isLast: false,
              ),
              _buildReviewItem(
                storeName: "중찬미식",
                rating: 5.0,
                reviewText: "여기는 탕수육이 최고! 양도 많고 좋아요.",
                isLast: true,
              ),
              const SizedBox(height: 80), // 하단 탭 바 공간 확보
            ],
          ),
        ),
      ),
    );
  }

  // 프로필 영역 위젯
  Widget _buildProfileArea() {
    return Row(
      children: [
        // 프로필 이미지 (임시로 Container 사용)
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red.shade100,
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/profile_avatar.png',
              ), // 프로필 이미지 경로 (직접 추가 필요)
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text("🍔", style: TextStyle(fontSize: 30)),
          ),
        ),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "성결대 김미소", // 사용자 이름
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "수정",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 중간 탭 영역 위젯 (최근 본, 저장, 랜덤픽)
  Widget _buildQuickAccessTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildQuickAccessItem(Icons.watch_later_outlined, "최근 본", 0),
          _buildQuickAccessItem(Icons.bookmark_border, "저장", 1),
          _buildQuickAccessItem(Icons.casino_outlined, "랜덤픽", 2),
        ],
      ),
    );
  }

  // 중간 탭 개별 아이템 위젯
  Widget _buildQuickAccessItem(IconData icon, String label, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.redAccent : Colors.grey.shade700,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.redAccent : Colors.grey.shade700,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 탭 내용 헤더 위젯
  Widget _buildTabContentHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 최근 본 목록 표시 위젯
  Widget _buildRecentlyViewedList(List<StoreModel> stores) {
    // 앱 종료 시 데이터가 사라지지 않게 하려면 여기의 로직을 변경해야 합니다.
    // 현재는 더미 데이터를 그대로 사용합니다.
    if (stores.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Center(child: Text("최근 본 가게가 없습니다.")),
      );
    }

    // 최근 본 가게 목록 UI (간결한 리스트 형태로 구성)
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // 스크롤 막기
        shrinkWrap: true, // 크기 제한
        itemCount: stores.length > 5 ? 5 : stores.length, // 최대 5개만 표시
        itemBuilder: (context, index) {
          final store = stores[index];
          // 최근 본 시간 표시를 위한 더미 데이터 사용 (최신순 정렬)
          String timeAgo = (index == 0) ? "1시간 전" : "${index * 2}일 전";

          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.storefront, color: Colors.redAccent),
                title: Text(
                  store.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("${store.category} · $timeAgo"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
                onTap: () {
                  // TODO: 가게 상세 페이지로 이동하는 로직 추가
                },
              ),
              if (index < stores.length - 1 && index < 4)
                const Divider(height: 1, indent: 10),
            ],
          );
        },
      ),
    );
  }

  // 리뷰 아이템 위젯
  Widget _buildReviewItem({
    required String storeName,
    required double rating,
    required String reviewText,
    required bool isLast,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 15.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  storeName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // 별점 표시
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // 작은 아바타 (사진에 있는 이미지)
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.shade100,
                  ),
                  child: const Center(
                    child: Text("🍔", style: TextStyle(fontSize: 12)),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "성결대 김미소",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(reviewText),
            const SizedBox(height: 10),
            const Divider(height: 1),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Text(
                    "좋아요 7",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "댓글 0",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
