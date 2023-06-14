import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:async/async.dart';
import 'package:get_storage/get_storage.dart';
import 'package:passhoard/app/models/credentials_input_model.dart';
// import 'package:passhoard/app/models/credentials_model.dart';
import 'package:passhoard/app/widgets/credentials_bottom_sheet.dart';

class CredentialsFormController extends GetxController {
  CancelableOperation<void>? _debounceOperation;

  TextEditingController credentialsGroupName = TextEditingController();
  RxList<CredentialsInputModel> credentialsInputList =
      RxList.empty(growable: true);
  Rx<CredentialsInputModel> newCredentialsInput = Rx(CredentialsInputModel());
  RxBool isCredentialsValid = false.obs;

  void onAddPasswordConfirm() {
    credentialsInputList.add(newCredentialsInput.value);
    newCredentialsInput.value = CredentialsInputModel();
    Get.back();
    validateCredentials();
  }

  void removeCredentialsItem(int index) {
    credentialsInputList.removeAt(index);
    validateCredentials();
  }

  void validateCredentials() {
    _debounceOperation?.cancel();
    _debounceOperation = CancelableOperation.fromFuture(
      Future.delayed(const Duration(milliseconds: 1000), () {
        bool isValid = true;
        isValid = credentialsInputList.isNotEmpty;
        isValid = isValid && credentialsGroupName.text.isNotEmpty;
        isValid = isValid &&
            !credentialsInputList.any((c) => c.passwordController.text.isEmpty);
        isCredentialsValid.value = isValid;
      }),
    );
  }

  void onCredentialsConfirm() async {
    final box = GetStorage('passhoard');
    await box.write(credentialsGroupName.text, [
      ...credentialsInputList.map((ci) {
        return {
          'username': ci.usernameController.text,
          'password': ci.passwordController.text,
        };
      })
    ]);
    await box.write('passhoard-keys', [
      ...box.read('passhoard-keys'),
      credentialsGroupName.text,
    ]);
  }

  @override
  void onReady() {
    super.onReady();
    Get.bottomSheet(
      CredentialsBottomSheet(
        credentials: newCredentialsInput.value,
        onConfirm: onAddPasswordConfirm,
      ),
    );
  }
}
