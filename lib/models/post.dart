// lib/models/post.dart
class Post {
  final String id;
  final String title;
  final int price;
  final double area;
  final int bedrooms;
  final int bathrooms;
  final String location;
  final String imageUrl;
  final bool isVip;
  final String description;

  Post({
    required this.id,
    required this.title,
    required this.price,
    required this.area,
    required this.bedrooms,
    required this.bathrooms,
    required this.location,
    required this.imageUrl,
    required this.isVip,
    required this.description,
  });
}
