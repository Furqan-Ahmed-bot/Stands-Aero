import 'package:StandsAero/helper/colors.dart';
import 'package:StandsAero/helper/model.dart';
import 'package:StandsAero/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final userId;
  final email;
  final otp;
  const ForgotPasswordScreen(
      {Key? key, required this.userId, required this.email, required this.otp})
      : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;

  TextEditingController otp = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

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
              image: AssetImage("assets/slicing/Untitled-5.jpg"),
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
                    child: Image.asset('assets/slicing/Layer-2.png')),
                SizedBox(
                  height: res_height * 0.1,
                ),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 28),
                ),
                SizedBox(
                  height: res_height * 0.025,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: otp,
                    decoration: new InputDecoration(
                      hintText: 'Enter OTP',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      hintStyle: TextStyle(),
                      contentPadding: EdgeInsets.only(top: 16, left: 16),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
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
                    obscureText: !_passwordVisible,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      hintStyle: TextStyle(),
                      contentPadding: EdgeInsets.only(top: 16, left: 16),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: !_passwordVisible1,
                    decoration: new InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      hintStyle: TextStyle(),
                      contentPadding: EdgeInsets.only(top: 16, left: 16),
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
                  onTap: () async {
                    if (password.text == confirmpassword.text) {
                      var sendData = {
                        "new_password": password.text,
                        "confirm_password": confirmpassword.text,
                        "reset_token": otp.text,
                        "user_id": widget.userId
                      };
                      await ApiService()
                          .setNewForgotPassword(context, sendData);
                    } else {
                      Get.back();

                      Get.snackbar(
                        'Error',
                        "Password Not Matched",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.white,
                      );
                    }

                    // Get.to(() => MainScreen());
                  },
                  child: Container(
                    width: res_width * 0.9,
                    decoration: BoxDecoration(
                            color: Color(0xff85714e),
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Center(
                        child: Text(
                          'Submit',
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
                SizedBox(
                  height: res_height * 0.13,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
