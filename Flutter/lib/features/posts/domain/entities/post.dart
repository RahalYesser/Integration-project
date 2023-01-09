import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int? id;
  final String name;
  final String userId;
  final String description;
  final String image;
  final String date;

  const Post({
    this.id,
    required this.name,
    required this.userId,
    required this.description,
    required this.image,
    required this.date,
  });

  @override
  List<Object?> get props => [id, name, userId, description, image, date];
}
