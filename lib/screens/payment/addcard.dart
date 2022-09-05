import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AddCard extends StatelessWidget {
  const AddCard({Key? key}) : super(key: key);

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
              'AddCard',
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
              SizedBox(
                height: res_height * 0.02,
              ),
              Container(
                  width: res_width * 0.9,
                  child: Image.asset("assets/slicing/Untitled-54.png")),
              SizedBox(
                height: res_height * 0.02,
              ),
              Align(
                child: Container(
                  width: res_width * 0.9,
                  child: Text(
                    'Card Holder Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.0075,
              ),
              texttBox(res_width: res_width),
              SizedBox(
                height: res_height * 0.02,
              ),
              Align(
                child: Container(
                  width: res_width * 0.9,
                  child: Text(
                    'Card Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.0075,
              ),
              texttBox(res_width: res_width),
              Container(
                width: res_width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        Container(
                          width: res_width * 0.4,
                          child: Text(
                            'Exp Date',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.0075,
                        ),
                        texttBox(res_width: res_width * 0.4),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        Container(
                          width: res_width * 0.4,
                          child: Text(
                            'Cvv',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.0075,
                        ),
                        texttBox(res_width: res_width * 0.4),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: res_height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
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
                        'Add Card',
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

class texttBox extends StatelessWidget {
  texttBox({
    Key? key,
    required this.res_width,
  }) : super(key: key);

  final double res_width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: res_width * 0.925,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: TextField(
          // maxLines: maxLines,
          ),
    );
  }
}
