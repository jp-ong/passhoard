// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:passhoard/app/models/credential_group_model.dart';
import 'package:passhoard/app/models/credentials_input_model.dart';
import 'package:passhoard/app/modules/credentials/models/credentials_model.dart';

class CredentialsController extends GetxController {
  final Dio _dio = Dio();
  final API_BASE_URL = dotenv.get('API_BASE_URL');
  final CredentialGroup cg = Get.arguments['credentialGroup'];

  RxList<Credentials> credentials = RxList.empty(growable: true);

  late TextEditingController credentialGroupNameInput;
  RxList<CredentialsInput> credentialInputs = RxList.empty(growable: true);

  void getCredentials() async {
    try {
      credentialGroupNameInput = TextEditingController(text: cg.name);

      final response = await _dio.get(
        '$API_BASE_URL/api/credentials/${cg.id}',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUyMTk4MTQ2LTg2MWQtNGE2MC1iMjM4LWY3MDg2NTc3NzBmYSIsImVtYWlsIjoiam9obnBhdWxvbmdAZW1haWwuY29tIiwiaWF0IjoxNjg5OTU0MDYyLCJleHAiOjE2OTI1NDYwNjJ9.MZgtQORXCPkD4Of7IDGY-xAFfHjbVHp1cuGO7e0ViYo'
          },
        ),
      );

      credentials.value = credentialsFromJson(jsonEncode(response.data));

      credentialInputs.addAll(credentials.map((c) {
        return CredentialsInput(
          TextEditingController(text: c.identifier),
          TextEditingController(text: c.password),
        );
      }));
    } on DioException catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCredentials();
  }
}
