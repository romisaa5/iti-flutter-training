class SearchProductModel {
  final int id;
  final String title;
  final String description;
  final num price;
  final String category;
  final String thumbnailUrl;
  final List<String> images;

  const SearchProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.thumbnailUrl,
    required this.images,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) {
    return SearchProductModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as num? ?? 0,
      category: json['category'] as String? ?? '',
      thumbnailUrl: json['thumbnail'] as String? ?? '',
      images: (json['images'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'category': category,
    'thumbnail': thumbnailUrl,
    'images': images,
  };

  String get formattedPrice => '\$${price.toStringAsFixed(0)}';
}
