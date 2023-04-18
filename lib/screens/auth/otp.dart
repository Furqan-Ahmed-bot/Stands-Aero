import 'dart:developer';

import 'package:StandsAero/helper/colors.dart';
import 'package:StandsAero/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatefulWidget {
  final userId;
  final page;
  final email;
  const OTPScreen({Key? key, required this.userId, this.page, this.email})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OtpFieldController otpController = OtpFieldController();

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
              'Verification',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 28),
            ),
            SizedBox(
              height: res_height * 0.01,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  // color: kprimarycolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Container(
                    width: Get.width * 0.9,
                    child: const Text(
                      'We have sent you an email containing 6 digits verification code. Please enter the code to verify your identity.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kPrimaryColor, fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  OtpTextField(
                      autoFocus: true,
                      fieldWidth: 40,
                      numberOfFields: 6,
                      // borderColor: accentPurpleColor,
                      // focusedBorderColor: accentPurpleColor,
                      // styles: otpTextStyles,
                      textStyle: TextStyle(color: Colors.black),
                      showFieldAsBox: false,
                      borderWidth: 4.0,
                      enabledBorderColor: Colors.black,
                      onCodeChanged: (String code) {
                        print("Changed: " + code);
                      },
                      onSubmit: (String verificationCode) {
                        print("Completed: " + verificationCode);
                        var data;
                        if (widget.page != null) {
                          data = {
                            "otp": verificationCode,
                            "page": widget.page,
                          };
                        } else {
                          data = {
                            "otp": verificationCode,
                            "page": "Signup",
                          };
                        }

                        print("Data: " + data.toString());

                        ApiService().otpVerification(context, data);
                      }),
                ],
              ),
            ),
            SizedBox(
              height: res_height * 0.03,
            ),
            GestureDetector(
              onTap: () async {
                var response_otp = await ApiService().resendOTP(context);
                log(response_otp.toString());
                if (response_otp['status'] == true) {
                  Get.snackbar(
                    'Success',
                    'Otp Sent',
                    animationDuration: Duration(seconds: 2),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Container(
                // width: res_width * 0.9,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    //Color(0xffaf8a39),
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                    child: Text(
                      'Resend',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
