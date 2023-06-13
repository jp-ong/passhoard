import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:async/async.dart';

import 'package:passhoard/app/modules/credentials_form/models/credential_model.dart';
import 'package:passhoard/app/widgets/credentials_bottom_sheet.dart';

class CredentialsFormController extends GetxController {
  RxList<CredentialsModel> credentialsList = RxList.empty(growable: true);
  Rx<CredentialsModel> newCredentials = Rx(CredentialsModel());
  RxBool isCredentialsValid = false.obs;
  TextEditingController credentialsGroupName = TextEditingController();
  CancelableOperation<void>? _debounceOperation;

  void onNewCredentialsConfirm() {
    credentialsList.add(newCredentials.value);
    newCredentials.value = CredentialsModel();
    Get.back();
    validateCredentials();
  }

  void removeCredentialsItem(int index) {
    credentialsList.removeAt(index);
    validateCredentials();
  }

  void validateCredentials() {
    _debounceOperation?.cancel();
    _debounceOperation = CancelableOperation.fromFuture(
      Future.delayed(const Duration(milliseconds: 1000), () {
        bool isValid = true;
        isValid = credentialsList.isNotEmpty;
        isValid = isValid && credentialsGroupName.text.isNotEmpty;
        isValid = isValid &&
            !credentialsList.any((c) => c.passwordController.text.isEmpty);
        isCredentialsValid.value = isValid;
      }),
    );
  }

  @override
  void onReady() {
    super.onReady();
    Get.bottomSheet(
      CredentialsBottomSheet(
        credentials: newCredentials.value,
        onConfirm: onNewCredentialsConfirm,
      ),
    );
  }
}
