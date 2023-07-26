// To parse this JSON data, do
//
//     final credentials = credentialsFromJson(jsonString);

import 'dart:convert';

List<CredentialsDto> credentialsFromJson(String str) =>
    List<CredentialsDto>.from(
        json.decode(str).map((x) => CredentialsDto.fromJson(x)));

String credentialsToJson(List<CredentialsDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CredentialsDto {
  String id;
  String identifier;
  String password;
  String credentialGroupId;
  String ownerId;
  DateTime createdAt;
  DateTime updatedAt;

  CredentialsDto({
    required this.id,
    required this.identifier,
    required this.password,
    required this.credentialGroupId,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CredentialsDto.fromJson(Map<String, dynamic> json) => CredentialsDto(
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
