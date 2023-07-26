import 'dart:convert';

import 'package:flutter/material.dart';

List<CredentialGroup> credentialGroupsFromJson(String str) {
  return List<CredentialGroup>.from(
    json.decode(str).map((x) {
      return CredentialGroup.fromJson(x);
    }),
  );
}

class CredentialGroup {
  final String id;
  final String name;
  final String ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;

  CredentialGroup({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CredentialGroup.fromJson(Map<String, dynamic> json) {
    return CredentialGroup(
      id: json['id'],
      name: json['name'],
      ownerId: json['ownerId'],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  TextEditingController nameController() {
    return TextEditingController(text: name);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "ownerId": ownerId,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}

class PostCredentialGroupDto {
  final String name;

  PostCredentialGroupDto({
    required this.name,
  });

  // POST Request Body
  Map<String, dynamic> toPostJson() {
    return {
      'name': name,
    };
  }

  // POST Response Body
  static CredentialGroup fromPostJson(Map<String, dynamic> json) {
    return CredentialGroup.fromJson(json);
  }
}
