import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mid_ex_flutter/view/screens/home_screen.dart';
import 'package:mid_ex_flutter/view/screens/login_screen.dart';
import 'package:mid_ex_flutter/view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/splash", page: () => SplashScreen()),
        GetPage(name: "/home", page: () => HomeScreen()),
        GetPage(name: "/login", page: () => LoginScreen()),
      ],
    );}}