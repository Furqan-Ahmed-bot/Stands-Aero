import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/List%20Quotes/quotes.dart';
import 'package:stande_aero/screens/home/orderhistory.dart';
import 'package:stande_aero/screens/payment/payment.dart';
import 'package:stande_aero/services/remote_services.dart';

class quotes_details extends StatefulWidget {
  final quoteId;
  const quotes_details({Key? key, required this.quoteId}) : super(key: key);

  @override
  State<quotes_details> createState() => _quotes_detailsState();
}

class _quotes_detailsState extends State<quotes_details> {
  List<dynamic> responseData = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      // setState(() {
      quotesDetails();
      // });
    });
    super.initState();
  }

  quotesDetails() {
    log("widget quote id"+ widget.quoteId);
    ApiService().single_quotation_data(widget.quoteId).then((res_data) {
      // log("response of single quotation console");
      if (res_data['status'] == true) {
        log("response of single quotation console : " + res_data['data'].toString());
        setState(() {
          responseData = res_data['data'];
        });

        log("response of quotationData" + responseData.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    double pad = 23.0;

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
                'Quote Details',
                style: TextStyle(color: Colors.black),
              ),
              Container(
                width: 40,
                height: 40,
                child: Image.asset('assets/slicing/Untitled-3.png'),
              )
            ],
          ),
        ),
        // extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: pad / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Quotess_Card(
                      id: responseData[0]['quote_id'],
                      status: "Approved",
                      name: responseData[0]['product_name'],
                      location: responseData[0]['product_location']==null ?  "abc" : responseData[0]['product_location'],
                      description: responseData[0]['details'],
                      image:
                          responseData[0]['product_image']),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Availabilty Status',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: res_width * 0.25,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: EdgeInsets.all(13.0),
                            child: Center(
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: res_width * 0.6,
                          decoration: BoxDecoration(
                              color: Color(0xffaf8a39),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Center(
                              child: Text(
                                'Safe',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.01,
                  ),
                  Text(
                    'Send Location Required ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    width: res_width * 0.95,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 10),
                      child: Text(responseData[0]['product_location']),
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Date the stand is required',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: res_width * 0.45,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 17, left: 10),
                            child: Text(responseData[0]['date_from']),
                          ),
                        ),
                        Container(
                          width: res_width * 0.45,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 17, left: 10),
                            child: Text(responseData[0]['date_to']),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Daily Lease rate',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.01,
                  ),
                  responseData[0]['discount_amount'] ==true ?
                  Container(
                    width: res_width * 0.95,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Center(
                        child: Text(
                          "\$${responseData[0]['discount_amount']}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ): Container(),
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
                          "\$${responseData[0]['total_amount']}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => payment());
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
                            'Place Order',
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
                    height: res_height * 0.01,
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
