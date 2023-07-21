// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:passhoard/app/models/credential_group_model.dart';

class HomeController extends GetxController {
  final dio = Dio();
  final API_BASE_URL = dotenv.env['API_BASE_URL'];

  RxBool isLoading = false.obs;
  RxList<CredentialGroup> credentialGroups = RxList.empty(growable: true);

  void getCredentialGroups() async {
    try {
      final response = await dio.get(
        '$API_BASE_URL/api/credential-groups',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUyMTk4MTQ2LTg2MWQtNGE2MC1iMjM4LWY3MDg2NTc3NzBmYSIsImVtYWlsIjoiam9obnBhdWxvbmdAZW1haWwuY29tIiwiaWF0IjoxNjg5OTU0MDYyLCJleHAiOjE2OTI1NDYwNjJ9.MZgtQORXCPkD4Of7IDGY-xAFfHjbVHp1cuGO7e0ViYo'
          },
        ),
      );

      credentialGroups.value =
          credentialGroupsFromJson(jsonEncode(response.data));
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCredentialGroups();
  }
}
