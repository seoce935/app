import '../models/store_model.dart';

final List<StoreModel> allStores = [
  StoreModel(name: '소문난 김밥처럼', category: '분식', address: '성결대 근처'),
  StoreModel(name: '더카페', category: '카페', address: '성결대 앞'),
  StoreModel(name: '연신내', category: '한식', address: '성결대  근처'),
  StoreModel(name: '중찬미식', category: '중식', address: '성결대  근처'),
  StoreModel(name: '쿠니라멘', category: '일식', address: '성결대 근처'),
  // 앱 내에서 사용할 모든 가게 데이터를 여기에 추가해주세요.
];

// My 화면에서 "최근 본" 목록을 시뮬레이션하기 위한 더미 데이터
// Map<StoreModel, DateTime> 형태로, 최근 본 순서를 위해 사용 시간을 저장합니다.
Map<StoreModel, DateTime> recentlyViewed = {
  allStores[4]: DateTime.now().subtract(const Duration(hours: 1)), // 쿠니라멘
  allStores[2]: DateTime.now().subtract(const Duration(hours: 3)), // 한양정
  allStores[0]: DateTime.now().subtract(const Duration(days: 2)), // 성결분식집
  allStores[3]: DateTime.now().subtract(const Duration(days: 4)), // 중찬미식
};
