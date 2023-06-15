import 'package:get/get.dart';
import 'package:passhoard/app/models/credential_group_model.dart';

class HomeController extends GetxController {
  List<CredentialGroup> credentialGroups = [
    CredentialGroup('Discord'),
    CredentialGroup('Facebook'),
    CredentialGroup('GitHub'),
    CredentialGroup('Netflix'),
    CredentialGroup('YouTube'),
  ];
}
