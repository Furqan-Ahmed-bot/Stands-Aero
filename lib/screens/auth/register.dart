import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/auth/mainlogin.dart';
import 'package:stande_aero/services/remote_services.dart';
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
  final _formKey = GlobalKey<FormState>();
   bool _passwordVisible = false;
   bool _passwordVisible1 = false;

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
          child: Form(
            key: _formKey,
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
                  child: TextFormField(
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
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Enter Your Name !';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: res_height * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
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
                  height: res_height * 0.015,
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   child: TextFormField(
                //     controller: city,
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
                      items:
                          <String>['New York', 'New Jersey'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedValue1 = value!;
                          city.text = _selectedValue1;
                          print("selected value" + _selectedValue1.toString());
                          print("selected city" + city.text);
                          // city = _selectedValue1 as TextEditingController;
                        });
                      },
                      style: TextStyle(color: Colors.grey),
                      // icon: Icon(
                      //   Icons.arrow_forward_ios,
                      //   color: kPrimaryColor,
                      //   size: 20,
                      // ),
                      // iconSize: 20,
                      validator: (text) {
                        if (text == null || text.isEmpty || text.length < 5) {
                          return 'Select City !';
                        }
                        return null;
                      }),
                ),
                SizedBox(
                  height: res_height * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
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
                    validator: (text) {
                      if (text == null || text.isEmpty || text.length < 5) {
                        return 'Enter Phone Number !';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: res_height * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: password,
                    obscureText: !_passwordVisible,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      hintStyle: TextStyle(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.only(top: 16, left: 16),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty || text.length < 6) {
                        return 'Password Must Contain Atleast 6 Characters !';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: res_height * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: password_confirmation,
                    obscureText: !_passwordVisible1,
                    decoration: new InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      hintStyle: TextStyle(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible1 = !_passwordVisible1;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.only(top: 16, left: 16),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty || text.length < 8) {
                        return 'Enter Same Password !';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: res_height * 0.014,
                ),
                GestureDetector(
                  onTap: () {
                    var sendData = {
                      'fullname': fullname.text,
                      'email': email.text,
                      'city': city.text,
                      'phone': phone.text,
                      'password': password.text,
                      'password_confirmation': password_confirmation.text,
                      // "fullname": fullname.text,
                      // "email": email.text,
                      // "city": city.text,
                      // "phone": phone.text,
                      // "password": password.text,
                      // "password_confirmation": password_confirmation,
                    };
                    if (_formKey.currentState!.validate()) {
                      ApiService().register(context,sendData);
                    }
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
                    GestureDetector(
                      onTap: (){
                        Get.to(
                            MainLoginScreen()
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor,
                          fontSize: 17,
                        ),
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
      ),
    );
  }
}
