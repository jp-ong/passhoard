// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:passhoard/app/models/credential_model.dart';
import 'package:passhoard/app/models/credential_group_model.dart';
import 'package:passhoard/app/utils/password_generator.dart';

class CredentialsFormController extends GetxController {
  final Dio _dio = Dio();
  final API_BASE_URL = dotenv.env['API_BASE_URL'];

  RxList<CredentialInput> credentialInputs = RxList.empty(growable: true);
  TextEditingController groupNameInput = TextEditingController();
  Rx<CredentialInput> newCredentials = Rx(CredentialInput.empty());

  void onBottomSheetConfirm() {
    credentialInputs.add(newCredentials.value);
    newCredentials.value = CredentialInput.empty();
    Get.back();
  }

  void removeCredentials(int index) {
    credentialInputs.removeAt(index);
  }

  void refreshPassword(CredentialInput ci) {
    ci.passwordController.text = generatePassword();
  }

  void obscurePassword(CredentialInput ci) {
    ci.hidePassword = !ci.hidePassword;
    credentialInputs.refresh();
  }

  void submitCredentials() async {
    try {
      PostCredentialGroupDto postCredentialGroupReq =
          PostCredentialGroupDto(name: groupNameInput.text);

      final response = await _dio.post(
        '$API_BASE_URL/api/credential-groups',
        data: postCredentialGroupReq.toPostJson(),
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUyMTk4MTQ2LTg2MWQtNGE2MC1iMjM4LWY3MDg2NTc3NzBmYSIsImVtYWlsIjoiam9obnBhdWxvbmdAZW1haWwuY29tIiwiaWF0IjoxNjg5OTU0MDYyLCJleHAiOjE2OTI1NDYwNjJ9.MZgtQORXCPkD4Of7IDGY-xAFfHjbVHp1cuGO7e0ViYo'
          },
        ),
      );

      CredentialGroup newCredentialGroup =
          PostCredentialGroupDto.fromPostJson(response.data);

      List<Credential> credentials = credentialInputs.map((c) {
        return c.getCredential();
      }).toList();

      PostCredentialsDto newCredentials = PostCredentialsDto(
        credentialGroupId: newCredentialGroup.id,
        credentials: credentials,
      );

      await _dio.post(
        '$API_BASE_URL/api/credentials',
        data: newCredentials.toPostJson(),
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUyMTk4MTQ2LTg2MWQtNGE2MC1iMjM4LWY3MDg2NTc3NzBmYSIsImVtYWlsIjoiam9obnBhdWxvbmdAZW1haWwuY29tIiwiaWF0IjoxNjg5OTU0MDYyLCJleHAiOjE2OTI1NDYwNjJ9.MZgtQORXCPkD4Of7IDGY-xAFfHjbVHp1cuGO7e0ViYo'
          },
        ),
      );

      Get.back(result: true);
    } on DioException catch (e) {
      print(e);
    }
  }
}
