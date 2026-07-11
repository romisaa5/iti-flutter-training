class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String image;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] as int? ?? 0,
    name: json['name'] as String? ?? '',
    slug: json['slug'] as String? ?? '',
    image: json['image'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'image': image,
  };
}
