import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/bottomcontroller.dart';
import 'package:stande_aero/screens/about/aboutus.dart';
import 'package:stande_aero/screens/credit_Form/credit_form.dart';
import 'package:stande_aero/screens/home/orderhistory.dart';
import 'package:stande_aero/screens/home/payment_history.dart';
import 'package:stande_aero/screens/home/privacy.dart';
import 'package:stande_aero/screens/home/terms.dart';
import 'package:stande_aero/screens/kyc_Form/kyc_form.dart';
import 'package:stande_aero/screens/lease%20Form/lease_form.dart';
import 'package:stande_aero/screens/notifications/chat.dart';
import 'package:stande_aero/screens/taxcertificate/taxcertificate.dart';

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
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff212330),
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
                          Image.asset(
                            'assets/slicing/Untitled-31.png',
                            width: 80,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Text('john@email.com',
                                  style: TextStyle(color: Colors.white))
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
