import 'package:meta/meta.dart';
import 'dart:convert';

class AuthRequestModel {
    final String email;     //var email
    final String password;  //var pw

    AuthRequestModel({
        required this.email,      //konstruktor inisialisasi email
        required this.password,   //konstruktor inisialisasi pw
    });

    // sebuah factory method yang bertujuan untuk membuat objek AuthRequestModel dari sebuah string JSON.
    factory AuthRequestModel.fromJson(String str) => AuthRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap()); //methode mengkonversi objek jadi JSON String

    factory AuthRequestModel.fromMap(Map<String, dynamic> json) => AuthRequestModel(
        email: json["email"],       //mengisi variable dari nilai dalam map json
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
    };
}
