import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passhoard/app/models/credentials_input_model.dart';
import 'package:passhoard/app/utils/password_generator.dart';

class CredentialsFormController extends GetxController {
  RxList<CredentialsInput> credentialsInput = RxList.empty(growable: true);
  TextEditingController groupNameInput = TextEditingController();
  Rx<CredentialsInput> newCredentials = Rx(CredentialsInput.empty());

  void onNewCredentialsConfirm() {
    credentialsInput.add(newCredentials.value);
    newCredentials.value = CredentialsInput.empty();
    Get.back();
  }

  void removeCredentials(int index) {
    credentialsInput.removeAt(index);
  }

  void refreshPassword(CredentialsInput ci) {
    ci.passwordController.text = generatePassword();
  }

  void obscurePassword(CredentialsInput ci) {
    ci.hidePassword = !ci.hidePassword;
    credentialsInput.refresh();
  }
}
