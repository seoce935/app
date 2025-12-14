import '../models/store_model.dart';

// ------------------------------------
// 1. Fooday의 모든 가게 데이터
// ------------------------------------
final List<StoreModel> allStores = [
  StoreModel(
    name: '소문난 김밥처럼',
    category: '분식',
    themes: ['든든', '시원'], // 든든한 분식, 라면은 시원
    situations: ['혼자', '친구들'], // 혼밥 가능
    address: '성결대 근처',
    canSoloEat: true, // 혼자 식사 가능
    isLargeGroup: false,
  ),
  StoreModel(
    name: '더카페',
    category: '카페',
    themes: ['달달', '시원'], // 달달한 디저트, 시원한 음료
    situations: ['커플', '친구들'],
    address: '성결대 앞',
    canSoloEat: false,
    isLargeGroup: false,
  ),
  StoreModel(
    name: '연신내',
    category: '한식',
    themes: ['든든', '매콤'], // 든든한 한식, 매운 메뉴 있음
    situations: ['친구들', '회식'], // 회식 가능
    address: '성결대 근처',
    canSoloEat: false,
    isLargeGroup: true,
  ),
  StoreModel(
    name: '중찬미식',
    category: '중식',
    themes: ['든든', '매콤'], // 든든한 요리, 매운 짬뽕
    situations: ['커플', '친구들', '회식'],
    address: '성결대 근처',
    canSoloEat: true,
    isLargeGroup: true,
  ),
  StoreModel(
    name: '쿠니라멘',
    category: '일식',
    themes: ['든든', '시원'], // 든든한 라멘, 시원한 육수
    situations: ['혼자', '커플', '친구들'],
    address: '성결대 근처',
    canSoloEat: true,
    isLargeGroup: false,
  ),
  // 여기에 더 많은 가게 데이터를 추가해주세요.
];

// ------------------------------------
// 2. 랜덤 뽑기에 사용할 메뉴 리스트
// ------------------------------------
final List<String> randomMenus = [
  '라멘',
  '돈까스',
  '김밥',
  '국밥',
  '떡볶이',
  '제육덮밥',
  '햄버거',
];

// ------------------------------------
// 3. My 화면에서 "최근 본" 목록 시뮬레이션
// ------------------------------------
// Map<StoreModel, DateTime> 형태로, 최근 본 순서를 위해 사용 시간을 저장합니다.
Map<StoreModel, DateTime> recentlyViewed = {
  allStores[4]: DateTime.now().subtract(const Duration(hours: 1)), // 쿠니라멘
  allStores[2]: DateTime.now().subtract(const Duration(hours: 3)), // 연신내
  allStores[0]: DateTime.now().subtract(const Duration(days: 2)), // 소문난 김밥처럼
  allStores[3]: DateTime.now().subtract(const Duration(days: 4)), // 중찬미식
};
