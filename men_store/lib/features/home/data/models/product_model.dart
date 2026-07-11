import 'category_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String slug;
  final num price;
  final String description;
  final CategoryModel category;
  final List<String> images;

  const ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] as int? ?? 0,
    title: json['title'] as String? ?? '',
    slug: json['slug'] as String? ?? '',
    price: json['price'] as num? ?? 0,
    description: json['description'] as String? ?? '',
    category: CategoryModel.fromJson(
      json['category'] as Map<String, dynamic>? ?? const {},
    ),
    images: (json['images'] as List<dynamic>? ?? [])
        .map((e) => e.toString())
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'slug': slug,
    'price': price,
    'description': description,
    'category': category.toJson(),
    'images': images,
  };

  String get formattedPrice => '\$${price.toStringAsFixed(0)}';
  String get thumbnailUrl =>
      images.isNotEmpty ? images.first : 'https://placehold.co/600x400';
}
