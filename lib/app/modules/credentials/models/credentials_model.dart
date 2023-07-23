// To parse this JSON data, do
//
//     final credentials = credentialsFromJson(jsonString);

import 'dart:convert';

List<Credentials> credentialsFromJson(String str) => List<Credentials>.from(
    json.decode(str).map((x) => Credentials.fromJson(x)));

String credentialsToJson(List<Credentials> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Credentials {
  String id;
  String identifier;
  String password;
  String credentialGroupId;
  String ownerId;
  DateTime createdAt;
  DateTime updatedAt;

  Credentials({
    required this.id,
    required this.identifier,
    required this.password,
    required this.credentialGroupId,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        id: json["id"],
        identifier: json["identifier"],
        password: json["password"],
        credentialGroupId: json["credentialGroupId"],
        ownerId: json["ownerId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "identifier": identifier,
        "password": password,
        "credentialGroupId": credentialGroupId,
        "ownerId": ownerId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
