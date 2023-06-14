import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CredentialsController extends GetxController {
  final box = GetStorage('passhoard');

  void loadCredentials() {
    print(box.read('fgdgfdg'));
  }
}
