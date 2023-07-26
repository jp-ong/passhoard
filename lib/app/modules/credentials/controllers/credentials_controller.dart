// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:passhoard/app/models/credential_group_model.dart';
import 'package:passhoard/app/models/credential_model.dart';

class CredentialsController extends GetxController {
  final Dio _dio = Dio();
  final API_BASE_URL = dotenv.get('API_BASE_URL');
  final CredentialGroup credentialGroup = Get.arguments['credentialGroup'];

  RxList<Credential> credentials = RxList.empty(growable: true);

  late TextEditingController credentialGroupNameInput;

  void getCredentials() async {
    try {
      credentialGroupNameInput = credentialGroup.nameController();

      final response = await _dio.get(
        '$API_BASE_URL/api/credentials/${credentialGroup.id}',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUyMTk4MTQ2LTg2MWQtNGE2MC1iMjM4LWY3MDg2NTc3NzBmYSIsImVtYWlsIjoiam9obnBhdWxvbmdAZW1haWwuY29tIiwiaWF0IjoxNjg5OTU0MDYyLCJleHAiOjE2OTI1NDYwNjJ9.MZgtQORXCPkD4Of7IDGY-xAFfHjbVHp1cuGO7e0ViYo'
          },
        ),
      );

      credentials.value = credentialsFromJson(jsonEncode(response.data));
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
