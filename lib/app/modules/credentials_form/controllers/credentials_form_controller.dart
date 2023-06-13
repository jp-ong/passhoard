import 'package:get/get.dart';
import 'package:passhoard/app/modules/credentials_form/models/credential_model.dart';
import 'package:passhoard/app/widgets/credentials_bottom_sheet.dart';

class CredentialsFormController extends GetxController {
  RxList<CredentialsModel> credentialsList = RxList.empty(growable: true);
  Rx<CredentialsModel> newCredentials = Rx(CredentialsModel());

  void onNewCredentialsConfirm() {
    credentialsList.add(newCredentials.value);
    newCredentials.value = CredentialsModel();
    Get.back();
  }

  void removeCredentialsItem(int index) {
    credentialsList.removeAt(index);
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
