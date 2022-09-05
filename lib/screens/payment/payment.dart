import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:stande_aero/screens/payment/addcard.dart';
import 'package:stande_aero/screens/payment/wiretransfer.dart';

class payment extends StatelessWidget {
  const payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
            // _key.currentState!.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                width: 25,
                child: Image.asset(
                  'assets/slicing/Untitled-3.png',
                )),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Payment',
              style: TextStyle(color: Colors.black),
            ),
            Container(
                width: 40,
                height: 40,
                child: Image.asset('assets/slicing/Untitled-4.png',
                    fit: BoxFit.cover)),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        // height:  double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-46.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  width: res_width * 0.9,
                  child: Image.asset("assets/slicing/Untitled-54.png")),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Total Price',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.01,
              ),
              Container(
                width: res_width * 0.95,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                    child: Text(
                      "4500",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Select payment ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.01,
              ),
              Container(
                width: res_width * 0.95,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/slicing/Untitled-56.png",
                        width: res_width * 0.1,
                      ),
                      Text(
                        " ***12345 12345 12345 56789",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      // SizedBox(
                      //   width: res_width * 0.23,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: res_width * 0.12),
                        child: Image.asset(
                          "assets/slicing/Untitled-63.png",
                          width: res_width * 0.025,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.01,
              ),
              Container(
                width: res_width * 0.95,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/slicing/Untitled-55.png",
                        width: res_width * 0.1,
                      ),
                      Text(
                        " ***12345 12345 12345 56789",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: res_width * 0.12),
                        child: Image.asset(
                          "assets/slicing/Untitled-63.png",
                          width: res_width * 0.025,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => WireTransfer());
                },
                child: Container(
                  width: res_width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image.asset(
                        //   "assets/slicing/Untitled-55.png",
                        //   width: res_width * 0.1,
                        // ),
                        Text(
                          "Wire transfer",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                        SizedBox(
                          width: res_width * 0.23,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: res_width * 0.32),
                          child: Image.asset(
                            "assets/slicing/Untitled-63.png",
                            width: res_width * 0.025,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AddCard());
                },
                child: Container(
                  width: res_width * 0.95,
                  decoration: BoxDecoration(
                      color: Color(0xffaf8a39),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Center(
                      child: Text(
                        'Add Cart',
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
