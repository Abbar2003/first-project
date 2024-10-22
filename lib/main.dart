import 'package:admin2/constants.dart';
import 'package:admin2/views/Add_Doctor.dart';
import 'package:admin2/views/Add_Student.dart';
import 'package:admin2/views/home_screen.dart';
import 'package:admin2/views/login_screen.dart';
import 'package:admin2/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? Auth;

Future<void> main() async {
  Auth = await SharedPreferences.getInstance();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 48),
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      initialRoute: 'WelcomeScreen',
      getPages: [
        GetPage(
          name: '/WelcomeScreen',
          page: () => const WelcomeScreen(),
        ),
        GetPage(
          name: '/LoginScreen',
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: '/HomePage',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/AddStudent',
          page: () => const AddStudent(),
        ),
        GetPage(
          name: '/AddDoctor',
          page: () => const AddDoctor(),
        ),
      ],
    ),
  );
}
