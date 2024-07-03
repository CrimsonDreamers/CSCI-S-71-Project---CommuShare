class Profile {
  final String id;
  final String name;
  final String email;
  final String password;
  final String? phone;
  final String? address;
  final String? city;
  final String? state;
  final String? zip;
  final String? photo;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.photo,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      password: json['password'],
      photo: json['photo'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'city': city,
        'state': state,
        'zip': zip,
        'password': password,
        'photo': photo,
        'id': id,
      };
}
