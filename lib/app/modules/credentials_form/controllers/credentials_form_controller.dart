import 'package:get/get.dart';
import 'package:passhoard/app/modules/credentials_form/models/credential_model.dart';

class CredentialsFormController extends GetxController {
  RxList<CredentialsModel> credentialsList = RxList([CredentialsModel()]);
  Rx<CredentialsModel> newCredentials = Rx(CredentialsModel());
}
