class StoreModel {
  final String name; // 가게 이름
  final String category; // 카테고리 (한식, 양식 등)
  // ... (다른 필드는 생략 가능)
  final String address; 
  bool isSaved; // 저장 여부

  StoreModel({
    required this.name,
    required this.category,
    required this.address,
    this.isSaved = false,
  });
}
