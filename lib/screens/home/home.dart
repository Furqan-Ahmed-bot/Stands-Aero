import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:stande_aero/contrloller/ProductController.dart';
import 'package:stande_aero/helper/ProductModel.dart';
import 'package:stande_aero/helper/colors.dart';
import 'package:stande_aero/helper/global.dart';
import 'package:stande_aero/helper/model.dart';
import 'package:stande_aero/screens/Profile/profile.dart';
import 'package:stande_aero/screens/booking/booking.dart';
import 'package:stande_aero/screens/credit_Form/credit_form.dart';
import 'package:stande_aero/screens/home/drawer.dart';
import 'package:stande_aero/screens/kyc_Form/kyc_form.dart';
import 'package:stande_aero/screens/lease%20Form/lease_form.dart';
import 'package:stande_aero/screens/lease%20Form/lease_form2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:stande_aero/screens/home/Profile/editprofile.dart';
// import 'package:stande_aero/screens/home/Profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;
  final productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    homeApi();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-5.jpg"),
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
              _key.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                  width: 25,
                  child: Image.asset('assets/slicing/Untitled-44.png')),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                  width: 40,
                  height: 40,
                  child: Image.asset('assets/slicing/Untitled-4.png',
                      fit: BoxFit.cover)),
            ],
          ),
        ),
        body: FadeTransition(
          opacity: _fadeInFadeOut,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: res_height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13, right: 13),
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey),
                          ),
                      child: TextField(
                        decoration: new InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                              borderRadius: BorderRadius.circular(10.0)),

                          hintText: 'Search Jobs / Services',
                          hintStyle: TextStyle(),
                          contentPadding: EdgeInsets.only(top: 16, left: 16),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Icon(Icons.search_outlined),
                          ),
                          fillColor: Colors.white,
                          // filled: true,
                          // border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.025,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // spacing: 10,
                        // runSpacing: 10,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   catvalue;
                              // });
                              filterpopup([
                                'Engine Stands 1',
                                'Engine Stands 2',
                                'Engine Stands 3',
                                'Engine Stands 5'
                              ], "cat");
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 1.0, 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        catvalue != null
                                            ? catvalue.toString()
                                            : 'Engine Stands',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        )),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          GestureDetector(
                            onTap: () {
                              // print();
                              filterpopup([
                                'Manufacture 1',
                                'Manufacture 2',
                                'Manufacture 3',
                                'Manufacture 4',
                              ], "rad");
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Color(0xffa1a1a1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        radvalue2 != null
                                            ? radvalue2.toString()
                                            : 'Manufactures',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                        )),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          GestureDetector(
                            onTap: () {
                              // print();
                              filterpopup([
                                'Manufacture 1',
                                'Manufacture 2',
                                'Manufacture 3',
                                'Manufacture 4',
                              ], "rad");
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Color(0xffa1a1a1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        radvalue2 != null
                                            ? radvalue2.toString()
                                            : 'Bootstrao Kit',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                        )),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.025,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 13),
                  //   child: Container(
                  //     child: SingleChildScrollView(
                  //       scrollDirection: Axis.horizontal,
                  //       child: Row(
                  //         children: [
                  //           StandsBox(
                  //               context, 'assets/slicing/Untitled-26.png'),
                  //           SizedBox(
                  //             width: res_width * 0.05,
                  //           ),
                  //           StandsBox(
                  //               context, 'assets/slicing/Untitled-26.png'),
                  //           SizedBox(
                  //             width: res_width * 0.05,
                  //           ),
                  //           StandsBox(
                  //               context, 'assets/slicing/Untitled-26.png'),
                  //           SizedBox(
                  //             width: res_width * 0.05,
                  //           ),
                  //           StandsBox(context, 'assets/slicing/Untitled-26.png')
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Container(
                      height: Get.height * 0.35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.productList.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: StandsBox(
                              context,
                              'assets/slicing/Untitled-26.png',
                              productController.productList[i].name,
                              productController.productList[i].location,
                              productController.productList[i].desc,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: res_height * 0.025,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 13),
                  //   child: Container(
                  //       child: ListView.builder(
                  //           shrinkWrap: true,
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: 5,
                  //           itemBuilder: (BuildContext context, int index) {
                  //             return StandsBox(
                  //                 context, "assets/slicing/Untitled-26.png");
                  //           })
                  //       //     SingleChildScrollView(
                  //       //   scrollDirection: Axis.horizontal,
                  //       //   child: Row(
                  //       //     children: [
                  //       //       StandsBox(
                  //       //           context, 'assets/slicing/Untitled-26.png'),
                  //       //       SizedBox(
                  //       //         width: res_width * 0.05,
                  //       //       ),
                  //       //       StandsBox(
                  //       //           context, 'assets/slicing/Untitled-26.png'),
                  //       //       SizedBox(
                  //       //         width: res_width * 0.05,
                  //       //       ),
                  //       //       StandsBox(
                  //       //           context, 'assets/slicing/Untitled-26.png'),
                  //       //       SizedBox(
                  //       //         width: res_width * 0.05,
                  //       //       ),
                  //       //       StandsBox(context, 'assets/slicing/Untitled-26.png')
                  //       //     ],
                  //       //   ),
                  //       // ),
                  //       ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Container(
                      height: Get.height * 0.35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.productList.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: StandsBox(
                              context,
                              'assets/slicing/Untitled-26.png',
                              productController.productList[i].name,
                              productController.productList[i].location,
                              productController.productList[i].desc,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.025,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget StandsBox(
    context,
    image,
    name,
    location,
    description,
  ) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        // print(productController.Product1.name);
        Get.to(booking());
      },
      child: Container(
        width: res_width * 0.475,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Image.asset(image, fit: BoxFit.cover)),
            SizedBox(
              height: res_height * 0.01,
            ),
            Text(
              name.toString(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            SizedBox(
              height: res_height * 0.0015,
            ),
            Text(
              location.toString(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            SizedBox(
              height: res_height * 0.0015,
            ),
            Container(
              width: res_width * 0.4,
              child: Text(
                maxLines: 3,
                description.toString(),
                style: TextStyle(fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }

  homeApi() async {
    final uri = Uri.parse('https://qtdev.the4loop.com/api/front/products');

    print(uri);

    // var jsonBody = json.encode(sendData);

    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${globaltoken}',
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    print(response.statusCode);

    print(response.body);
    // try {
    //   var res_data = json.decode(response.body);
    // } catch (e) {
    //   log('$e');
    // }
    var res_data = json.decode(response.body);

    print(res_data);

    if (res_data["status"] == true) {
      print(res_data['data'].length);
      res_data['data'].forEach((element) => {
            productController.addProduct(
              product(
                id: element['id'],
                name: element['name'],
                sku: element['sku'],
                leaseRate: element['lease_rate'],
                thumbnail: element['thumbnail'],
                location: '',
                desc: element['desc'],
                createdAt: element['created_at'],
                updatedAt: element['updated_at'],
              ),
            )
          });

      // Get.to(() => MainLoginScreen());
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  var catvalue;
  var radvalue2;

  filterpopup(cat, type) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          double res_width = MediaQuery.of(context).size.width;
          double res_height = MediaQuery.of(context).size.height;

          return StatefulBuilder(builder: (BuildContext context,
              StateSetter seetState /*You can rename this!*/) {
            return Container(
              height: res_height * 0.5,
              child: Column(
                children: [
                  SizedBox(
                    height: res_height * 0.015,
                  ),
                  Container(
                    height: 7,
                    width: 35,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey),
                        ),
                    child: TextField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.0),
                            borderRadius: BorderRadius.circular(10.0)),

                        hintText: 'Search Category',
                        hintStyle: TextStyle(),
                        contentPadding: EdgeInsets.only(top: 16, left: 16),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Icon(Icons.search_outlined),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        // border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.015,
                  ),
                  Container(
                    // height: res_height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: cat.length,
                      itemBuilder: (context, i) {
                        // print(cat);

                        return GestureDetector(
                          onTap: () {
                            if (type == "cat") {
                              catvalue = cat[i].toString();
                              print(catvalue.toString() + " cat check");
                              setState(() {
                                catvalue;
                              });
                            }
                            if (type == "rad") {
                              radvalue2 = cat[i].toString();
                              final splitted =
                                  cat[i].toString().split('Radius in ');
                              print(splitted.toString() + " rad check");
                              setState(() {
                                radvalue2 = splitted[0];
                              });
                            }
                            Navigator.pop(context);

                            print(catvalue.toString() + "check");
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: kPrimaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Center(child: Text(cat[i].toString())),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.015,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                          // borderRadius: BorderRadius.circular(10)
                          ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Center(
                            child: Text(
                          'Done',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
