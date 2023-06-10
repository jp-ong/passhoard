import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Color blackDark = const Color(0xFF202223);
  Color blackLight = const Color(0xFF252728);

  Color redDark = const Color(0xFF733826);
  Color redLight = const Color(0xFFFF754C);

  Color blueDark = const Color(0xFF265373);
  Color blueLight = const Color(0xFF4DB6FF);

  Color whiteDark = const Color(0xFFB3B3B3);
  Color whiteLight = const Color(0xFFFDFFFC);

  AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: blackDark,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(size: 16, color: blueLight),
    actionsIconTheme: IconThemeData(size: 16, color: blueLight),
    titleTextStyle: GoogleFonts.rubik(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: whiteDark,
    ),
  );

  IconButtonThemeData iconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      fixedSize: const Size(40, 40),
    ),
  );

  IconThemeData iconTheme = const IconThemeData(size: 16);

  ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.rubikTextTheme(const TextTheme()),
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      background: blackDark,
      onBackground: whiteLight,
      primary: blueLight,
      onPrimary: blackDark,
      primaryContainer: blueDark,
      onPrimaryContainer: whiteLight,
    ),
    scaffoldBackgroundColor: blackDark,
    appBarTheme: appBarTheme,
    iconButtonTheme: iconButtonTheme,
    iconTheme: iconTheme,
  );

  runApp(
    GetMaterialApp(
      title: "Passhord",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
    ),
  );
}
