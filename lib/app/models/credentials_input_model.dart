import 'package:flutter/widgets.dart';

class CredentialsInput {
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool hidePassword = true;

  CredentialsInput(this.usernameController, this.passwordController);

  factory CredentialsInput.fromText(String username, String password) {
    return CredentialsInput(
      TextEditingController(text: username),
      TextEditingController(text: password),
    );
  }

  factory CredentialsInput.empty() {
    return CredentialsInput(
      TextEditingController(),
      TextEditingController(),
    );
  }
}
