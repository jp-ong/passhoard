// To parse this JSON data, do
//
//     final newCredentials = newCredentialsFromJson(jsonString);

import 'dart:convert';

List<NewCredentials> newCredentialsFromJson(String str) =>
    List<NewCredentials>.from(
        json.decode(str).map((x) => NewCredentials.fromJson(x)));

String newCredentialsToJson(List<NewCredentials> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewCredentials {
  String identifier;
  String password;

  NewCredentials({
    required this.identifier,
    required this.password,
  });

  factory NewCredentials.fromJson(Map<String, dynamic> json) => NewCredentials(
        identifier: json["identifier"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "password": password,
      };
}
