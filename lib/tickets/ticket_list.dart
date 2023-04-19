import 'package:StandsAero/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/loader.dart';
import '../services/remote_services.dart';
import 'create_tickets.dart';
import 'ticket_infomation.dart';

class ListOfTickets extends StatefulWidget {
  const ListOfTickets({super.key});

  @override
  State<ListOfTickets> createState() => _ListOfTicketsState();
}

class _ListOfTicketsState extends State<ListOfTickets> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        getTickets();
      });
    });
    super.initState();
  }

//   var document = parse('''
// <body>
//   <h2>Header 1</h2>
//   <p>Text.</p>
//   <h2>Header 2</h2>
//   More text.
//   <br/>
// </body>''');
  dynamic getticketdata = [];
  dynamic ticketdata = [];

  Future<void> getTickets() async {
    getticketdata = await ApiService().get_tickets();
    //log("notificationsList" + getticketdata['data']['ticket'].toString());
    setState(() {
      ticketdata = getticketdata['data']['ticket'].toString();
    });
  }
  // final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-62.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.task,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(CreateTickets());
            },
          ),
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tickets',
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
          body: FutureBuilder(
              future: getTickets(),
              builder: (context, snapshot) {
                return SingleChildScrollView(
                    child: ticketdata.length > 0
                        ? Column(
                            children: [
                              ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      getticketdata['data']['ticket'].length,
                                  itemBuilder: (context, index) {
                                    // var doc = parse(getticketdata['data']
                                    //     ['ticket'][index]['message']);
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(TicketInformation(
                                            title: getticketdata['data']
                                                    ['ticket'][index]
                                                ['category_name'],
                                            id: getticketdata['data']['ticket']
                                                [index]['ticket_id'],
                                            category: getticketdata['data']
                                                    ['ticket'][index]
                                                ['category_name'],
                                            date: getticketdata['data']
                                                ['ticket'][index]['created_at'],
                                            status: getticketdata['data']
                                                ['ticket'][index]['status'],
                                            description: getticketdata['data']
                                                ['ticket'][index]['message'],
                                          ));
                                        },
                                        child: Container(
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  getticketdata['data']
                                                          ['ticket'][index]
                                                      ['category_name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: res_height * 0.005,
                                                ),
                                                Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'ID: ',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      getticketdata['data']
                                                              ['ticket'][index]
                                                          ['ticket_id'],
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.grey[600]),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      'Category: ',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: 65,
                                                      child: Text(
                                                        getticketdata['data']
                                                                    ['ticket']
                                                                [index]
                                                            ['category_name'],
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors
                                                                .grey[600]),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Date: ',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      getticketdata['data']
                                                              ['ticket'][index]
                                                          ['created_at'],
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.grey[600]),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      'Status: ',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 52),
                                                      child: Container(
                                                        width: 30,
                                                        child: Text(
                                                          getticketdata['data']
                                                                  ['ticket']
                                                              [index]['status'],
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .grey[600]),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Description: ',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  getticketdata['data']
                                                          ['ticket'][index]
                                                      ['message'],
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.grey[600]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          )
                        : Center(child: spinkit));
              })),
    );
  }
}
