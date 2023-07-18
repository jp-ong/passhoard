import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:passhoard/app/models/credential_group_model.dart';

class HomeController extends GetxController {
  final dio = Dio();

  RxBool isLoading = false.obs;
  RxList<CredentialGroup> credentialGroups = RxList.empty(growable: true);

  void getCredentialGroups() async {
    try {
      final response = await dio.get(
        'http://192.168.153.150:5000/api/credential-groups',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImY1MzRjZWEwLWMzOTQtNGUxMC05OGMxLWNhNzhhN2RmNzUzNyIsImVtYWlsIjoiam9obnBhdWxvbmdAZW1haWwuY29tIiwiaWF0IjoxNjg5NjY0MDY1LCJleHAiOjE2ODk3MDcyNjV9.JGim5HPsnZCA1_mYm77YT4SpUfkOR_BMDVd-znu7aV0'
          },
        ),
      );

      credentialGroups.value =
          credentialGroupsFromJson(jsonEncode(response.data));
      print(response.data);
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
