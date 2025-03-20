import 'dart:convert';

class Organizer {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  Organizer({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      phone: json['phone'],
      website: json['website'],
      company: json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }

  static List<Organizer> fromJsonList(String str) {
    return List<Organizer>.from(json.decode(str).map((x) => Organizer.fromJson(x)));
  }
}

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
    );
  }
}

class Geo {
  final String? lat;
  final String? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

}