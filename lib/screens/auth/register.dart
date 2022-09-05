import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/helper/colors.dart';
import 'package:stande_aero/screens/home/home.dart';
import 'package:stande_aero/screens/kyc_Form/kyc_form.dart';
import 'package:stande_aero/screens/mainhome.dart';
import 'package:stande_aero/screens/payment/awaiting.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

  String apiGlobal = "https://qtdev.the4loop.com/";

  // late String _selectedValue;
  late String _selectedValue1;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: res_height * 0.1,
              ),
              Container(
                  width: res_width * 0.8,
                  child: Image.asset('assets/slicing/Untitled-2.png')),
              SizedBox(
                height: res_height * 0.025,
              ),
              Text(
                'Signup',
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
                  controller: fullname,
                  decoration: new InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                    hintStyle: TextStyle(),
                    contentPadding: EdgeInsets.only(top: 16, left: 16),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.015,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: email,
                  decoration: new InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                    hintStyle: TextStyle(),
                    contentPadding: EdgeInsets.only(top: 16, left: 16),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.015,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: TextField(
              //     decoration: new InputDecoration(
              //       hintText: 'City',
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(7.0),
              //           borderSide: BorderSide(
              //             color: Colors.transparent,
              //           )),
              //       hintStyle: TextStyle(),
              //       contentPadding: EdgeInsets.only(top: 16, left: 16),
              //       fillColor: Colors.white,
              //       filled: true,
              //     ),
              //   ),
              // ),
              Container(
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: DropdownButtonFormField<String>(
                  // underline: SizedBox(),

                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(12)),
                  hint: Text(
                    'City',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  isExpanded: true,
                  items: <String>['NewYork', 'NewJersy'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue1 = value!;
                      city = _selectedValue1 as TextEditingController;
                      // controller.text = _myActivity;
                      print(_selectedValue1.toString());
                      print(city.toString());
                    });
                  },
                  style: TextStyle(color: Colors.grey),
                  // icon: Icon(
                  //   Icons.arrow_forward_ios,
                  //   color: kPrimaryColor,
                  //   size: 20,
                  // ),
                  // iconSize: 20,
                ),
              ),
              SizedBox(
                height: res_height * 0.015,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: phone,
                  decoration: new InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                    hintStyle: TextStyle(),
                    contentPadding: EdgeInsets.only(top: 16, left: 16),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.015,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
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
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.015,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: password_confirmation,
                  decoration: new InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                    hintStyle: TextStyle(),
                    contentPadding: EdgeInsets.only(top: 16, left: 16),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.014,
              ),
              GestureDetector(
                onTap: () {
                  register();
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
                        'Signup',
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
                height: res_height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: res_height * 0.015,
              ),
            ],
          ),
        ),
      ),
    );
  }

  register() async {
    final uri = Uri.parse('${apiGlobal}api/user/registration');

    print(uri);

    var sendData = {
      "fullname": fullname.text,
      "email": email.text,
      "city": city.text,
      "phone": phone.text,
      "password": password.text,
      "password_confirmation": password_confirmation,
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
