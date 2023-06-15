import 'package:passhoard/app/utils/uuid_generator.dart';

class Credentials {
  String credentialsId;
  String username;
  String password;
  DateTime lastModified;
  String groupId;

  Credentials(
    this.username,
    this.password,
    this.groupId, {
    credentialsId,
    lastModified,
  })  : credentialsId = credentialsId ?? generateUUID(),
        lastModified = DateTime.now();
}
