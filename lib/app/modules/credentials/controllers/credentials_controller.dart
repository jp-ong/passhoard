import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passhoard/app/models/credentials_group_model.dart';
import 'package:passhoard/app/models/credentials_input_model.dart';
import 'package:passhoard/app/models/credentials_model.dart';

class CredentialsController extends GetxController {
  late CredentialsGroup credentialGroup;

  List<Credentials> credentials = [
    Credentials('japlong', 'JohnPaulOng1234!', 'netflix-1234'),
    Credentials('swantik', 'Mother1234!', 'netflix-1234'),
    Credentials('don', 'Father1234!', 'netflix-1234'),
  ];

  late TextEditingController credentialGroupNameInput;
  RxList<CredentialsInput> credentialInputs = RxList.empty(growable: true);

  void fetchCredentialGroup() {
    String credentialGroupId = Get.arguments;
    credentialGroup = CredentialsGroup.getById(credentialGroupId);
  }

  void buildTextControllers() {
    credentialGroupNameInput =
        TextEditingController(text: credentialGroup.groupName);
    credentialInputs.value = [
      ...credentials
          .map((c) => CredentialsInput.fromText(c.username, c.password))
    ];
  }

  @override
  void onInit() {
    super.onInit();
    fetchCredentialGroup();
    buildTextControllers();
  }
}
