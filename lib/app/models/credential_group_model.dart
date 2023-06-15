import 'package:passhoard/app/utils/uuid_generator.dart';

class CredentialGroup {
  String groupId;
  String groupName;
  DateTime lastModified;

  CredentialGroup(
    this.groupName, {
    groupId,
    lastModified,
  })  : groupId = groupId ?? generateUUID(),
        lastModified = lastModified ?? DateTime.now();

  factory CredentialGroup.get(String groupId) {
    return CredentialGroup(
      'Netflix',
      groupId: groupId,
      lastModified: DateTime.now(),
    );
  }
}
