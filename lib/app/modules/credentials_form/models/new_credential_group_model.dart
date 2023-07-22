// To parse this JSON data, do
//
//     final newCredentialGroup = newCredentialGroupFromJson(jsonString);

import 'dart:convert';

NewCredentialGroup newCredentialGroupFromJson(String str) =>
    NewCredentialGroup.fromJson(json.decode(str));

String newCredentialGroupToJson(NewCredentialGroup data) =>
    json.encode(data.toJson());

class NewCredentialGroup {
  String id;
  String name;
  String ownerId;
  DateTime createdAt;
  DateTime updatedAt;

  NewCredentialGroup({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewCredentialGroup.fromJson(Map<String, dynamic> json) =>
      NewCredentialGroup(
        id: json["id"],
        name: json["name"],
        ownerId: json["ownerId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ownerId": ownerId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
