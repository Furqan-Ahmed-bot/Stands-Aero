import 'dart:developer';

import 'package:StandsAero/helper/loader.dart';
import 'package:StandsAero/screens/home/drawer.dart';
import 'package:StandsAero/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

  dynamic notificationsList;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        notifications();
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

  Future<void> notifications() async {
    notificationsList = await ApiService().getnotifications();
    log("notificationsList" + notificationsList.toString());
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Notifications',
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
            future: notifications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeTransition(
                    opacity: _fadeInFadeOut,
                    child: Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              child: notificationsList['data'].length > 0
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      // itemCount: quotations_data['data'].length,
                                      itemCount:
                                          notificationsList['data'].length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Notifications_Card(
                                              title: notificationsList['data']
                                                      [index]['title']
                                                  .toString(),
                                              bodytext:
                                                  notificationsList['data']
                                                          [index]['body']
                                                      .toString(),
                                              datetimevalue:
                                                  notificationsList['data']
                                                          [index]['created_at']
                                                      .toString()),
                                        );
                                      })
                                  : spinkit,
                            ),
                          ],
                        ),
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

  // Widget NotBox({required this.title, required this.body, required this.time}) {

  //   double res_width = MediaQuery.of(context).size.width;
  //   double res_height = MediaQuery.of(context).size.height;

  //   return Container(
  //     width: res_width * 0.9,
  //     decoration: BoxDecoration(color: Colors.white),
  //     child: Padding(
  //       padding: const EdgeInsets.all(13.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Risus ad magnis rutrum',
  //             style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
  //           ),
  //           SizedBox(
  //             height: res_height * 0.005,
  //           ),
  //           Text(
  //             'Lorem ipsum dolor sit ametconsectetur adipiscing elit. Consectetur adipiscing elit.',
  //             style: TextStyle(fontSize: 13, color: Colors.grey[600]),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class Notifications_Card extends StatelessWidget {
  dynamic title, bodytext, datetimevalue;

  Notifications_Card({
    Key? key,
    this.title,
    this.bodytext,
    this.datetimevalue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: res_width * 0.9,
       decoration: BoxDecoration(
                    color: Colors.white,
    
   borderRadius: BorderRadius.all(Radius.circular(10))
 ),
         
      
    
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(
              height: res_height * 0.005,
            ),
            Text(
              bodytext,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            SizedBox(
              height: res_height * 0.005,
            ),
            Text(
              DateFormat.MMMEd()
                      .format(DateTime.parse(datetimevalue))
                      .toString() +
                  " " +
                  DateFormat.jm()
                      .format(DateTime.parse(datetimevalue))
                      .toString(),
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
