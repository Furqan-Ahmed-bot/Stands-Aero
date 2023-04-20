// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/remote_services.dart';

class CreateTickets extends StatefulWidget {
  const CreateTickets({super.key});

  @override
  State<CreateTickets> createState() => _CreateTicketsState();
}

class _CreateTicketsState extends State<CreateTickets> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        getTickets();
      });
    });
    super.initState();
  }

  void validation() {
    if (_ticketcreatecontroller.text.isEmpty &&
        _descriptioncontroller.text.isEmpty &&
        categoryid == null) {
      Get.snackbar(
        'All fields are empty',
        'please fill all fields',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
    } else if (_ticketcreatecontroller.text.isEmpty) {
      Get.snackbar(
        'ticket subject is empty',
        'please enter ticket subject',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("ticket subject is empty"),
      //   ),
      // );
    } else if (categoryid == null || categoryid.isEmpty) {
      Get.snackbar(
        'category is empty',
        'Please Select Category',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("Please Select Category"),
      //   ),
      // );
    } else if (_descriptioncontroller.text.isEmpty) {
      Get.snackbar(
        'description is empty',
        'please enter description',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("description is empty"),
      //   ),
      // );
    } else {
      print('Hello');
      var sendData = {
        'subject': _ticketcreatecontroller.text,
        'category': categoryid,
        'message': _descriptioncontroller.text
      };
      // Get.to(TicketInformation());
      ApiService().create_ticket(context, sendData);
    }
  }

  var _propertytype;
  var countryid;
  List<String> _locations = [
    'Designation-1',
    'Designation-2',
    'Designation-3',
    'Designation-4'
  ];
  List jobfielddata = [];
  var categoryid;

  dynamic dropdowndata = [];
  List mylist = ['Ahmed', 'Ali'];
  List mylistt = [];
  String? _selectedValue1;
  TextEditingController _ticketcreatecontroller = new TextEditingController();
  TextEditingController _descriptioncontroller = new TextEditingController();
  // List<CustomMenuTile> mylist = [];
  Future<void> getTickets() async {
    dropdowndata = await ApiService().get_tickets();
    // log("notificationsList" +
    //     dropdowndata['data']['ticketCategories'].toString());

    setState(() {
      mylistt = dropdowndata['data']['ticketCategories'];
      print('MyList is ${mylistt}');
    });

    for (var i = 0; i < mylistt.length; i++) {
      jobfielddata.add(mylistt[i]['name']);
    }

    print('MyList is ${jobfielddata}');
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
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
            children: [
              Text(
                'Create Tickets',
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Ticket Subject:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: res_width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _ticketcreatecontroller,
                      // controller: location,
                      // validator: (value) {
                      //   if (value == null || value.length == 0) {
                      //     return '';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                SizedBox(
                  height: res_height * 0.025,
                ),
                Text(
                  'Select Category:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonHideUnderline(
                  child:

                      //starting the dropdown
                      SizedBox(
                    height: 60,
                    width: res_width * 0.85,
                    child: DropdownButtonFormField(
                      isDense: true,
                      isExpanded: true,
                      decoration: InputDecoration(
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
                        fillColor: Colors.grey,
                      ),
                      items: jobfielddata.map((item) {
                        return new DropdownMenuItem(
                            child: new Text(
                              item, //Names that the api dropdown contains
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                            value: item
                                .toString() //Id that has to be passed that the dropdown has.....
                            //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                            );
                      }).toList(),
                      onChanged: (newVal) {
                        for (var i = 0; i < mylistt.length; i++) {
                          if (newVal == mylistt[i]['name']) {
                            setState(() {
                              categoryid = mylistt[i]['id'];
                              print('priorityyyyyyy ${categoryid}');
                            });
                            break;
                          }
                        }
                      },
                      value:
                          countryid, //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     CustomMenuWidget.showBottomSheet(context, [
                //       CustomMenuTile(
                //           onTapped: () {
                //             setState(() {
                //               _selectedValue1 = 'New York';
                //               // city.text = 'New York';
                //               // isCityValidation = false;
                //             });
                //             Navigator.pop(context);
                //           },
                //           text: 'New York'),
                //       CustomMenuTile(
                //           onTapped: () {
                //             setState(() {
                //               _selectedValue1 = 'New Jersey';
                //               // city.text = 'New Jersey';
                //               // isCityValidation = false;
                //             });
                //             Navigator.pop(context);
                //           },
                //           text: 'New Jersey'),
                //     ]);
                //   },
                //   child: Container(
                //     width: res_width * 0.85,
                //     height: 50,
                //     padding: const EdgeInsets.only(left: 18, right: 10),
                //     decoration: BoxDecoration(
                //       color: Colors.grey,
                //       borderRadius: BorderRadius.circular(7.0),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(
                //           _selectedValue1 ?? '',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w500,
                //               fontSize: 16,
                //               color: _selectedValue1 == null
                //                   ? Colors.black54
                //                   : Colors.black),
                //         ),
                //         Icon(Icons.arrow_drop_down),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: res_height * 0.025,
                ),
                Text(
                  'Description:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: res_width * 0.85,
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    child: TextFormField(
                      controller: _descriptioncontroller,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                    ),
                  ),
                ),
                SizedBox(
                  height: res_height * 0.025,
                ),
                GestureDetector(
                  onTap: () {
                    validation();
                  },
                  child: Container(
                    width: res_width * 0.85,
                    decoration: BoxDecoration(
                        color: Color(0xff85714e),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: 50,
                //   width: res_width * 0.85,
                //   child: Container(
                //     height: 50,
                //     child: DropdownButtonFormField(
                //       icon: Icon(Icons.arrow_drop_down),
                //       decoration: InputDecoration(
                //         hintText: "Designation",
                //         prefixIconConstraints: BoxConstraints(minWidth: 25),
                //         //prefixIcon: Icon(Icons.arrow_drop_down),
                //         focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10.0),
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10.0),
                //           borderSide: BorderSide(
                //             color: Colors.grey,
                //             width: 5,
                //           ),
                //         ),
                //         filled: true,
                //         fillColor: Colors.grey,
                //       ),
                //       dropdownColor: Colors.blue,
                //       value: _propertytype,
                //       onChanged: (newValue) {
                //         setState(() {
                //           _propertytype = newValue!;
                //         });
                //       },
                //       items: _locations.map((location) {
                //         return DropdownMenuItem(
                //           child: new Text(
                //             location,
                //             // style: medium18blackwopacity,
                //           ),
                //           value: location,
                //         );
                //       }).toList(),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
