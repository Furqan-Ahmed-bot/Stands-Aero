import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/List%20Quotes/list_of_Quote_details.dart';
import 'package:stande_aero/screens/home/drawer.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
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
          // leading: GestureDetector(
          //   behavior: HitTestBehavior.translucent,
          //   onTap: () {
          //     Navigator.pop(context);
          //     // _key.currentState!.openDrawer();
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(15),
          //     child: Container(
          //         width: 25,
          //         child: Image.asset(
          //           'assets/slicing/Untitled-3.png',
          //         )),
          //   ),
          // ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Payment History',
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
        // extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          // height:  double.infinity,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/slicing/Untitled-46.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Quotes_Card(
                  MODEL: "CF34-10 DAE",
                  location: "Miami, Florida",
                  description:
                      "Lorem Ipsum is simply \ndummy text of the printing \nand typesetting industry",
                ),
                Quotes_Card(
                  MODEL: "CF34-10 DAE",
                  location: "Miami, Florida",
                  description:
                      "Lorem Ipsum is simply \ndummy text of the printing \nand typesetting industry",
                ),
                Quotes_Card(
                  MODEL: "CF34-10 DAE",
                  location: "Miami, Florida",
                  description:
                      "Lorem Ipsum is simply \ndummy text of the printing \nand typesetting industry",
                ),
                Quotes_Card(
                  MODEL: "CF34-10 DAE",
                  location: "Miami, Florida",
                  description:
                      "Lorem Ipsum is simply \ndummy text of the printing \nand typesetting industry",
                )
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
        GestureDetector(
          onTap: () {
            // Get.to(quotes_details());
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
        ),
        SizedBox(
          height: res_height * 0.0075,
        ),
      ],
    );
  }
}
