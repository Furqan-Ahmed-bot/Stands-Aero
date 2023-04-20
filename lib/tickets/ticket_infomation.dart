import 'dart:async';

import 'package:StandsAero/helper/colors.dart';
import 'package:StandsAero/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/global.dart';
import '../helper/loader.dart';
import 'ticket_list.dart';

class TicketInformation extends StatefulWidget {
  final id;
  final category;
  final date;
  final status;
  final description;
  final title;
  TicketInformation({
    super.key,
    required this.title,
    required this.id,
    required this.category,
    required this.date,
    required this.status,
    required this.description,
  });

  @override
  State<TicketInformation> createState() => _TicketInformationState();
}

class _TicketInformationState extends State<TicketInformation> {
  @override
  void initState() {
    _isLoading = true;
    getticketinformation();

    // timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    //   print('dataaaaaaaaaaaaa');
    //   getticketinformation();
    // });

    super.initState();
  }

  bool _isLoading = false;
  List chekbox = [
    'Re-Open',
    'Inprogress',
    'On-Hold',
  ];
  dynamic ticketinformation = [];
  Timer? timer;

  Future<void> getticketinformation() async {
    ticketinformation = await ApiService().get_ticket_information(widget.id);
    //print('GetTicketsData ${ticketinformation['data']['Conversions']}');
    // setState(() {
    //   _isLoading = true;
    // });
    if (ticketinformation.length > 0) {
      setState(() {
        _isLoading = false;
      });
    }
    print('Furqan');
  }

  TextEditingController _commentcontroller = new TextEditingController();
  bool valuefirst = false;
  String matxt = '';

  // void check(checkboxbool) {
  //   if (checkboxbool == false) {
  //     matxt = '';
  //     print('false ${matxt}');
  //   } else {
  //     matxt = 'status';
  //     print('true ${matxt}');
  //   }
  // }

  String selected = "";
  List checkListItems = [
    // {
    //   "id": 0,
    //   "value": false,
    //   "title": "New",
    // },
    {
      "id": 1,
      "value": false,
      "title": "Solved",
    },
  ];

  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-62.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 350,
                height: 70,
                child: Center(
                  child: widget.status.toString() == 'Solved'
                      ? Container()
                      : Container(
                          height: 60,
                          child: TextFormField(
                            controller: _commentcontroller,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 15, left: 20),
                              hintText: "Write message...",
                              suffixIcon: InkWell(
                                onTap: () {
                                  var data = {
                                    'comment': _commentcontroller.text
                                  };
                                  ApiService()
                                      .send_ticket_comment(data, widget.id);
                                  _commentcontroller.clear();
                                  Future.delayed(Duration(seconds: 2), () {
                                    getticketinformation();
                                    // setState(() {

                                    // });
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    'assets/slicing/Untitled-72.png',
                                    scale: 4,
                                  ),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Color(0xffDCDFE2),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
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
            children: [
              Text(
                'Ticket Information',
                style: TextStyle(color: Colors.black),
              ),
              Container(
                width: 40,
                height: 40,
                child: Image.asset('assets/slicing/Untitled-4.png'),
              )
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  ticketinformation['data']['user']['image'])

                              //AssetImage('assets/slicing/Untitled-31.png'),
                              ),
                          Text(
                            ticketinformation['data']['user']['username'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ticketinformation['data']['user']['email'],
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                          )
                        ],
                      )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 10),
                //       child: Container(
                //         alignment: Alignment.center,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Icon(
                //               Icons.call,
                //               color: Colors.white,
                //               size: 20,
                //             ),
                //             Text(
                //               'Audio Call',
                //               style:
                //                   TextStyle(color: Colors.white, fontSize: 15),
                //             ),
                //           ],
                //         ),
                //         decoration: BoxDecoration(
                //           color: kPrimaryColor,
                //           border:
                //               Border.all(width: 1, color: Colors.transparent),
                //           borderRadius: BorderRadius.all(Radius.circular(10)),
                //         ),
                //         height: 50,
                //         width: 150,
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(right: 10),
                //       child: Container(
                //         alignment: Alignment.center,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Icon(
                //               Icons.video_call,
                //               color: Colors.white,
                //               size: 20,
                //             ),
                //             Text(
                //               'Video Call',
                //               style:
                //                   TextStyle(color: Colors.white, fontSize: 15),
                //             ),
                //           ],
                //         ),
                //         decoration: BoxDecoration(
                //           color: kPrimaryColor,
                //           border:
                //               Border.all(width: 1, color: Colors.transparent),
                //           borderRadius: BorderRadius.all(Radius.circular(10)),
                //         ),
                //         height: 50,
                //         width: 150,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: res_width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        // Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          // mainAxisAlignment:
                          //     MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID: ',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            Text(
                              widget.id.toString(),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[600]),
                            ),
                            Spacer(),
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
                              'Cateory: ',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            Text(
                              widget.category.toString(),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[600]),
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
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            Text(
                              widget.date.toString(),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[600]),
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
                              'Status: ',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            Text(
                              matxt == '' ? widget.status.toString() : matxt,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Description: ',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.description.toString(),
                          style:
                              TextStyle(fontSize: 13, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: res_width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: checkListItems.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    height: 30,
                                    child: Checkbox(
                                      value: checkListItems[index]["value"],
                                      onChanged: (value) {
                                        setState(() {
                                          for (var element in checkListItems) {
                                            element["value"] = false;
                                          }
                                          checkListItems[index]["value"] =
                                              value!;

                                          if (checkListItems[index]["value"] ==
                                              false) {
                                            matxt = '';
                                            print('false ${matxt}');
                                          } else {
                                            matxt =
                                                checkListItems[index]['title'];
                                            print('true ${matxt}');
                                          }
                                          //matxt = checkListItems[index]['title'];
                                        });

                                        var data = {
                                          'statuss': checkListItems[index]
                                              ['title']
                                        };
                                        ApiService().send_ticket_comment(
                                            data, widget.id);

                                        Get.snackbar(
                                          'Status Updated Successfully',
                                          '',
                                          animationDuration:
                                              Duration(seconds: 2),
                                          snackPosition: SnackPosition.BOTTOM,
                                        );

                                        // check(checkListItems[index]["value"]);
                                        Get.to(ListOfTickets(
                                          flag: true,
                                        ));
                                      },
                                    ),
                                  ),
                                  Text(checkListItems[index]['title'])
                                ],
                              );
                            }),
                        // Row(
                        //   children: [
                        //     Checkbox(
                        //       value: this.valuesecond,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           this.valuesecond = value!;
                        //         });
                        //       },
                        //     ),
                        //     Text('Leave as Current')
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 20,
                        //       child: Checkbox(
                        //         value: this.valuefirst,
                        //         onChanged: (value) {
                        //           setState(() {
                        //             this.valuefirst = value!;
                        //             check();
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //     Text('Solved')
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                FutureBuilder(
                    // future: getticketinformation(),
                    builder: (context, snapshot) {
                  return Column(
                    children: [
                      ticketinformation.length > 0
                          ? ListView.builder(
                              reverse: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: ticketinformation['data']
                                      ['Conversions']
                                  .length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                // var doc = parse(ticketinformation['data']
                                //     ['Conversions'][index]['message']);
                                // var element =
                                //     doc.getElementsByClassName('<p>');

                                // final p = HtmlParser(
                                //     ticketinformation['data']
                                //             ['Conversions'][index]
                                //         ['message']);

                                // p.parse();
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ticketinformation['data']['Conversions']
                                                  [index]['user_name'] ==
                                              'Admin 1'
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5, left: 5),
                                              child: Text(
                                                'Reply From Admin',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          : Text(''),
                                      Container(
                                        width: res_width * 0.85,
                                        decoration: BoxDecoration(
                                            color: ticketinformation['data']
                                                                ['Conversions']
                                                            [index]['user_id']
                                                        .toString() ==
                                                    userid
                                                ? kPrimaryColor
                                                //Color(0xffaf8a39)
                                                : Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ticketinformation['data']
                                                        ['Conversions'][index]
                                                    ['user_name'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                              // Divider(),

                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Last updated on: ',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    ticketinformation['data']
                                                            ['Conversions']
                                                        [index]['time'],
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              Text(
                                                ticketinformation['data']
                                                        ['Conversions'][index]
                                                    ['message'],
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                          : Center(child: spinkit)
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
