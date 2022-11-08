import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:StandsAero/screens/List%20Quotes/list_of_Quote_details.dart';
import 'package:StandsAero/screens/home/drawer.dart';
import 'package:StandsAero/services/remote_services.dart';
import 'package:StandsAero/helper/loader.dart';

class quotes extends StatefulWidget {
  const quotes({Key? key}) : super(key: key);

  @override
  State<quotes> createState() => _quotesState();
}

class _quotesState extends State<quotes> with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;
  bool Quotes_Card = true;
  var quotations_data;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        quotation_list();
      });
    });
    super.initState();
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

  Future<void> quotation_list() async {
    quotations_data = await ApiService().quotation_list();
    log("quotation_list" + quotations_data['data'].toString());
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    // log("quotation_list"+quotations_data['data'].toString());
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
                'List of Quotes',
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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder<void>(
              future: quotation_list(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print("Osama");
                  return FadeTransition(
                    opacity: _fadeInFadeOut,
                    child: Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              physics: ScrollPhysics(),
                              child: quotations_data['data'].length > 0
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      // itemCount: quotations_data['data'].length,
                                      itemCount: quotations_data['data'].length,
                                      itemBuilder: (context, index) {
                                        print("length" +
                                            quotations_data['data']
                                                .length
                                                .toString());
                                        return quotations_data['data'].length > 0
                                            ? Quotess_Card(
                                                id: quotations_data['data']
                                                    [index]['quote_id'],
                                                status: quotations_data['data']
                                                    [index]['status'],
                                                name: quotations_data['data']
                                                    [index]['product_name'],
                                                location: quotations_data['data']
                                                                [index]
                                                            ['location'] ==
                                                        null
                                                    ? "No Location"
                                                    : quotations_data['data']
                                                        [index]['location'],
                                                description:
                                                    quotations_data['data']
                                                            [index]
                                                        ['product_description'],
                                                image: quotations_data['data']
                                                    [index]['product_image'])
                                            : Text("No Quotes found");
                                      })
                                  : Text("No Quotes found"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return spinkit;
                }
              }),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Quotess_Card extends StatelessWidget {
  dynamic name, location, description, status, image, id;

  Quotess_Card(
      {Key? key,
      this.name,
      this.location,
      this.description,
      this.status,
      this.image,
      this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    log("idgetting " + id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            log("onclic id" + id);

            if (id != null) {
              Get.to(() => quotes_details(quoteId: id));
            }

            // Get.to(quotes_details(
            //   quoteId:id
            // ));
          },
          child: Container(
            width: res_width * 0.925,
            child: Card(
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
                          "$status",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: res_height * 0.006,
                        ),
                        Text(
                          "$name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: res_height * 0.006,
                        ),
                        location == null
                            ? Container()
                            : Row(
                                children: [
                                  Text(
                                    "Location: ",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
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
                        SizedBox(
                          width: 200,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "$description",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: res_width * 0.27,
                        height: res_height * 0.17,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Image.network(image))
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
