class CredentialDto {
  final String id;
  final String identifier;
  final String password;
  final String credentialGroupId;
  final String ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;

  CredentialDto({
    required this.id,
    required this.identifier,
    required this.password,
    required this.credentialGroupId,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CredentialDto.fromJson(Map<String, dynamic> json) {
    return CredentialDto(
      id: json['id'],
      identifier: json['identifier'],
      password: json['password'],
      credentialGroupId: json['credentialGroupId'],
      ownerId: json['ownerId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "identifier": identifier,
      "password": password,
      "credentialGroupId": credentialGroupId,
      "ownerId": ownerId,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}

class PostCredentialsDto {
  final String credentialGroupId;
  final List<Map<String, String>> credentials;

  PostCredentialsDto({
    required this.credentialGroupId,
    required this.credentials,
  });

  // POST Request Body
  Map<String, dynamic> toPostJson() {
    return {
      'credentialGroupId': credentialGroupId,
      'credentials': credentials,
    };
  }
}
