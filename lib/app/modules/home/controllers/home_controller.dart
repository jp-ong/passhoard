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
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUyMTk4MTQ2LTg2MWQtNGE2MC1iMjM4LWY3MDg2NTc3NzBmYSIsImVtYWlsIjoiam9obnBhdWxvbmdAZW1haWwuY29tIiwiaWF0IjoxNjg5Nzc2MjI2LCJleHAiOjE2ODk4MTk0MjZ9.Rm_N2Q9K3NUSLbjefU9bG1UEy0T5dnzm_1yX4ALiuwA'
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
