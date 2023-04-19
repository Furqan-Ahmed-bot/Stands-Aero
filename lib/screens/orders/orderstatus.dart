import 'package:StandsAero/helper/loader.dart';
import 'package:StandsAero/screens/mainhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/remote_services.dart';

class OrderStatus extends StatefulWidget {
  final orderID;
  final bool isComingFromPaymentScreen;
  const OrderStatus(
      {Key? key, this.orderID, this.isComingFromPaymentScreen = false})
      : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  int _currentStep = 0;
  dynamic order_historyvar;
  dynamic productDetails = [];
  late String orderStatus;
  Color primaryColor = Colors.white;
  Color secondaryColor = Colors.grey;

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
    order_historyvar = await ApiService().orderDetails(widget.orderID);
    productDetails = order_historyvar['data'];
    orderStatus = order_historyvar['data']["order_status"].toString();

    print("orderStatus detail" + orderStatus);
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
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
            leading: widget.isComingFromPaymentScreen
                ? SizedBox.shrink()
                : GestureDetector(
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
                  'Order Status',
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
          body: Container(
            width: double.infinity,
            child: FutureBuilder<void>(
                future: order_history(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SingleChildScrollView(
                      child: productDetails.length > 0
                          ? Column(
                              children: [
                                Quotes_Card(
                                    MODEL: productDetails['stand_details']
                                        ['name'],
                                    location: productDetails['stand_details']
                                        ['location'],
                                    description: productDetails['stand_details']
                                        ['desc'],
                                    image: productDetails['stand_details']
                                        ['thumbnail'],
                                    serialno: productDetails['stand_details']
                                        ['serial_number']),
                                SizedBox(
                                  height: res_height * 0.03,
                                ),
                                Container(
                                  width: res_width * 0.9,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                              width: 35,
                                              child: Image.asset(
                                                  'assets/slicing/Untitled-58.png')),
                                          Divider(
                                            height: res_height * 0.095,
                                          ),
                                          Container(
                                              width: 35,
                                              child: Image.asset(
                                                  'assets/slicing/Untitled-59.png')),
                                          Divider(
                                            height: res_height * 0.095,
                                          ),
                                          Container(
                                              width: 35,
                                              child: Image.asset(
                                                  'assets/slicing/Untitled-60.png')),
                                          Divider(
                                            height: res_height * 0.095,
                                          ),
                                          Container(
                                              width: 35,
                                              child: Image.asset(
                                                  'assets/slicing/Untitled-61.png')),
                                          Divider(
                                            height: res_height * 0.095,
                                          ),
                                          Container(
                                              width: 35,
                                              child: Image.asset(
                                                  'assets/slicing/Backinorder.png')),
                                          Divider(
                                            height: res_height * 0.095,
                                          ),
                                          Container(
                                              width: 35,
                                              child: Image.asset(
                                                  'assets/slicing/Received-Back.png')),
                                          Divider(
                                            height: res_height * 0.095,
                                          ),
                                          Container(
                                              width: 35,
                                              child: Image.asset(
                                                  'assets/slicing/Shipped-Back.png')),
                                          // Divider(
                                          //   height: res_height * 0.095,
                                          // ),
                                          // Container(
                                          //     width: 35,
                                          //     child: Image.asset(
                                          //         'assets/slicing/Untitled-61.png'))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: res_width * 0.75,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: orderStatus ==
                                                            "Order In Process"
                                                        ? primaryColor
                                                        : secondaryColor),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Order In Process',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: res_height *
                                                                0.006,
                                                          ),
                                                          Container(
                                                              width: res_width *
                                                                  0.6,
                                                              child: Text('',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontSize:
                                                                        12,
                                                                  )))
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.grey,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: res_height * 0.05,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: res_width * 0.75,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: orderStatus ==
                                                            "Order Shipped"
                                                        ? primaryColor
                                                        : secondaryColor),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Order Shipped',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[600],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: res_height *
                                                                0.006,
                                                          ),
                                                          Container(
                                                              width: res_width *
                                                                  0.68,
                                                              child: Text('',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontSize:
                                                                        12,
                                                                  )))
                                                        ],
                                                      ),
                                                      // Icon(
                                                      //   Icons.arrow_forward_ios,
                                                      //   color: Colors.grey,
                                                      // )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: res_height * 0.05,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: res_width * 0.75,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: orderStatus ==
                                                            "Order In Route"
                                                        ? primaryColor
                                                        : secondaryColor),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Order In Route',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[600],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: res_height *
                                                                0.006,
                                                          ),
                                                          Container(
                                                              width: res_width *
                                                                  0.6,
                                                              child: Text('',
                                                                  //'Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenean',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontSize:
                                                                        12,
                                                                  )))
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.grey,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: res_height * 0.05,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: res_width * 0.75,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: orderStatus ==
                                                            "Order Arrived"
                                                        ? primaryColor
                                                        : secondaryColor),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Order Arrived',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[600],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: res_height *
                                                                0.006,
                                                          ),
                                                          Container(
                                                              width: res_width *
                                                                  0.6,
                                                              child: Text('',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontSize:
                                                                        12,
                                                                  )))
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.grey,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: res_height * 0.05,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: res_width * 0.75,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: orderStatus ==
                                                            "Back In Order"
                                                        ? primaryColor
                                                        : secondaryColor),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Back In Order',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[600],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: res_height *
                                                                0.006,
                                                          ),
                                                          Container(
                                                              width: res_width *
                                                                  0.6,
                                                              child: Text('',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontSize:
                                                                        12,
                                                                  )))
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.grey,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: res_height * 0.05,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: res_width * 0.75,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: orderStatus ==
                                                            "Shipped Back"
                                                        ? primaryColor
                                                        : secondaryColor),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Shipped Back',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[600],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: res_height *
                                                                0.006,
                                                          ),
                                                          Container(
                                                              width: res_width *
                                                                  0.6,
                                                              child: Text('',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontSize:
                                                                        12,
                                                                  )))
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.grey,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: res_height * 0.05,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: res_width * 0.75,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: orderStatus ==
                                                            "Received Back"
                                                        ? primaryColor
                                                        : secondaryColor),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Received Back',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[600],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: res_height *
                                                                0.006,
                                                          ),
                                                          Container(
                                                              width: res_width *
                                                                  0.6,
                                                              child: Text('',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontSize:
                                                                        12,
                                                                  )))
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.grey,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
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
                                        color: Color(0xff85714e),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Center(
                                        child: Text(
                                          'Done',
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
                            )
                          : spinkit,
                    );
                  } else {
                    return spinkit;
                  }
                }),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Quotes_Card extends StatelessWidget {
  var MODEL, location, description, image, serialno;

  Quotes_Card(
      {Key? key,
      this.MODEL,
      this.location,
      this.description,
      this.image,
      this.serialno})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: res_width * 0.925,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
            ),
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
                      Text(
                        "$MODEL",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: res_height * 0.006,
                      ),
                      Row(
                        children: [
                          Text(
                            "Location: ",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$location",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: res_height * 0.006,
                      ),
                      Text(
                        "$serialno",
                        style: TextStyle(fontSize: 15),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: res_height * 0.1,
                          width: res_width * 0.45,
                          child: SingleChildScrollView(
                            child: Text(
                              "${description == null ? '' : description}",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   width: res_width * 0.05,
                  // ),
                  Container(
                      width: res_width * 0.375,
                      height: res_height * 0.17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Image(
                        image: NetworkImage(image),
                      )

                      // Image.network(
                      //   image,
                      //   fit: BoxFit.cover,
                      // )
                      )
                ],
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
