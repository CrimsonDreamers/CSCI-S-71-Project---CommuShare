import 'package:commushare_front/model/availability.dart';

class Item {
  final String id;
  final String name;
  final String? description;
  final String? owner;
  final String? category;
  final String? image;
  final Availability availability;

  Item({
    required this.id,
    required this.name,
    this.description,
    this.owner,
    this.category,
    this.image,
    this.availability=const Availability(available: true),
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      description: json['description'],
      owner: json['owner'],
      image: json['image'],
      category: json['category'],
      id: json['id'],
      availability: Availability.fromJson(json['availability']),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'owner': owner,
        'image': image,
        'category': category,
        'id': id,
        'availability': availability.toJson(),
      };
}
