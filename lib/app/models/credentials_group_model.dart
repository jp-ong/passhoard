import 'package:passhoard/app/utils/uuid_generator.dart';

class CredentialsGroup {
  String groupId;
  String groupName;
  DateTime lastModified;

  CredentialsGroup(
    this.groupName, {
    groupId,
    lastModified,
  })  : groupId = groupId ?? generateUUID(),
        lastModified = lastModified ?? DateTime.now();

  factory CredentialsGroup.getById(String groupId) {
    return CredentialsGroup(
      'Netflix',
      groupId: groupId,
      lastModified: DateTime.now(),
    );
  }
}
