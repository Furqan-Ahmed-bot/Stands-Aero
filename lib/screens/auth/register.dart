import 'package:StandsAero/helper/colors.dart';
import 'package:StandsAero/screens/auth/emaillogin.dart';
import 'package:StandsAero/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/remove_focus_widget.dart';

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

  String? _selectedValue1;
  bool isCityValidation = false;

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-5.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: RemoveFocusWidget(
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
                      child: Image.asset('assets/slicing/Layer-2.png')),
                  SizedBox(
                    height: res_height * 0.025,
                  ),
                  Text(
                    'Signup',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff85714e),
                        fontSize: 28),
                  ),
                  SizedBox(
                    height: res_height * 0.025,
                  ),
                  TextFormField(
                    controller: fullname,
                    decoration: new InputDecoration(
                      hintText: 'Name',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      hintStyle: TextStyle(),
                      contentPadding: EdgeInsets.only(top: 16, left: 16),
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Enter Your Name !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: res_height * 0.015,
                  ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
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
                  // SizedBox(
                  //   height: res_height * 0.015,
                  // ),
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
                  // GestureDetector(
                  //   onTap: () {
                  //     CustomMenuWidget.showBottomSheet(context, [
                  //       CustomMenuTile(
                  //           onTapped: () {
                  //             setState(() {
                  //               _selectedValue1 = 'New York';
                  //               city.text = 'New York';
                  //               isCityValidation = false;
                  //             });
                  //             Navigator.pop(context);
                  //           },
                  //           text: 'New York'),
                  //       CustomMenuTile(
                  //           onTapped: () {
                  //             setState(() {
                  //               _selectedValue1 = 'New Jersey';
                  //               city.text = 'New Jersey';
                  //               isCityValidation = false;
                  //             });
                  //             Navigator.pop(context);
                  //           },
                  //           text: 'New Jersey'),
                  //     ]);
                  //   },
                  //   child: Container(
                  //     width: Get.width * 0.9,
                  //     height: 50,
                  //     padding: const EdgeInsets.only(left: 18, right: 10),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(7.0),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           _selectedValue1 ?? 'City',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.w500,
                  //               fontSize: 16,
                  //               color: _selectedValue1 == null
                  //                   ? Colors.black54
                  //                   : Colors.black),
                  //         ),
                  //         Icon(Icons.arrow_drop_down),
                  //       ],
                  //     ),

                  //     //    DropdownButtonFormField<String>(
                  //     //       decoration: InputDecoration(
                  //     //           fillColor: Colors.white,
                  //     //           contentPadding: EdgeInsets.all(12)),
                  //     //       hint: Text(
                  //     //         'City',
                  //     //         style: TextStyle(
                  //     //           fontSize: 17,
                  //     //         ),
                  //     //       ),
                  //     //       isExpanded: true,
                  //     //       items: <String>['New York', 'New Jersey']
                  //     //           .map((String value) {
                  //     //         return DropdownMenuItem<String>(
                  //     //           value: value,
                  //     //           child: Text(value),
                  //     //         );
                  //     //       }).toList(),
                  //     //       onChanged: (value) {
                  //     //         setState(() {
                  //     //           _selectedValue1 = value!;
                  //     //           city.text = _selectedValue1;
                  //     //           print(
                  //     //               "selected value" + _selectedValue1.toString());
                  //     //           print("selected city" + city.text);
                  //     //           // city = _selectedValue1 as TextEditingController;
                  //     //         });
                  //     //       },
                  //     //       style: TextStyle(color: Colors.grey),
                  //     //       // icon: Icon(
                  //     //       //   Icons.arrow_forward_ios,
                  //     //       //   color: kPrimaryColor,
                  //     //       //   size: 20,
                  //     //       // ),
                  //     //       // iconSize: 20,
                  //     //       validator: (text) {
                  //     //         if (text == null || text.isEmpty || text.length < 5) {
                  //     //           return 'Select City !';
                  //     //         }
                  //     //         return null;
                  //     //       }),
                  //   ),
                  // ),
                  // if (isCityValidation)
                  //   const SizedBox(
                  //     height: 8,
                  //   ),
                  // if (isCityValidation)
                  //   Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       'Please select a valid city!',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w100,
                  //           fontSize: 12,
                  //           color: Colors.red),
                  //     ),
                  //   ),
                  SizedBox(
                    height: res_height * 0.015,
                  ),
                  TextFormField(
                    controller: city,
                    decoration: new InputDecoration(
                      hintText: 'City',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      hintStyle: TextStyle(),
                      contentPadding: EdgeInsets.only(top: 16, left: 16),
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Enter City !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: res_height * 0.015,
                  ),
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: new InputDecoration(
                      hintText: 'Phone Number',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
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
                          text.length > 15) {
                        return 'Enter correct phone number !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: res_height * 0.015,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: !_passwordVisible,
                    decoration: new InputDecoration(
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )),
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
                        errorMaxLines: 3),
                    validator: (text) {
                      RegExp regExp = RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                      if (text == null || text.isEmpty) {
                        return "Password must not be empty or null";
                      }
                      if (text.length < 8) {
                        return 'Password Must Contain Atleast 8 Characters !';
                      }

                      if (!regExp.hasMatch(text)) {
                        return 'Password must contain at least one uppercase letter, one lowercase letter, one digit and one special character';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: res_height * 0.015,
                  ),
                  TextFormField(
                    controller: password_confirmation,
                    obscureText: !_passwordVisible1,
                    decoration: new InputDecoration(
                      hintText: 'Confirm Password',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
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
                        return 'Password Must Contain Atleast 8 Characters !';
                      } else {
                        if (password.text != password_confirmation.text) {
                          return 'Enter Same Password !';
                        } else {
                          return null;
                        }
                      }
                    },
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
                        ApiService().register(context, sendData);
                      } else {
                        if (_selectedValue1 == null) {
                          setState(() {
                            isCityValidation = true;
                          });
                        } else {
                          setState(() {
                            isCityValidation = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      // width: res_width * 0.9,
                      decoration: BoxDecoration(
                          color: Color(0xff85714e),
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
                    height: res_height * 0.055,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(EmailLoginScreen());
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
      ),
    );
  }
}
