import 'package:equatable/equatable.dart';

class Burger extends Equatable {
  final String ref;
  final String title;
  final String? description;
  final String? thumbnail;
  final int price;

  const Burger({
    required this.ref,
    required this.title,
    this.description,
    this.thumbnail,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'ref': ref,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'price': price,
    };
  }

  factory Burger.fromMap(Map<String, dynamic> map) {
    return Burger(
      ref: map['ref'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      thumbnail: map['thumbnail'] as String,
      price: map['price'] as int,
    );
  }

  @override
  List<Object?> get props => [ref, title, description, thumbnail, price];
}
