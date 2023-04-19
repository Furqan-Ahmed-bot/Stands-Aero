import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:StandsAero/bottomcontroller.dart';
import 'package:StandsAero/controller/usercontroller.dart';
import 'package:StandsAero/screens/about/aboutus.dart';
import 'package:StandsAero/screens/home/orderhistory.dart';
import 'package:StandsAero/screens/home/payment_history.dart';
import 'package:StandsAero/screens/home/privacy.dart';
import 'package:StandsAero/screens/home/terms.dart';
import 'package:StandsAero/screens/notifications/chat.dart';
import 'package:StandsAero/screens/taxcertificate/taxcertificate.dart';
import 'package:StandsAero/services/remote_services.dart';

import '../../tickets/create_tickets.dart';
import '../../tickets/ticket_list.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final bottomctrl = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    final userController = Get.put(UserController());
    log("usercontroller" + userController.user.propic.toString());
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            // color: Color(0xff212330),
            image:
              DecorationImage(image: AssetImage("assets/slicing/drawer-background.png"),fit: BoxFit.cover),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: res_height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 13),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          userController.user.propic != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Image.network(
                                    userController.user.propic.toString(),
                                    width: 80,
                                    height: 80,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Image.asset(
                                      "assets/slicing/NoPath.png",
                                      width: 80,
                                      height: 80),
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userController.user.fullName != null
                                    ? userController.user.fullName.toString()
                                    : 'No Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Container(
                                width: res_width * 0.4,
                                child: Text(
                                    userController.user.email.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: res_height * 0.04,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (bottomctrl.navigationBarIndexValue != 0) {
                    bottomctrl.navBarChange(0);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-15.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Home',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (bottomctrl.navigationBarIndexValue != 2) {
                    bottomctrl.navBarChange(2);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-47.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Your Quotes',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (bottomctrl.navigationBarIndexValue != 3) {
                    bottomctrl.navBarChange(3);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-18.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => PaymentHistory());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-36.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Payment History',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),

              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTap: () {
              //     if (bottomctrl.navigationBarIndexValue != 3) {
              //       bottomctrl.navBarChange(3);
              //     } else {
              //       Navigator.pop(context);
              //     }
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 13, right: 13),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             IconButton(
              //               icon: Padding(
              //                 padding: const EdgeInsets.all(7.0),
              //                 child:
              //                     Image.asset("assets/slicing/Untitled-17.png"),
              //               ),
              //               onPressed: () {},
              //             ),
              //             Text(
              //               'Payment History',
              //               style: TextStyle(fontSize: 15, color: Colors.white),
              //             )
              //           ],
              //         ),
              //         Container(
              //           height: 1,
              //           color: Colors.grey.withOpacity(0.2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => ChatScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-39.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Chat Support',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (bottomctrl.navigationBarIndexValue != 1) {
                    bottomctrl.navBarChange(1);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset(
                                  "assets/slicing/notifications-icon.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Notifications',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => OrderHistory());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-38.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Order History',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => CreateTickets());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-40.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Tickets',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => ListOfTickets());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-40.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Your Tickets',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTap: () {
              //     Get.to(() => EventScreen());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 13, right: 13),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             IconButton(
              //               icon: Padding(
              //                   padding: const EdgeInsets.all(7.0),
              //                   child: Icon(
              //                     Icons.event,
              //                     color: Colors.white,
              //                   )),
              //               onPressed: () {
              //                 // Get.to();
              //               },
              //             ),
              //             Text(
              //               'Events',
              //               style: TextStyle(fontSize: 15, color: Colors.white),
              //             )
              //           ],
              //         ),
              //         Container(
              //           height: 1,
              //           color: Colors.grey.withOpacity(0.2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),

              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => TexCertificateScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-34.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Tax Certificate',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),

              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => TermsScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-40.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Terms & Condition',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => PrivacyScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-41.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTap: () {
              //     Get.to(() => IndexPage());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 13, right: 13),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             IconButton(
              //               icon: Padding(
              //                   padding: const EdgeInsets.all(7.0),
              //                   child: Icon(
              //                     Icons.call,
              //                     color: Colors.white,
              //                   )),
              //               onPressed: () {},
              //             ),
              //             Text(
              //               'Audio Video Calling',
              //               style: TextStyle(fontSize: 15, color: Colors.white),
              //             )
              //           ],
              //         ),
              //         Container(
              //           height: 1,
              //           color: Colors.grey.withOpacity(0.2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => Aboututs());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-18.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'About us',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  ApiService().logout(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child:
                                  Image.asset("assets/slicing/Untitled-42.png"),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTap: () {
              //     Get.to(() => kyc_form());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 13, right: 13),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             IconButton(
              //               icon: Padding(
              //                 padding: const EdgeInsets.all(7.0),
              //                 child:
              //                     Image.asset("assets/slicing/Untitled-38.png"),
              //               ),
              //               onPressed: () {},
              //             ),
              //             Text(
              //               'Kyc',
              //               style: TextStyle(fontSize: 15, color: Colors.white),
              //             )
              //           ],
              //         ),
              //         Container(
              //           height: 1,
              //           color: Colors.grey.withOpacity(0.2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTap: () {
              //     Get.to(() => credit_form());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 13, right: 13),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             IconButton(
              //               icon: Padding(
              //                 padding: const EdgeInsets.all(7.0),
              //                 child:
              //                     Image.asset("assets/slicing/Untitled-38.png"),
              //               ),
              //               onPressed: () {},
              //             ),
              //             Text(
              //               'creditapp',
              //               style: TextStyle(fontSize: 15, color: Colors.white),
              //             )
              //           ],
              //         ),
              //         Container(
              //           height: 1,
              //           color: Colors.grey.withOpacity(0.2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTap: () {
              //     Get.to(() => lease_Form());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 13, right: 13),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             IconButton(
              //               icon: Padding(
              //                 padding: const EdgeInsets.all(7.0),
              //                 child:
              //                     Image.asset("assets/slicing/Untitled-18.png"),
              //               ),
              //               onPressed: () {},
              //             ),
              //             Text(
              //               'Lease Form',
              //               style: TextStyle(fontSize: 15, color: Colors.white),
              //             )
              //           ],
              //         ),
              //         Container(
              //           height: 1,
              //           color: Colors.grey.withOpacity(0.2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTap: () {
              //     Get.to(() => credit_form());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 13, right: 13),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             IconButton(
              //               icon: Padding(
              //                 padding: const EdgeInsets.all(7.0),
              //                 child:
              //                     Image.asset("assets/slicing/Untitled-18.png"),
              //               ),
              //               onPressed: () {},
              //             ),
              //             Text(
              //               'Credit Form',
              //               style: TextStyle(fontSize: 15, color: Colors.white),
              //             )
              //           ],
              //         ),
              //         Container(
              //           height: 1,
              //           color: Colors.grey.withOpacity(0.2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTap: () {
              //     Get.to(() => kyc_form());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 13, right: 13),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             IconButton(
              //               icon: Padding(
              //                 padding: const EdgeInsets.all(7.0),
              //                 child:
              //                     Image.asset("assets/slicing/Untitled-18.png"),
              //               ),
              //               onPressed: () {},
              //             ),
              //             Text(
              //               'Kyc Form',
              //               style: TextStyle(fontSize: 15, color: Colors.white),
              //             )
              //           ],
              //         ),
              //         Container(
              //           height: 1,
              //           color: Colors.grey.withOpacity(0.2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),

              SizedBox(
                height: res_height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Route scaleIn(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, page) {
      var begin = 0.0;
      var end = 1.0;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return ScaleTransition(
        scale: animation.drive(tween),
        child: page,
      );
    },
  );
}
