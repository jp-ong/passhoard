class CredentialGroupDto {
  final String id;
  final String name;
  final String ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;

  CredentialGroupDto({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CredentialGroupDto.fromJson(Map<String, dynamic> json) {
    return CredentialGroupDto(
      id: json['id'],
      name: json['name'],
      ownerId: json['ownerId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "ownerId": ownerId,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
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
  static CredentialGroupDto fromPostJson(Map<String, dynamic> json) {
    return CredentialGroupDto.fromJson(json);
  }
}
