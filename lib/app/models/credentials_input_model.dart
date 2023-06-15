import 'package:flutter/widgets.dart';

class CredentialsInput {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  CredentialsInput(this.usernameController, this.passwordController);

  factory CredentialsInput.fromText(String username, String password) {
    return CredentialsInput(
      TextEditingController(text: username),
      TextEditingController(text: password),
    );
  }
}
