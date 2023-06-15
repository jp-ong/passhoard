class Credentials {
  String credentialsId;
  String username;
  String password;
  DateTime lastModified;

  Credentials(
    this.username,
    this.password, {
    credentialsId,
    lastModified,
  })  : credentialsId = "123",
        lastModified = DateTime.now();
}
