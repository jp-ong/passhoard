import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init('passhoard');
  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();

  Color blackDark = const Color(0xFF202223);
  Color blackLight = const Color(0xFF2D2E2F);

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
      iconSize: 16,
    ),
  );

  IconThemeData iconTheme = IconThemeData(size: 16, color: blueLight);

  InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      color: whiteDark,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: blackLight,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    constraints: const BoxConstraints(minHeight: 40, maxHeight: 40),
  );

  ListTileThemeData listTileThemeData = ListTileThemeData(
    tileColor: blackLight,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: whiteLight,
    ),
    subtitleTextStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: whiteDark,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    iconColor: blueLight,
  );

  ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size(0, 40),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );

  OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size(0, 40),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );

  TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: whiteDark,
      minimumSize: const Size(0, 40),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );

  FloatingActionButtonThemeData floatingActionButtonThemeData =
      FloatingActionButtonThemeData(backgroundColor: blueLight);

  ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.rubikTextTheme(
      TextTheme(
        titleMedium: TextStyle(
          fontSize: 14,
          color: whiteDark,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          color: whiteDark,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: whiteLight,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: whiteLight,
        ),
        displayMedium: TextStyle(
          fontSize: 14,
          color: whiteLight,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          fontSize: 12,
          color: whiteLight,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      background: blackDark,
      onBackground: whiteLight,
      primary: blueLight,
      onPrimary: blackDark,
      primaryContainer: blueDark,
      onPrimaryContainer: whiteLight,
      surface: blackLight,
      onSurface: whiteDark,
      error: redLight,
      errorContainer: redDark,
    ),
    scaffoldBackgroundColor: blackDark,
    appBarTheme: appBarTheme,
    iconButtonTheme: iconButtonTheme,
    iconTheme: iconTheme,
    inputDecorationTheme: inputDecorationTheme,
    listTileTheme: listTileThemeData,
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    textButtonTheme: textButtonThemeData,
    floatingActionButtonTheme: floatingActionButtonThemeData,
  );

  runApp(
    GetMaterialApp(
      title: "Passhoard",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
    ),
  );
}
