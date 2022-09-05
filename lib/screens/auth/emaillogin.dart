import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/helper/colors.dart';
import 'package:stande_aero/screens/auth/register.dart';
import 'package:stande_aero/screens/home/home.dart';
import 'package:stande_aero/screens/mainhome.dart';
import 'package:stande_aero/screens/payment/awaiting.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: res_height * 0.125,
            ),
            Container(
                width: res_width * 0.85,
                child: Image.asset('assets/slicing/Untitled-2.png')),
            SizedBox(
              height: res_height * 0.1,
            ),
            Text(
              'Login',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 28),
            ),
            SizedBox(
              height: res_height * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: new InputDecoration(
                  hintText: 'Email Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                  hintStyle: TextStyle(),
                  contentPadding: EdgeInsets.only(top: 16, left: 16),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ImageIcon(
                      AssetImage("assets/slicing/Untitled-23.png"),
                      color: kPrimaryColor,
                      //  size: 20,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: res_height * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: new InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                  hintStyle: TextStyle(),
                  contentPadding: EdgeInsets.only(top: 16, left: 16),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ImageIcon(
                      AssetImage("assets/slicing/Untitled-24.png"),
                      color: kPrimaryColor,
                      //  size: 20,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: res_height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => MainScreen());
              },
              child: Container(
                width: res_width * 0.9,
                decoration: BoxDecoration(
                    color: Color(0xffaf8a39),
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: res_height * 0.035,
            ),
            Text(
              'Forgot Password?',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: res_height * 0.13,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => RegisterScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Signup',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
