// import 'package:get_storage/get_storage.dart';
import 'package:passhoard/app/models/credentials_model.dart';

class CredentialsGroupModel {
  String groupName;
  List<CredentialsModel> credentials;

  CredentialsGroupModel({
    required this.groupName,
    required this.credentials,
  });

  void save() async {
    // final box = GetStorage('passhoard');
    // await box.write(groupName, [
    //   ...credentials.map((c) {
    //     return {
    //       'username': c.usernameController.text,
    //       'password': c.passwordController.text
    //     };
    //   })
    // ]);
  }
}
