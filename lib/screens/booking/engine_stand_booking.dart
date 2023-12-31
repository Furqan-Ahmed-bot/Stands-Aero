import 'dart:developer';

import 'package:StandsAero/helper/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../services/remote_services.dart';

class stand_booking extends StatefulWidget {
  final productId;
  final productSku;
  final firstDay;
  final lastDay;

  const stand_booking(
      {Key? key,
      required this.productId,
      required this.productSku,
      required this.firstDay,
      required this.lastDay})
      : super(key: key);

  @override
  State<stand_booking> createState() => _stand_bookingState();
}

class _stand_bookingState extends State<stand_booking> {
  TextEditingController location = TextEditingController();
  TextEditingController firstDay = TextEditingController();
  TextEditingController lastDay = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  // String _selectedDate = '';
  // String _dateCount = '';
  // String _range = '';
  // String _rangeCount = '';
  final kToday = DateTime.now();
  final kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
  double pad = 23.0;
  final _formKeyBooking = GlobalKey<FormState>();

  // void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   setState(() {
  //     if (args.value is PickerDateRange) {
  //       _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
  //           // ignore: lines_longer_than_80_chars
  //           ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
  //     } else if (args.value is DateTime) {
  //       _selectedDate = args.value.toString();
  //     } else if (args.value is List<DateTime>) {
  //       _dateCount = args.value.length.toString();
  //     } else {
  //       _rangeCount = args.value.length.toString();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    _rangeStart = widget.firstDay;
    _rangeEnd = widget.lastDay;
    firstDay.text = DateFormat('yyyy-MM-dd').format(widget.firstDay).toString();
    lastDay.text = DateFormat('yyyy-MM-dd').format(widget.lastDay).toString();
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    double pad = 23.0;
    // FocusNode myFocusNode = new FocusNode();

    return Scaffold(
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
              widget.productSku.toString(),
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
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-46.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKeyBooking,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(pad),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TableCalendar(
                            calendarStyle: CalendarStyle(
                                todayDecoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(50)),
                                selectedDecoration:
                                    BoxDecoration(color: kPrimaryColor)),
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
                            firstDay: widget.firstDay,
                            lastDay: widget.lastDay,
                            focusedDay: widget.firstDay,
                            rangeStartDay: _rangeStart,
                            rangeEndDay: _rangeEnd,
                            calendarFormat: _calendarFormat,
                            rangeSelectionMode: _rangeSelectionMode,
                            onRangeSelected: (start, end, focusedDay) {}),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: pad, vertical: pad / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'From',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Container(
                              
                              height: 50,
                              width: res_width / 2.4,
                              decoration: BoxDecoration(color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(7))
                              ),
                              child: TextFormField(
                                readOnly: true,
                                controller: firstDay,
                                
                                decoration: InputDecoration(
                                  
                                    hintText: "22/5/22",
                                    contentPadding: EdgeInsets.only(left: 10),
                                     border: InputBorder.none,
                                  
                                    ),
                                keyboardType: TextInputType.datetime,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Till",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Container(
                              height: 50,
                              width: res_width / 2.4,
                              decoration: BoxDecoration(color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(7))
                              ),
                              child: TextFormField(
                                readOnly: true,
                                controller: lastDay,
                                decoration: InputDecoration(
                                    hintText: "22/5/22",
                                    contentPadding: EdgeInsets.only(left: 10),
                                     border: InputBorder.none,
                                    ),
                                keyboardType: TextInputType.datetime,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: res_width * 0.9,
                  decoration: BoxDecoration(color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(7))
                              ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        controller: location,
                        validator: (value) {
                          if (value == null || value.length == 0) {
                            return '';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Location",
                            labelStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none
                            ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKeyBooking.currentState!.validate()) {
                        var sendData = await {
                          'product_id': widget.productId.toString(),
                          'location': location.text,
                          'date_from': firstDay.text,
                          'date_to': lastDay.text
                        };
                        log("sendData" + sendData.toString());

                        await ApiService().getQuoteRequest(context, sendData);
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
                            'Get a quote',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class custum_Slider extends StatelessWidget {
  const custum_Slider({
    Key? key,
    required this.res_width,
  }) : super(key: key);

  final double res_width;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 190.0,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 7.0,
        initialPage: 2,
      ),
      items: [
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
                  Get.to(() => PreviewImage());
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
  const PreviewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/slicing/Untitled-26.png",
              // width: res_width,
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
