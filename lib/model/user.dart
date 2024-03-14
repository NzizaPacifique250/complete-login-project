import 'dart:convert';

class User {
  final String id;
  final String email;
  final String name;
  final String address;
  final String type;
  final String password;
  final String token;
  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.address,
      required this.type,
      required this.password,
      required this.token});

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['_id'].toString(),
        email: map['email'].toString(),
        name: map['name'].toString(),
        address: map['address'].toString(),
        password: map['password'],
        type: map['type'].toString(),
        token: map['token'].toString(),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "email": email,
      "name": name,
      "password": password,
      "address": address,
    };
  }

  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
