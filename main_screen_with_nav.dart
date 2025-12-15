import 'package:flutter/material.dart';
// ----------------------------------------------------
// 1. 필요한 화면 Import (경로가 올바른지 확인해주세요)
// ----------------------------------------------------
import '../screens/my_screen.dart';
// 이 파일은 이전 오류의 원인이었으므로, 현재 프로젝트 구조에 맞게
// 실제로 존재하는 파일로 임포트해야 합니다.
import '../screens/home_screen.dart'; // <--- 이 파일이 'lib/screens/home_screen.dart'에 실제로 있어야 합니다.
// 다른 화면들도 필요하면 여기에 추가합니다.
// import '../screens/saved_screen.dart';
// import '../screens/map_screen.dart';
// import '../screens/random_screen.dart';

// ----------------------------------------------------
// 2. 임시 빈 화면들 (실제 구현 시 해당 파일로 교체)
// ----------------------------------------------------
// 실제 화면이 완성될 때까지 임시로 사용할 화면을 정의합니다.
class TempScreen extends StatelessWidget {
  final String title;
  const TempScreen({
    required this.title,
    super.key,
  }); // 'required' 추가 및 Named Parameter 사용

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        elevation: 0, // AppBar 아래 그림자 제거
      ),
      body: Center(
        child: Text(
          '$title 화면입니다.',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ----------------------------------------------------
// 3. 메인 네비게이션 화면 (BottomNavigationBar 구현)
// ----------------------------------------------------
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // 시작 화면을 '홈' (인덱스 0)로 설정하는 것이 일반적입니다.

  // ⚠️ 주의: _screens 리스트의 순서와 BottomNavigationBarItem의 순서가 일치해야 합니다.
  final List<Widget> _screens = const [
    HomeScreen(), // 0. 홈 (실제 파일로 변경)
    TempScreen(title: "저장"), // 1. 저장
    TempScreen(title: "지도"), // 2. 지도
    TempScreen(title: "랜덤픽"), // 3. 랜덤픽
    MyScreen(), // 4. 마이 (실제 파일로 변경)
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 현재 선택된 화면을 표시합니다.
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 탭이 5개이므로 fixed 설정이 적절합니다.
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true, // 선택되지 않은 아이템의 라벨도 표시합니다.

        currentIndex: _currentIndex,
        onTap: _onTap,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: '저장',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.casino_outlined),
            label: '랜덤',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '마이',
          ),
        ],
      ),
    );
  }
}
