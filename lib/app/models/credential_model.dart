import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Credential> credentialsFromJson(String str) {
  return List<Credential>.from(
    json.decode(str).map((x) {
      return Credential.fromJson(x);
    }),
  );
}

class Credential {
  String? id;
  String identifier;
  String password;
  String? credentialGroupId;
  String? ownerId;
  DateTime createdAt;
  DateTime updatedAt;

  Credential({
    this.id,
    required this.identifier,
    required this.password,
    this.credentialGroupId,
    this.ownerId,
    createdAt,
    updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Credential.fromJson(Map<String, dynamic> json) {
    return Credential(
      id: json['id'],
      identifier: json['identifier'],
      password: json['password'],
      credentialGroupId: json['credentialGroupId'],
      ownerId: json['ownerId'],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  TextEditingController identifierController() {
    return TextEditingController(text: identifier);
  }

  TextEditingController passwordController() {
    return TextEditingController(text: password);
  }
}

class PostCredentialsDto {
  final String credentialGroupId;
  final List<Credential> credentials;

  PostCredentialsDto({
    required this.credentialGroupId,
    required this.credentials,
  });

  Map<String, dynamic> _credentialsToJson(Credential credentials) {
    return {
      'identifier': credentials.identifier,
      'password': credentials.password,
    };
  }

  // POST Request Body
  Map<String, dynamic> toPostJson() {
    return {
      'credentialGroupId': credentialGroupId,
      'credentials': credentials.map((c) => _credentialsToJson(c)).toList(),
    };
  }
}

class CredentialInput {
  TextEditingController identifierController;
  TextEditingController passwordController;
  bool hidePassword = true;

  CredentialInput(this.identifierController, this.passwordController);

  factory CredentialInput.fromText(String username, String password) {
    return CredentialInput(
      TextEditingController(text: username),
      TextEditingController(text: password),
    );
  }

  factory CredentialInput.empty() {
    return CredentialInput(
      TextEditingController(),
      TextEditingController(),
    );
  }

  Credential getCredential() {
    return Credential(
      identifier: identifierController.text,
      password: passwordController.text,
    );
  }
}
