import 'dart:developer';

import 'package:StandsAero/tickets/create_tickets.dart';
import 'package:StandsAero/widgets/disallow_indicator_widget.dart';
import 'package:StandsAero/widgets/remove_focus_widget.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:StandsAero/services/remote_services.dart';
import 'package:StandsAero/controller/ProductController.dart';
import 'package:StandsAero/helper/ProductModel.dart';
import 'package:StandsAero/helper/colors.dart';
import 'package:StandsAero/screens/booking/booking.dart';
import 'package:StandsAero/screens/home/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../audio_video_calling_agora/videocalling/callpage.dart';
import '../../helper/loader.dart';

// import 'package:StandsAero/screens/home/Profile/editprofile.dart';
// import 'package:StandsAero/screens/home/Profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController searchController = TextEditingController();

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ClientRole? _role = ClientRole.Broadcaster;

  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;
  final productController = Get.put(ProductController());
  dynamic getPorductResponse;
  String searchQuery = "";
  bool dynamicContent = true;
  List<product> filteredProducts = [];
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int filterCounter = 0;
  dynamic officeTimings;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    requestPermissions();
    // [Permission.microphone].request();
    // [Permission.camera].request();

    Future.delayed(Duration.zero, () {
      getProducts();
      getOfficeTimings();
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

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.camera,
    ].request();

    if (statuses[Permission.microphone] != PermissionStatus.granted ||
        statuses[Permission.camera] != PermissionStatus.granted) {
      // Permissions were denied. Handle the scenario accordingly.
      // For example, display an error message or disable certain features.
    } else {
      // Permissions were granted. Proceed with the app logic.
    }
  }

  Future<void> getOfficeTimings() async {
    officeTimings = await ApiService().getOfficeTimings();
    log("officeTimings" + officeTimings.toString());
  }

  Future<void> getProducts() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
    productController.productList.clear();
    getPorductResponse = await ApiService().homeApi();
    log("getPorductResponse" + getPorductResponse.toString());
    getPorductResponse['data'].forEach((element) => {
          // log("Element"+ element.toString());
          setState(() {
            productController.addProduct(
              product(
                id: element['id'],
                name: element['name'],
                slug: element['slug'],
                sku: element['sku'],
                thumbnail: element['thumbnail'],
                location: element['location'].toString(),
                address: element['address'] ?? "",
                desc: element['desc'] ?? "",
                categoryId: element['category_id'],
                manufacturerId: element['manufacturer_id'],
                categoryName: element['category_name'],
                manufacturerName: element['manufacturer_name'] ?? "",
                availableStatus: element['available_status'] ?? "",
                color: element['color'],
                // status: element['status'],
              ),
            );
          })
        });
    searchProduct(searchQuery);
    Navigator.pop(context);
  }

  Future<List<product>> searchProduct(String query) async {
    filterCounter = 1;
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
          .where((element) => element.categoryName.contains(query))
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
            mainAxisSize: MainAxisSize.min,
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
          actions: [
            GestureDetector(
              onTap: () {
                print('Hello');
                Get.to(CallPage(
                  channelName: '117supportCaller',

                  role: _role,
                  // RtcToken: rtcToken['pusherData']['webToken'],
                ));

                // if (bottomctrl.navigationBarIndexValue != 1) {
                // bottomctrl.navBarChange(1);
                // } else {
                //   Navigator.pop(context);
                // }
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 12, left: 12, right: 15),
                child: Container(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/slicing/videocallicon.png')),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog<String>(
                    context: context,
                    barrierColor: Color(0xff212331).withOpacity(0.90),
                    builder: (BuildContext context) => AlertDialog(
                          // insetPadding: EdgeInsets.all(20),
                          contentPadding: EdgeInsets.all(20),

                          // title: const Text('Confirm'),
                          content: Container(
                            height: 170,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Column(children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: 20,
                                      child: Image.asset(
                                          'assets/slicing/liveChat-icon.png')),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Live Call With Contact Support",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 14,
                                                fontWeight: FontWeight.w100),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "${officeTimings['data']['openingtiming']} To ${officeTimings['data']['closingtiming']}",
                                            style: TextStyle(
                                                color: Color(0xff282828),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  officeTimings['data']['status'] == 'online'
                                      ? Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xffff3ea548),
                                              border: Border.all(
                                                  width: 4,
                                                  color: Color(0xffff3ea548)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: Text(
                                            'Online',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8,
                                                letterSpacing: 0.1,
                                                //  backgroundColor:kprimarycolor ,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 177, 3, 3),
                                              border: Border.all(
                                                  width: 4,
                                                  color: Color.fromARGB(
                                                      255, 177, 3, 3)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: Text(
                                            'Offline',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8,
                                                letterSpacing: 0.1,
                                                //  backgroundColor:kprimarycolor ,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              Container(
                                height: 1,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              GestureDetector(
                                onTap: () async {
                                  if (officeTimings['data']['status'] ==
                                      'online') {
                                    Uri phoneno = Uri.parse('tel:+1307558873');
                                    if (await launchUrl(phoneno)) {
                                      //dialer opened
                                    } else {
                                      //dailer is not opened
                                    }
                                  } else {
                                    Navigator.pop(context);
                                    Get.to(() => CreateTickets());
                                  }
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 20,
                                        child: Image.asset(
                                            'assets/slicing/phone-icon.png')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Call At 305-558-873",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              Container(
                                height: 1,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              GestureDetector(
                                onTap: () async {
                                  if (officeTimings['data']['status'] ==
                                      'online') {
                                    Uri email = Uri.parse(
                                        'mailto:+support@stands.aero');
                                    if (await launchUrl(email)) {
                                      //dialer opened
                                    } else {
                                      //dailer is not opened
                                    }
                                  } else {
                                    Navigator.pop(context);
                                    Get.to(() => CreateTickets());
                                  }
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 20,
                                        child: Image.asset(
                                            'assets/slicing/email-icon.png')),
                                    Padding(padding: EdgeInsets.all(7)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Email: support@stands.aero",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w800),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 8, right: 8, left: 8),
                child: Container(
                    width: 20,
                    child: Image.asset('assets/slicing/call-icon.png')),
              ),
            ),
            GestureDetector(
              onTap: () {
                // if (bottomctrl.navigationBarIndexValue != 1) {
                bottomctrl.navBarChange(1);
                // } else {
                //   Navigator.pop(context);
                // }
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 12, left: 12, right: 15),
                child: Container(
                    width: 16,
                    child: Image.asset('assets/slicing/Untitled-52.png')),
              ),
            ),
          ],
        ),
        body: FadeTransition(
          opacity: _fadeInFadeOut,
          child: RemoveFocusWidget(
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

                            hintText: 'Search...',
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
                      // width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.only(left: 10),
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
                              onTap: () {
                                setState(() {
                                  searchProduct("");
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                    color: filterCounter == 1
                                        ? kPrimaryColor
                                        : Color(0xffa1a1a1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
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
                                            color: filterCounter == 1
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: filterCounter == 1
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
                                  filterCounter = 2;
                                  searchProductFilter("Engine Stand");
                                  klr = true;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                    color: filterCounter == 2
                                        ? kPrimaryColor
                                        : Color(0xffa1a1a1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
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
                                            color: filterCounter == 2
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: filterCounter == 2
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
                                  filterCounter = 3;
                                  searchProductFilter("Bootstrap Kit");
                                  klr = false;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                    color: filterCounter == 3
                                        ? kPrimaryColor
                                        : Color(0xffa1a1a1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
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
                                            color: filterCounter == 3
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: filterCounter == 3
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: res_height * 0.025,
                    ),
                    FutureBuilder<List<product>>(
                        future: filterCounter == 1
                            ? searchProduct(searchController.text)
                            : filterCounter == 2
                                ? searchProductFilter("Engine Stand")
                                : searchProductFilter("Bootstrap Kit"),
                        builder: (context, snapshot) {
                          return Container(
                            height: Get.height * 0.7,
                            child: DisAllowIndicatorWidget(
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.9,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 5,
                                ),
                                shrinkWrap: true,
                                itemCount: filteredProducts.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                itemBuilder: (context, i) {
                                  return StandsBox(
                                    context,
                                    filteredProducts[i].thumbnail,
                                    filteredProducts[i].name,
                                    filteredProducts[i].slug,
                                    filteredProducts[i].location,
                                    filteredProducts[i].desc,
                                    filteredProducts[i].id,
                                    filteredProducts[i].manufacturerName,
                                  );
                                },
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: res_height * 0.025,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget StandsBox(
      context, image, name, slug, location, description, id, manufacturename) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    if (image.contains('no-image.png')) {
      log("image dummy hy" + image.toString());
    }
    return GestureDetector(
      onTap: () async {
        var responseData;
        // print(productController.Product1.name);
        var response_data = await ApiService()
            .singleProductDetails(context, slug)
            .then((res_data) {
          // log("response of product details" + res_data.toString());

          if (res_data['status'] == true) {
            responseData = res_data['data'];

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
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: res_height * 0.15,
              width: res_width * 0.5,
              child: Image.network(
                image,
                loadingBuilder: (context, child, loadingProgress) {
                  // return SizedBox(
                  //     height: 100,
                  //     child: Center(child: CircularProgressIndicator()));
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: image == null || image.contains('no-image.png')
                          ? Image.asset(
                              'assets/images/ComingSoon.jpg',
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              image,
                              fit: BoxFit.cover,
                            ));
                },
                errorBuilder: (context, error, stackTrace) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/ComingSoon.jpg',
                        fit: BoxFit.cover,
                      ));
                },
              ),
            ),
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
              manufacturename.toString(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            // SizedBox(
            //   height: res_height * 0.0015,
            // ),
            Container(
              width: res_width * 0.4,
              child: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
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
