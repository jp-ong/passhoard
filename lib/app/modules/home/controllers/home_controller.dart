import 'package:get/get.dart';
import 'package:passhoard/app/models/credentials_group_model.dart';

class HomeController extends GetxController {
  List<CredentialsGroup> credentialGroups = [
    CredentialsGroup('Discord'),
    CredentialsGroup('Facebook'),
    CredentialsGroup('GitHub'),
    CredentialsGroup('Netflix'),
    CredentialsGroup('YouTube'),
  ];
}
