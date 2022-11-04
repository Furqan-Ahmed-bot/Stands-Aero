import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stande_aero/screens/List%20Quotes/quotes.dart';
import 'package:stande_aero/screens/auth/emaillogin.dart';
import 'package:stande_aero/screens/booking/booking.dart';
import 'package:stande_aero/screens/mainhome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Map<int, Color> _yellow700Map = {
      50: Color(0xffbd9f50),
      100: Color(0xffbd9f50),
      200: Color(0xffbd9f50),
      300: Color(0xffbd9f50),
      400: Color(0xffbd9f50),
      500: Color(0xffbd9f50),
      600: Color(0xffbd9f50),
      700: Color(0xffbd9f50),
      800: Color(0xffbd9f50),
      900: Color(0xffbd9f50),
    };
    final MaterialColor _yellow700Swatch =
        MaterialColor(Color(0xffbd9f50).value, _yellow700Map);
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: Duration(seconds: 1),
      debugShowCheckedModeBanner: false,
      title: 'National Aero Stands',
      theme: ThemeData(textTheme: GoogleFonts.openSansTextTheme(),
        primarySwatch: _yellow700Swatch,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    start();
    super.initState();
  }

  start() {
    Timer(Duration(seconds: 2), () => Get.to(() => EmailLoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: Image.asset('assets/slicing/Untitled-2.png')),
      ),
    );
  }
}
