import 'dart:async';
import 'dart:developer';

import 'package:StandsAero/screens/auth/emaillogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/remote_services.dart';

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
      title: 'Stands Aero',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
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

  start() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.getString('email') != null) {
      var sendData = {
        "email":
            pref.getString('email'), // "hammadkhaultz@gmail.com", //email.text,
        "password": pref.getString('password'), //"password", //password.text,
        "device_token": "123654"
      };

      ApiService().login(context, sendData, loader: true);
    } else {
      Timer(Duration(seconds: 2), () => Get.offAll(() => EmailLoginScreen()));
    }

    log('start called');
    // Timer(
    //   Duration(seconds: 2),
    //   () => Get.offAll(() =>
    //       pref.getString('email') == null ? EmailLoginScreen() : HomeScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        //child: Center(child: Image.asset('assets/slicing/Untitled-2.png')),
      ),
    );
  }
}
