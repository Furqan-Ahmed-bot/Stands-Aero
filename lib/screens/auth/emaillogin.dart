import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/contrloller/usercontroller.dart';
import 'package:stande_aero/helper/colors.dart';
import 'package:stande_aero/helper/global.dart';
import 'package:stande_aero/helper/model.dart';
import 'package:stande_aero/screens/auth/register.dart';
import 'package:stande_aero/screens/home/home.dart';
import 'package:stande_aero/screens/mainhome.dart';
import 'package:stande_aero/screens/payment/awaiting.dart';
import 'package:http/http.dart' as http;

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String apiGlobal = "https://qtdev.the4loop.com/api/";

  var user = UserModel();
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/slicing/Untitled-1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
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
                  child: TextFormField(
                    controller: email,
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
                    validator: (text) {
                      if (text == null ||
                          text.isEmpty ||
                          text.length < 5 ||
                          !text.contains("@")) {
                        return 'Enter Valid Email !';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: res_height * 0.01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: password,
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
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Enter Valid Password !';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: res_height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    print("login");

                    if (_formKey.currentState!.validate()) {
                      login();
                    }
                    // Get.to(() => MainScreen());
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
        ),
      ),
    );
  }

  login() async {
    final uri = Uri.parse('${apiGlobal}user/login');

    print(uri);

    var sendData = {
      "email": email.text,
      "password": password.text,
    };

    String jsonBody = json.encode(sendData);

    final headers = {'Content-Type': 'application/json'};

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    print(response.statusCode);

    print(response.body);

    var res_data = json.decode(response.body.toString());

    print(res_data);
    if (res_data["status"] == true) {
      UserController userController = UserController();
      userController.addUser(
        UserModel(
          id: res_data['data']['user']['id'],
          fullName: res_data['data']['user']['full_name'],
          phone: res_data['data']['user']['phone'],
          email: res_data['data']['user']['email'],
          propic: res_data['data']['user']['propic'],
          city: res_data['data']['user']['city'],
          country: res_data['data']['user']['country'],
          desc: res_data['data']['user']['desc'],
        ),
      );

      globaltoken = res_data["data"]["token"];
      userid=res_data['data']['user']['id'].toString();
      print("USER MODEL"+userController.user.id.toString());
      print("nameee :  " + userController.user.fullName.toString());
      Get.to(() => MainScreen());
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }
}
