class CategoryItem {
  final String id;
  final String name;
  final String desc;
  final bool hasConsent = false;

  const CategoryItem({
    required this.id,
    required this.name,
    required this.desc,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] as String,
      name: json["name"] as String,
      desc: json["description"] as String,
    );
  }
}
