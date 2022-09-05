import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/payment/paymentrecieved.dart';

class AwaitingConfirm extends StatefulWidget {
  const AwaitingConfirm({Key? key}) : super(key: key);

  @override
  State<AwaitingConfirm> createState() => _AwaitingConfirmState();
}

class _AwaitingConfirmState extends State<AwaitingConfirm> {
    @override
  void initState() {
    start();
    super.initState();
  }

  start() {
    Timer(Duration(seconds: 2), () => Get.to(() => PaymentRecieved()));
  }
  
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          // height:  double.infinity,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: res_height * 0.325,
                width: res_width * 0.9,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: res_width * 0.275,
                          child: Image.asset('assets/slicing/Untitled-57.png')),
                      SizedBox(
                        height: res_height * 0.02,
                      ),
                      Text(
                        'Awaiting Confirmation',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        height: res_height * 0.005,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur adip- iscing elit libero, sollicitudin dignissim vel cubilia blandit pellentesque tellus.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13.5),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
