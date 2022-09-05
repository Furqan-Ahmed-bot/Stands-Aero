import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/auth/emaillogin.dart';

class MainLoginScreen extends StatelessWidget {
  const MainLoginScreen({Key? key}) : super(key: key);

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
              height: res_height * 0.125,
            ),
            Text(
              'Social Login',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 28),
            ),
            SizedBox(
              height: res_height * 0.05,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => EmailLoginScreen());
              },
              child: Container(
                width: res_width * 0.9,
                decoration: BoxDecoration(
                    color: Color(0xffaf8a39),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 25,
                          height: 25,
                          child: Image.asset('assets/slicing/Untitled-19.png')),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Login With Email',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: res_height * 0.0125,
            ),
            Container(
              width: res_width * 0.9,
              decoration: BoxDecoration(
                  color: Color(0xff1773ea),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 25,
                        height: 25,
                        child: Image.asset('assets/slicing/Untitled-20.png')),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login With Facebook',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: res_height * 0.0125,
            ),
            Container(
              width: res_width * 0.9,
              decoration: BoxDecoration(
                  color: Color(0xffff4c26),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 25,
                        height: 25,
                        child: Image.asset('assets/slicing/Untitled-21.png')),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login With Google',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: res_height * 0.0125,
            ),
            Container(
              width: res_width * 0.9,
              decoration: BoxDecoration(
                  color: Color(0xff080808),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 25,
                        height: 25,
                        child: Image.asset('assets/slicing/Untitled-22.png')),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login With Apple',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
