class CategoryItem {
  final String id;
  final String name;
  final String desc;

  const CategoryItem({
    required this.id,
    required this.name,
    required this.desc,
  });

  factory CategoryItem.fromJson(Map<String, String> json) {
    return CategoryItem(
      id: json["id"] as String,
      name: json["name"] as String,
      desc: json["description"] as String,
    );
  }
}
