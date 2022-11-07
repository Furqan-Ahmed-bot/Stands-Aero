import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/services/remote_services.dart';
import 'package:stande_aero/controller/ProductController.dart';
import 'package:stande_aero/helper/ProductModel.dart';
import 'package:stande_aero/helper/colors.dart';
import 'package:stande_aero/screens/booking/booking.dart';
import 'package:stande_aero/screens/home/drawer.dart';
// import 'package:stande_aero/screens/home/Profile/editprofile.dart';
// import 'package:stande_aero/screens/home/Profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController searchController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;
  final productController = Get.put(ProductController());
  dynamic getPorductResponse;
  String searchQuery = "";
  bool dynamicContent = true;
  List<product> filteredProducts = [];
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      getProducts();
    });

    // print("getPorductResponse"+getPorductResponse['data'].toString());
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

  Future<void> getProducts() async {
    productController.productList.clear();
    getPorductResponse = await ApiService().homeApi();
    print("getPorductResponse" + getPorductResponse.toString());
    getPorductResponse['data'].forEach((element) => {
          // log("Element"+ element.toString());
          setState(() {
            productController.addProduct(
              product(
                  id: element['id'],
                  name: element['name'],
                  sku: element['sku'],
                  thumbnail: element['thumbnail'],
                  location: element['location'].toString(),
                  desc: element['desc'].toString(),
                  createdAt: element['created_at'],
                  updatedAt: element['updated_at']),
            );
          })
        });
    searchProduct(searchQuery);
  }

  Future<List<product>> searchProduct(String query) async {
    print("Called Search " + query);
    setState(() {
      // filteredProducts = [];
      // setState(() {
      filteredProducts = productController.productList
          .where((element) => element.name.contains(query))
          .toList();
    });

    print(filteredProducts.length.toString());
    return filteredProducts;
    //  print(filteredProducts[0].name.toString());
    // });
  }

  Future<List<product>> searchProductFilter(String query) async {
    print("Called Search " + query);
    setState(() {
      // filteredProducts = [];
      // setState(() {
      filteredProducts = productController.productList
          .where((element) => element.desc.contains(query))
          .toList();
    });

    print(filteredProducts.length.toString());
    return filteredProducts;
    //  print(filteredProducts[0].name.toString());
    // });
  }

  bool klr = false;

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    // List<product> filteredProducts = productController.productList.where((element) => element.name.contains("")).toList();
    // print(abc[0].name.toString());
    // print("Search "+productController.productList.where((element) => element.name.contains("")).toList().toString());
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
                        controller: searchController,
                        onChanged: (value) {
                          searchProduct(value);
                        },
                        onEditingComplete: () {
                          searchProduct(searchController.text);
                        },
                        onSubmitted: (value) {
                          searchProduct(value);
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: klr == false
                                      ? kPrimaryColor
                                      : Color(0xffa1a1a1),
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
                                            : 'All Products',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: klr == false
                                              ? Colors.white
                                              : Colors.black,
                                        )),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: klr == false
                                          ? Colors.white
                                          : Colors.black,
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
                              setState(() {
                                // catvalue;
                                klr = true;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: klr == true
                                      ? kPrimaryColor
                                      : Color(0xffa1a1a1),
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
                                          color: klr == true
                                              ? Colors.white
                                              : Colors.black,
                                        )),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: klr == true
                                          ? Colors.white
                                          : Colors.black,
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
                              setState(() {
                                // catvalue;
                                klr = false;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: klr == false
                                      ? kPrimaryColor
                                      : Color(0xffa1a1a1),
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
                                          color: klr == false
                                              ? Colors.white
                                              : Colors.black,
                                        )),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: klr == false
                                          ? Colors.white
                                          : Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     // print();
                          //     filterpopup([
                          //       'Manufacture 1',
                          //       'Manufacture 2',
                          //       'Manufacture 3',
                          //       'Manufacture 4',
                          //     ], "rad");
                          //   },
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width * 0.35,
                          //     decoration: BoxDecoration(
                          //         color: Color(0xffa1a1a1),
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(5))),
                          //     child: Padding(
                          //       padding: const EdgeInsets.all(10.0),
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Text(
                          //               radvalue2 != null
                          //                   ? radvalue2.toString()
                          //                   : 'Bootstrao Kit',
                          //               style: TextStyle(
                          //                 fontSize: 13,
                          //                 color: Colors.black,
                          //               )),
                          //           Icon(
                          //             Icons.arrow_drop_down,
                          //             color: Colors.black,
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width * 0.015,
                          // ),
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
                  FutureBuilder<List<product>>(
                      future: searchProduct(searchController.text),
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Container(
                            height: Get.height * 0.7,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.58,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 5,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: filteredProducts.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 5, right: 5, bottom: 5),
                                  child: StandsBox(
                                    context,
                                    filteredProducts[i].thumbnail,
                                    filteredProducts[i].name,
                                    filteredProducts[i].location,
                                    filteredProducts[i].desc,
                                    filteredProducts[i].id,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
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
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 13),
                  //   child: Container(
                  //     height: Get.height * 0.35,
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: productController.productList.length,
                  //       itemBuilder: (context, i) {
                  //         return Padding(
                  //           padding: const EdgeInsets.only(
                  //               top: 5, left: 5, right: 5, bottom: 5),
                  //           child: StandsBox(
                  //             context,
                  //             productController.productList[i].thumbnail,
                  //             productController.productList[i].name,
                  //             productController.productList[i].location,
                  //             productController.productList[i].desc,
                  //             productController.productList[i].id
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
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

  Widget StandsBox(context, image, name, location, description, id) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        var responseData;
        // print(productController.Product1.name);
        var response_data =
            await ApiService().singleProductDetails(context,id).then((res_data) {
          // log("response of product details" + res_data.toString());

          if (res_data['status'] == true) {
            responseData = res_data['data'][0];

            // print("responseData from home : " + res_data['data'].toString());

            log("products data" + responseData.toString());
          }
          Get.to(booking(bookingapiresponse: responseData));
        });
      },
      child: Container(
        width: res_width * 0.475,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child:
                    // Image.asset(image, fit: BoxFit.cover)),
                    Image.network(image)),
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
