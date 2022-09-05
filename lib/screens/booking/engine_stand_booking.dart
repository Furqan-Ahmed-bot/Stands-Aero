import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/helper/colors.dart';
import 'package:stande_aero/screens/auth/mainlogin.dart';
import 'package:table_calendar/table_calendar.dart';

class stand_booking extends StatelessWidget {
  const stand_booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    double pad = 23.0;
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
          children: [
            Text(
              'CF34-10 DAE',
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
        height: double.infinity,
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
                // custum_Slider(res_width: res_width),

                Padding(
                  padding: EdgeInsets.all(pad),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: TableCalendar(
                      // daysOfWeekVisible: false,

                      calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(
                              color: kPrimaryColor,
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
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: pad, vertical: pad / 2),
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
                            height: 40,
                            width: res_width / 2.4,
                            decoration: BoxDecoration(color: Colors.grey),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "22/5/22",
                                  contentPadding: EdgeInsets.only(left: 10)),
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
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Container(
                            height: 40,
                            width: res_width / 2.4,
                            decoration: BoxDecoration(color: Colors.grey),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "22/5/22",
                                  contentPadding: EdgeInsets.only(left: 10)),
                              keyboardType: TextInputType.datetime,
                            ),
                          )
                        ],
                      ),
                      // Text(
                      //   'Miami, Florida',
                      //   style: TextStyle(color: Colors.black),
                      // ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainLoginScreen());
                  },
                  child: Container(
                    width: res_width * 0.9,
                    decoration: BoxDecoration(
                        color: Color(0xffaf8a39),
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
    );
  }
}
