// import 'dart:html';

import 'dart:developer';

import 'package:StandsAero/helper/colors.dart';
import 'package:StandsAero/screens/booking/engine_stand_booking.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

class booking extends StatefulWidget {
  final bookingapiresponse;
  const booking({Key? key, required this.bookingapiresponse}) : super(key: key);

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  var responseData;
  @override
  void initState() {
    responseData = widget.bookingapiresponse;
    super.initState();
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  dynamic kToday = DateTime.now();

  var kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  var kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
  double pad = 23.0;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  int counter = 0;
  late int AVgetCurrentMonth;
  late int AVgetCurrentYear;
  late int AVgetCurrentDay;
  var AVgetDate = '';
  var AVgetcurrentDate = null;
  late int TogetCurrentMonth;
  late int TogetCurrentYear;
  late int TogetCurrentDay;
  var TogetDate = '';
  var TogetcurrentDate = null;
  List responsevalue = [];
  List filteredResponse = [];
  int checkBuild = 0;
  int productId = 0;

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    if (checkBuild == 0) {
      for (var i = 0; i < responseData.length; i++) {
        if (responseData[i]['available_status'].toString() == 'Available') {
          filteredResponse.add(responseData[i]);
        }
      }
    }
    checkBuild++;

    log('filteredResponse' + filteredResponse.toString());

    return Container(
        // future: productDetails(),
        child: Scaffold(
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              responseData[0]['name'],
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
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        // height:  double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-46.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                custum_Slider(
                    res_width: res_width, images: responseData[0]['images']),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: pad, vertical: pad / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        responseData[0]['name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      // Text(
                      //   responseData['location'],
                      //   style: TextStyle(fontSize: 15, color: Colors.black),
                      // ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: pad),
                //   child:
                //       DescriptionTextWidget(text: responseData['d'].toString()),
                // ),
                Padding(
                  padding: EdgeInsets.all(pad),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: TableCalendar(
                        // daysOfWeekVisible: false,

                        calendarStyle: CalendarStyle(
                            todayDecoration: BoxDecoration(
                                color: kPrimaryColor,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(50)),
                            selectedDecoration:
                                BoxDecoration(color: kPrimaryColor)),
                        // calendarFormat: false,
                        headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            leftChevronIcon: CircleAvatar(
                              backgroundColor: kPrimaryColor,
                              child: Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            rightChevronIcon: CircleAvatar(
                              backgroundColor: kPrimaryColor,
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            decoration: BoxDecoration(color: Colors.white)),
                        firstDay: kFirstDay, // kFirstDay,
                        lastDay: DateTime.utc(2030, 1, 1), //kLastDay,
                        focusedDay: kToday,
                        rangeStartDay: _rangeStart,
                        rangeEndDay: _rangeEnd,
                        calendarFormat: _calendarFormat,
                        rangeSelectionMode: _rangeSelectionMode,
                        onRangeSelected: (start, end, focusedDay) {
                          setState(() {
                            _selectedDay = null;
                            kToday = focusedDay;
                            _rangeStart = start;
                            _rangeEnd = end;
                            _rangeSelectionMode = RangeSelectionMode.toggledOn;
                          });
                        }),
                  ),
                ),
                Container(
                  width: res_width * 0.9,
                  child: DropdownButtonFormField(
                    hint: Text(
                      'Select Location',
                      style: TextStyle(color: Color(0xffAFAEAE), fontSize: 14),
                    ), // Not necessary for Option 1
                    items: filteredResponse.map((category) {
                      return DropdownMenuItem(
                          value: category['id'],
                          child: Text(
                            category['address'] == null
                                ? category['location']
                                : category['address'].toString(),
                            style: TextStyle(
                                color: Color(0xffAFAEAE), fontSize: 14),
                          ));
                    }).toList(),

                    // items: [
                    //   'No Interval',
                    //   '10 Minutes',
                    //   '20 Minutes',
                    //   '30 Minutes',
                    //   '40 Minutes',
                    //   '50 Minutes',
                    //   '60 Minutes'
                    // ].map((category) {

                    //   return DropdownMenuItem(
                    //       value: category,
                    //       child: Text(
                    //         category.toString(),
                    //         style: TextStyle(
                    //             color: Color(0xffAFAEAE), fontSize: 14),
                    //       ));
                    // }).toList(),

                    onChanged: (value) {
                      print("location id" + value.toString());
                      productId = int.parse(value.toString());
                    },

                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color(0xffAFAEAE), fontSize: 14),

                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      filled: true,
                      // hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        // borderRadius: BorderRadius.all(
                        //   Radius.circular(10.0),
                        // ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    log("_rangeStart" + _rangeStart.toString());
                    log("_rangeEnd" + _rangeEnd.toString());

                    if (productId == 0) {
                      Get.snackbar(
                        'Error',
                        'Select Location',
                        animationDuration: Duration(seconds: 2),
                        snackPosition: SnackPosition.TOP,
                      );
                    } else {
                      _rangeStart != null && _rangeEnd != null
                          ? Get.to(stand_booking(
                              productId: productId,
                              productSku: responseData[0]['name'],
                              firstDay: _rangeStart,
                              lastDay: _rangeEnd,
                            ))
                          : Get.snackbar(
                              'Error',
                              'Select booking dates before proceeding',
                              animationDuration: Duration(seconds: 2),
                              snackPosition: SnackPosition.TOP,
                            );
                    }
                  },
                  child: Container(
                    width: res_width * 0.9,
                    decoration: BoxDecoration(
                        color: Color(0xff85714e),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Center(
                        child: Text(
                          'Select Booking Dates',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                )
              ],
            ),
          ),
        ),
      ),
    ));
    // Else Condition
    // } else {
    //   return spinkit;
    // }
    // });
  }
}

class custum_Slider extends StatelessWidget {
  const custum_Slider({Key? key, required this.res_width, required this.images})
      : super(key: key);

  final double res_width;
  final images;
  @override
  Widget build(BuildContext context) {
    // log("images data" + images.toString());
    // if(images==''){
    //   print("images are empty");
    // }
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 7.0,
        initialPage: 2,
      ),
      items: images.isNotEmpty
          ? images.map<Widget>((i) {
              log('images data' + i['image'].toString());
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => PreviewImage(image: i['image']));
                      },
                      child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image.network(
                            i['image'],
                            width: res_width,
                            fit: BoxFit.fill,
                          )
                          //  Image.asset(
                          //   "assets/slicing/Untitled-26.png",
                          //   width: res_width,
                          //   fit: BoxFit.fill,
                          // ),
                          ),
                    ),
                  );
                },
              );
            }).toList()
          : [
              1,
              2,
              3,
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => PreviewImage(
                              image: "assets/slicing/Untitled-26.png",
                            ));
                      },
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Image.asset(
                          "assets/slicing/Untitled-26.png",
                          width: res_width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
    );
  }
}

class PreviewImage extends StatelessWidget {
  const PreviewImage({Key? key, required this.image}) : super(key: key);
  final image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(200, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
              children: <Widget>[
                new Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        flag ? "show more" : "show less",
                        style: new TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
