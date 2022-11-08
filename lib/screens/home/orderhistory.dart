import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:StandsAero/helper/loader.dart';
import 'package:StandsAero/screens/List%20Quotes/list_of_Quote_details.dart';
import 'package:StandsAero/screens/home/drawer.dart';
import 'package:StandsAero/services/remote_services.dart';

import '../orders/orderstatus.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  dynamic order_historyvar;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        order_history();
      });
    });

    super.initState();
  }

  Future<void> order_history() async {
    order_historyvar = await ApiService().order_history();

    log("order_historyvar" + order_historyvar['data'].toString());
  }

  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        key: _key,
        drawer: NavDrawer(),
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
                'Order History',
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
        body: FutureBuilder<void>(
            future: order_history(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: order_historyvar['data'].length > 0
                          ? ListView.builder(
                              itemCount: order_historyvar['data'].length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Quotes_Card(
                                    orderNumber: order_historyvar['data'][index]
                                        ['order_number'],
                                    payAmount: order_historyvar['data'][index]
                                        ['pay_amount'],
                                    orderDate: order_historyvar['data'][index]
                                        ['order_date'],
                                    orderStatus: order_historyvar['data'][index]
                                        ['order_status'],
                                    orderID: order_historyvar['data'][index]
                                        ['id'],
                                    paymentStatus: order_historyvar['data']
                                        [index]['payment_status']);
                              })
                          : Text(
                              "No Orders found",
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                );
              } else {
                return spinkit;
              }
            }),
      ),
    );
  }
}

class Quotes_Card extends StatelessWidget {
  // var MODEL, location, description;
  var orderNumber, payAmount, orderDate, orderStatus, paymentStatus, orderID;

  Quotes_Card(
      {Key? key,
      this.orderNumber,
      this.payAmount,
      this.orderDate,
      this.orderStatus,
      this.paymentStatus,
      this.orderID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(OrderStatus(
              orderID: orderID,
            ));
          },
          child: Container(
            width: res_width * 0.925,
            child: Card(
              // margin: EdgeInsets.fromLTRB(18.0, 4.0, 18.0, 18.0),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Order Number: ",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$orderNumber",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: res_height * 0.006,
                        ),
                        Row(
                          children: [
                            Text(
                              "Pay Amount: ",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$payAmount",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: res_height * 0.006,
                        ),
                        Row(
                          children: [
                            Text(
                              "Dated Ordered: ",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$orderDate",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: res_height * 0.006,
                        ),
                        Row(
                          children: [
                            Text(
                              "Order Status: ",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$orderStatus",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: res_height * 0.006,
                        ),
                        Row(
                          children: [
                            Text(
                              "Payment Status: ",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$paymentStatus",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   width: res_width * 0.05,
                    // ),
                    // Container(
                    //     width: res_width * 0.375,
                    //     height: res_height * 0.17,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.all(Radius.circular(7))),
                    //     child: Image.asset(
                    //       "assets/slicing/Untitled-6.png",
                    //       fit: BoxFit.cover,
                    //     ))
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: res_height * 0.0075,
        ),
      ],
    );
  }
}
