import 'package:meta/meta.dart';
import 'dart:convert';

class AuthResponseModel {
    final String jwtToken;
    final User user;

    AuthResponseModel({
        required this.jwtToken,
        required this.user,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        jwtToken: json["jwt-token"],
        user: User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "jwt-token": jwtToken,
        "user": user.toMap(),
    };
}

class User {
    final int id;
    final String name;
    final String email;
    final String roles;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.roles,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": roles,
    };
}
