import 'package:commushare_front/model/availability.dart';

class Item {
  final String id;
  final String name;
  final String location;
  final String? description;
  final String owner;
  final String? category;
  final String? image;
  final Availability availability;

  Item({
    required this.id,
    required this.name,
    this.location = "Harvard Yard",
    this.description,
    this.owner = "Harvard University",
    this.category,
    this.image,
    this.availability = const Availability(available: true),
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      description: json['description'] ?? "",
      owner: json['owner'] ?? "Harvard University",
      location: json['location'] ?? "Harvard Yard",
      image: json['image'] ?? "",
      category: json['category'] ?? "",
      id: json['id'],
      availability: Availability.fromJson(json['availability']),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'owner': owner,
    'location': location,
    'image': image,
    'category': category,
    'id': id,
    'availability': availability.toJson(),
  };

  void setAvailability(Availability availability) {

  }
}
