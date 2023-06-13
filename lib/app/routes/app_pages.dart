// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/credentials_form/bindings/credentials_form_binding.dart';
import '../modules/credentials_form/views/credentials_form_view.dart';
import '../modules/credentials/bindings/credentials_binding.dart';
import '../modules/credentials/views/credentials_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CREDENTIALS,
      page: () => const CredentialsView(),
      binding: CredentialsBinding(),
    ),
    GetPage(
      name: _Paths.CREDENTIALS_FORM,
      page: () => const CredentialsFormView(),
      binding: CredentialsFormBinding(),
    ),
  ];
}
