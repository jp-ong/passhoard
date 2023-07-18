// To parse this JSON data, do
//
//     final credentialGroups = credentialGroupsFromJson(jsonString);

import 'dart:convert';

List<CredentialGroup> credentialGroupsFromJson(String str) =>
    List<CredentialGroup>.from(
        json.decode(str).map((x) => CredentialGroup.fromJson(x)));

String credentialGroupsToJson(List<CredentialGroup> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CredentialGroup {
  String id;
  String name;
  String ownerId;
  DateTime createdAt;
  DateTime updatedAt;

  CredentialGroup({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CredentialGroup.fromJson(Map<String, dynamic> json) =>
      CredentialGroup(
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
