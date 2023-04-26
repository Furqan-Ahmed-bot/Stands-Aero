import 'package:StandsAero/Event/eventdetails.dart';
import 'package:StandsAero/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/remote_services.dart';
import 'package:intl/intl.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  void initState() {
    getEvents();
    _isLoading = true;

    super.initState();
  }

  var SelectedValue;
  bool _isLoading = false;
  bool _isButtonVisible = false;
  dynamic eventslist;
  List eventfiltered = [];
  List filteration = [];
  List eventlocations = [];
  Future<void> getEvents() async {
    eventslist = await ApiService().get_events();
    filteration = eventslist['data'];
    eventfiltered = filteration;
    if (eventslist.length > 0) {
      setState(() {
        _isLoading = false;
      });
    }

    for (var i = 0; i < filteration.length; i++) {
      if (!eventlocations.contains(filteration[i]['address'])) {
        eventlocations.add(filteration[i]['address']);
      } else {}
    }
    print('FilteredList ${eventlocations}');
    //log("notificationsList" + getticketdata['data']['ticket'].toString());

    //ticketdata = getticketdata['data']['ticket';].toString();
  }

  void search(query) async {
    if (query.isEmpty) {
      setState(() {
        eventfiltered = filteration;
      });
    } else {
      setState(() {
        eventfiltered = filteration
            .where(
              (item) => (item['title'].toLowerCase() +
                      item['start'].toLowerCase() +
                      item['address'].toLowerCase())
                  .contains(query.toLowerCase()),
            )
            .toList();
      });
    }
  }

  TextEditingController _searchcontroller = new TextEditingController();
  TextEditingController delivery_date = TextEditingController();
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
                'Events',
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
        body: Column(
          children: [
            Container(
              width: res_width * 0.85,
              height: 60,
              child: TextFormField(
                onChanged: (value) {
                  search(value);
                },
                controller: _searchcontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15, left: 20),
                  hintText: "Search...",
                  suffixIcon: InkWell(
                    onTap: () {
                      // search(_searchcontroller.text);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.search)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context, //context of current state
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        // print("date"+
                        //     pickedDate.toString()); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        // print("final date" + formattedDate);
                        setState(() {
                          _isButtonVisible = true;
                          print('Okkkkkkkkkkkkkk');
                          delivery_date.text = formattedDate;
                          search(delivery_date
                              .text); //set output date to TextField value.
                        });
                        // print("delivery_date.text" + delivery_date.text);
                        //formatted date output using intl package =>  2021-03-16
                      } else {
                        print("Date is not selected");
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Icon(
                          //   Icons.calendar_month,
                          //   color: Colors.white,
                          //   size: 25,
                          // ),
                          Text(
                            delivery_date.text.isEmpty
                                ? 'Select a Date'
                                : delivery_date.text,
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        border: Border.all(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 55,
                      width: 170,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context, //context of current state
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        // print("date"+
                        //     pickedDate.toString()); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        // print("final date" + formattedDate);
                        setState(() {
                          _isButtonVisible = true;
                          print('Okkkkkkkkkkkkkk');
                          delivery_date.text = formattedDate;
                          search(delivery_date
                              .text); //set output date to TextField value.
                        });
                        // print("delivery_date.text" + delivery_date.text);
                        //formatted date output using intl package =>  2021-03-16
                      } else {
                        print("Date is not selected");
                      }
                    },
                    child: DropdownButtonHideUnderline(
                      child:

                          //starting the dropdown
                          SizedBox(
                        height: 55,
                        width: res_width * 0.4,
                        child: DropdownButtonFormField(
                          dropdownColor: kPrimaryColor,
                          iconEnabledColor: Colors.white,
                          isDense: true,
                          isExpanded: true,
                          decoration: InputDecoration(
                            hintText: '       Location',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 14),
                            labelStyle: TextStyle(color: Colors.white),

                            prefixIconConstraints: BoxConstraints(minWidth: 25),
                            //prefixIcon: Icon(Icons.arrow_drop_down),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),

                            filled: true,
                            fillColor: kPrimaryColor,
                          ),
                          items: eventlocations.map((item) {
                            return new DropdownMenuItem(
                                child: new Text(
                                  item, //Names that the api dropdown contains
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.white),
                                ),
                                value: item
                                    .toString() //Id that has to be passed that the dropdown has.....
                                //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                                );
                          }).toList(),
                          onChanged: (newVal) {
                            // for (var i = 0; i < mylistt.length; i++) {
                            //   if (newVal == mylistt[i]['name']) {
                            //     setState(() {
                            //       categoryid = mylistt[i]['id'];
                            //       print('priorityyyyyyy ${categoryid}');
                            //     });
                            //     break;
                            //   }
                            // }
                            search(newVal);
                            _isButtonVisible = true;
                          },
                          value:
                              SelectedValue, //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
                        ),
                      ),
                    ),
                  ),
                ),
                _isButtonVisible
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                search('');
                                delivery_date.clear();
                                _isButtonVisible = false;
                              });
                            },
                            child: Icon(Icons.clear)),
                      )
                    : Container()
              ],
            ),
            // SizedBox(
            //   height: 30,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     TextFormField(
            //       controller: delivery_date,
            //       readOnly: true,
            //       onSaved: (newValue) => delivery_date.text,
            //       style: TextStyle(color: Colors.black),
            //       decoration: InputDecoration(
            //         isCollapsed: true,
            //         // contentPadding: EdgeInsets.symmetric(vertical: 0),
            //         constraints: BoxConstraints(maxWidth: 120, minWidth: 10),
            //         border: UnderlineInputBorder(
            //           borderSide: BorderSide(color: Colors.grey),
            //         ),
            //         enabledBorder: UnderlineInputBorder(
            //           borderSide: BorderSide(color: Colors.grey),
            //         ),
            //         focusedBorder: UnderlineInputBorder(
            //           borderSide: BorderSide(color: Colors.grey),
            //         ),
            //         disabledBorder: UnderlineInputBorder(
            //           borderSide: BorderSide(color: Colors.grey),
            //         ),
            //       ),
            //       onTap: () async {
            //         DateTime? pickedDate = await showDatePicker(
            //             context: context, //context of current state
            //             initialDate: DateTime.now(),
            //             firstDate: DateTime(
            //                 2000), //DateTime.now() - not to allow to choose before today.
            //             lastDate: DateTime(2101));

            //         if (pickedDate != null) {
            //           // print("date"+
            //           //     pickedDate.toString()); //pickedDate output format => 2021-03-10 00:00:00.000
            //           String formattedDate =
            //               DateFormat('yyyy-MM-dd').format(pickedDate);
            //           // print("final date" + formattedDate);
            //           setState(() {
            //             _isButtonVisible = true;
            //             print('Okkkkkkkkkkkkkk');
            //             delivery_date.text = formattedDate;
            //             search(delivery_date
            //                 .text); //set output date to TextField value.
            //           });
            //           // print("delivery_date.text" + delivery_date.text);
            //           //formatted date output using intl package =>  2021-03-16
            //         } else {
            //           print("Date is not selected");
            //         }
            //       },
            //     ),
            //     DropdownButtonHideUnderline(
            //       child:

            //           //starting the dropdown
            //           SizedBox(
            //         height: 55,
            //         width: res_width * 0.4,
            //         child: DropdownButtonFormField(
            //           isDense: true,
            //           isExpanded: true,
            //           decoration: InputDecoration(
            //             prefixIconConstraints: BoxConstraints(minWidth: 25),
            //             //prefixIcon: Icon(Icons.arrow_drop_down),
            //             focusedBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10.0),
            //               borderSide: BorderSide(
            //                 color: Colors.transparent,
            //               ),
            //             ),
            //             enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10.0),
            //               borderSide: BorderSide(
            //                 color: Colors.transparent,
            //               ),
            //             ),

            //             filled: true,
            //             fillColor: kPrimaryColor,
            //           ),
            //           items: eventlocations.map((item) {
            //             return new DropdownMenuItem(
            //                 child: new Text(
            //                   item, //Names that the api dropdown contains
            //                   style: TextStyle(
            //                     fontSize: 13.0,
            //                   ),
            //                 ),
            //                 value: item
            //                     .toString() //Id that has to be passed that the dropdown has.....
            //                 //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
            //                 );
            //           }).toList(),
            //           onChanged: (newVal) {
            //             // for (var i = 0; i < mylistt.length; i++) {
            //             //   if (newVal == mylistt[i]['name']) {
            //             //     setState(() {
            //             //       categoryid = mylistt[i]['id'];
            //             //       print('priorityyyyyyy ${categoryid}');
            //             //     });
            //             //     break;
            //             //   }
            //             // }
            //           },
            //           value:
            //               SelectedValue, //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     _isButtonVisible
            //         ? InkWell(
            //             onTap: () {
            //               setState(() {
            //                 search('');
            //                 delivery_date.clear();
            //                 _isButtonVisible = false;
            //               });
            //             },
            //             child: Icon(Icons.clear))
            //         : Container()
            //   ],
            // ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: eventfiltered.length,
                          itemBuilder: (context, index) {
                            String str = eventfiltered[index]['url'];
                            var arr = str.split('/');
                            // var doc = parse(getticketdata['data']
                            //     ['ticket'][index]['message']);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Get.to(EventsDetails(
                                    eventtitle: eventfiltered[index]['title'],
                                    eventdate: eventfiltered[index]['start'],
                                    eventlocation: eventfiltered[index]
                                        ['address'],
                                    eventimage: eventfiltered[index]['image'],
                                    eventdescription: eventfiltered[index]
                                        ['description'],
                                    eventurl: eventfiltered[index]['url'],
                                  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 20, 10, 10),
                                            child: Container(
                                                // color: Colors.blue,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[400],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                height: 100,
                                                width: 100,
                                                child: eventfiltered[index]
                                                            ['image'] !=
                                                        null
                                                    ? Image.network(
                                                        eventfiltered[index]
                                                            ['image'],
                                                      )
                                                    : Image.asset(
                                                        'assets/images/dummyProduct.png',
                                                        fit: BoxFit.cover,
                                                      )),
                                          ),
                                          SizedBox(
                                            width: res_width * 0.013,
                                          ),
                                          Container(
                                            width: res_width * 0.51,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  eventfiltered[index]['title'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black),
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: res_width * 0.35,
                                                      child: Text(
                                                        eventfiltered[index]
                                                            ['start'],
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors
                                                                .grey[600]),
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
                                                      'Location: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: res_width * 0.35,
                                                      child: Text(
                                                        eventfiltered[index]
                                                            ['address'],
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors
                                                                .grey[600]),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 10,
                                                // ),
                                                // Row(
                                                //   // mainAxisAlignment:
                                                //   //     MainAxisAlignment.spaceBetween,
                                                //   children: [
                                                //     Text(
                                                //       'Url : ',
                                                //       style: TextStyle(
                                                //           fontWeight:
                                                //               FontWeight.bold,
                                                //           fontSize: 13,
                                                //           color: Colors.black),
                                                //     ),
                                                //     InkWell(
                                                //       onTap: () {
                                                //         _launchURL();
                                                //       },
                                                //       child: Container(
                                                //         width: res_width * 0.35,
                                                //         child: Text(
                                                //           arr[2].toString(),
                                                //           style: TextStyle(
                                                //               fontSize: 13,
                                                //               color: Colors
                                                //                   .grey[600]),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
            )
          ],
        ),
      ),
    );
  }
}
