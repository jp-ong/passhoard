import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/credentials_form_controller.dart';

class CredentialsFormView extends GetView<CredentialsFormController> {
  const CredentialsFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CredentialsFormView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CredentialsFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
