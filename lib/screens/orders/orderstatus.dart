import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stande_aero/screens/mainhome.dart';
import 'package:stande_aero/screens/orders/orderstatusdetail.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  int _currentStep = 0;

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Quotes_Card(
                  MODEL: "CF34-10 DAE",
                  location: "Miami, Florida",
                  description:
                      "Lorem Ipsum is simply \ndummy text of the printing \nand typesetting industry",
                ),
                SizedBox(
                  height: res_height * 0.03,
                ),

                Container(
                  width: res_width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              child:
                                  Image.asset('assets/slicing/Untitled-61.png'))
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => OrderStatusDetail(type: "Progress"));
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: res_width * 0.75,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Order In Progress',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: res_height * 0.006,
                                            ),
                                            Container(
                                                width: res_width * 0.6,
                                                child: Text(
                                                    'Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenean',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
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
                          ),
                          SizedBox(
                            height: res_height * 0.05,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => OrderStatusDetail(
                                    type: "Shipped",
                                  ));
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: res_width * 0.75,
                                  decoration:
                                      BoxDecoration(color: Color(0xffc2c2c2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Order Shipped',
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: res_height * 0.006,
                                            ),
                                            Container(
                                                width: res_width * 0.6,
                                                child: Text(
                                                    'Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenean',
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12,
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
                          ),
                          SizedBox(
                            height: res_height * 0.05,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => OrderStatusDetail(
                                    type: "Route",
                                  ));
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: res_width * 0.75,
                                  decoration:
                                      BoxDecoration(color: Color(0xffc2c2c2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Order In Route',
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: res_height * 0.006,
                                            ),
                                            Container(
                                                width: res_width * 0.6,
                                                child: Text(
                                                    'Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenean',
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12,
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
                          ),
                          SizedBox(
                            height: res_height * 0.05,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => OrderStatusDetail(
                                    type: "Arrived",
                                  ));
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: res_width * 0.75,
                                  decoration:
                                      BoxDecoration(color: Color(0xffc2c2c2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Order Arrived',
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: res_height * 0.006,
                                            ),
                                            Container(
                                                width: res_width * 0.6,
                                                child: Text(
                                                    'Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenean',
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12,
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
                    Get.to(() => MainScreen());
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

                // Stepper(
                //     // type: stepperType,

                //     physics: ScrollPhysics(),
                //     currentStep: _currentStep,
                //     onStepTapped: (step) => tapped(step),
                //     onStepContinue: continued,
                //     onStepCancel: cancel,
                //     controlsBuilder: (context, _) {
                //       return SizedBox();
                //     },
                //     steps: <Step>[
                //       Step(
                //         title: SizedBox(
                //           child: Column(
                //             children: <Widget>[
                //               Container(
                //                 width: res_width * 0.75,
                //                 decoration: BoxDecoration(color: Colors.white),
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(12.0),
                //                   child: Row(
                //                     children: [
                //                       Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             'Order In Progress',
                //                             style: TextStyle(
                //                                 fontWeight: FontWeight.bold),
                //                           ),
                //                           SizedBox(
                //                             height: res_height * 0.006,
                //                           ),
                //                           Container(
                //                               width: res_width * 0.6,
                //                               child: Text(
                //                                   'Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenean',
                //                                   style: TextStyle(
                //                                     color: Colors.grey,
                //                                     fontSize: 12,
                //                                   )))
                //                         ],
                //                       ),
                //                       Icon(
                //                         Icons.arrow_forward_ios,
                //                         color: Colors.grey,
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               )

                //             ],
                //           ),
                //         ),
                //         content: SizedBox(
                //           width: 0.0,
                //           height: 0.0,
                //         ),
                //         isActive: _currentStep >= 0,
                //         state: _currentStep >= 0
                //             ? StepState.complete
                //             : StepState.disabled,
                //       ),
                //       Step(
                //         title: new Text(''),
                //         content: Column(
                //           children: <Widget>[
                //             Container(
                //               width: res_width * 0.75,
                //               decoration: BoxDecoration(color: Colors.white),
                //               child: Padding(
                //                 padding: const EdgeInsets.all(12.0),
                //                 child: Row(
                //                   children: [
                //                     Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Order In Progress',
                //                           style: TextStyle(
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         SizedBox(
                //                           height: res_height * 0.006,
                //                         ),
                //                         Container(
                //                             width: res_width * 0.6,
                //                             child: Text(
                //                                 'Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenean',
                //                                 style: TextStyle(
                //                                   color: Colors.grey,
                //                                   fontSize: 12,
                //                                 )))
                //                       ],
                //                     ),
                //                     Icon(
                //                       Icons.arrow_forward_ios,
                //                       color: Colors.grey,
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //         isActive: _currentStep >= 0,
                //         state: _currentStep >= 0
                //             ? StepState.complete
                //             : StepState.disabled,
                //       ),
                //     ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Quotes_Card extends StatelessWidget {
  var MODEL, location, description;

  Quotes_Card({Key? key, this.MODEL, this.location, this.description})
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
                        "$description",
                        style: TextStyle(fontSize: 10),
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
                      child: Image.asset(
                        "assets/slicing/Untitled-6.png",
                        fit: BoxFit.cover,
                      ))
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
