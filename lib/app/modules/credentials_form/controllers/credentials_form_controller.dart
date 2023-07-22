// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:passhoard/app/models/credentials_input_model.dart';
import 'package:passhoard/app/modules/credentials_form/models/new_credential_group_model.dart';
import 'package:passhoard/app/modules/credentials_form/models/new_credentials_model.dart';
import 'package:passhoard/app/utils/password_generator.dart';

class CredentialsFormController extends GetxController {
  final Dio _dio = Dio();
  final API_BASE_URL = dotenv.env['API_BASE_URL'];

  RxList<CredentialsInput> credentialsInput = RxList.empty(growable: true);
  TextEditingController groupNameInput = TextEditingController();
  Rx<CredentialsInput> newCredentials = Rx(CredentialsInput.empty());

  void onBottomSheetConfirm() {
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

  void submitCredentials() async {
    try {
      final response = await _dio.post(
        '$API_BASE_URL/api/credential-groups',
        data: {
          'name': groupNameInput.text,
        },
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUyMTk4MTQ2LTg2MWQtNGE2MC1iMjM4LWY3MDg2NTc3NzBmYSIsImVtYWlsIjoiam9obnBhdWxvbmdAZW1haWwuY29tIiwiaWF0IjoxNjg5OTU0MDYyLCJleHAiOjE2OTI1NDYwNjJ9.MZgtQORXCPkD4Of7IDGY-xAFfHjbVHp1cuGO7e0ViYo'
          },
        ),
      );

      NewCredentialGroup newCredentialGroup =
          newCredentialGroupFromJson(jsonEncode(response.data));

      List<NewCredentials> credentials = credentialsInput.map((c) {
        return NewCredentials(
          identifier: c.usernameController.text,
          password: c.passwordController.text,
        );
      }).toList();

      await _dio.post(
        '$API_BASE_URL/api/credentials',
        data: {
          'credentialGroupId': newCredentialGroup.id,
          'credentials': jsonDecode(newCredentialsToJson(credentials))
        },
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
