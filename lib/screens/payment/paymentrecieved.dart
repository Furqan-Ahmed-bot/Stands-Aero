import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/colors.dart';
import '../mainhome.dart';

class PaymentRecieved extends StatefulWidget {
  const PaymentRecieved({Key? key}) : super(key: key);

  @override
  State<PaymentRecieved> createState() => _PaymentRecievedState();
}

class _PaymentRecievedState extends State<PaymentRecieved> {
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
                          child: Image.asset('assets/slicing/Untitled-28.png')),
                      SizedBox(
                        height: res_height * 0.02,
                      ),
                      Text(
                        'Order Placed Successfully',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        height: res_height * 0.005,
                      ),
                      Text(
                        'Thankyou',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13.5),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => MainScreen());
                },
                child: Container(
                  width: res_width * 0.95,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Center(
                      child: Text(
                        'Continue',
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
      ),
    );
  }
}
