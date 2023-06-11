import 'package:get/get.dart';

import '../controllers/credentials_form_controller.dart';

class CredentialsFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CredentialsFormController>(
      () => CredentialsFormController(),
    );
  }
}
