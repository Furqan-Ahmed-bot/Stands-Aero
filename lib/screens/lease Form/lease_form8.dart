import 'package:StandsAero/widgets/disallow_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../helper/global.dart';
import '../../services/remote_services.dart';
import '../payment/paypal.dart';

class lease_form8 extends StatefulWidget {
  const lease_form8({Key? key}) : super(key: key);

  @override
  State<lease_form8> createState() => _lease_form8State();
}

class _lease_form8State extends State<lease_form8> {
  @override
  void initState() {
    stand_manufacturer.text = global_stand_manufacturer;
    stand_color.text = global_stand_color;
    stand_type.text = global_stand_type;
    stand_serial_number.text = global_stand_serial_number;
    super.initState();
  }

  TextEditingController registered_agent = TextEditingController();
  TextEditingController signature_1 = TextEditingController();
  TextEditingController signature_2 = TextEditingController();
  TextEditingController customer_detail = TextEditingController();
  TextEditingController redelivery_dates = TextEditingController();
  TextEditingController redelivery_days = TextEditingController();
  TextEditingController receiving_date = TextEditingController();
  TextEditingController accepting_location = TextEditingController();
  TextEditingController stand_quantity = TextEditingController();
  TextEditingController shipping_cost = TextEditingController();
  TextEditingController stand_manufacturer = TextEditingController();
  TextEditingController stand_color = TextEditingController();
  TextEditingController stand_type = TextEditingController();
  TextEditingController stand_serial_number = TextEditingController();

  // TextEditingController stand_quantity = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoad = true;
  bool editprod = true;
  @override
  Widget build(BuildContext context) {
    // isLoad != false
    //     ? {
    //         if (editprod)
    //           {
    //             fullNameController.text = widget.FullName,
    //             phoneController.text = widget.PhoneNum,
    //             Dob.text = widget.DateOfbirth,
    //             descriptionController.text = widget.Descrition,
    //             AddressController.text = widget.Address,
    //             widget.Work.forEach((element) {
    //               selectedPassion.add(element);
    //             }),
    //             editprod = false,
    //             isLoad = false,
    //           }
    //       }
    //     : {};

    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Get.back();
              // _key.currentState!.openDrawer();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lease Form',
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
          // width: double.infinity,
          // height: double.infinity,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/slicing/Untitled-46.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: DisAllowIndicatorWidget(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: res_width * 0.85,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "REDELIVERY ACCEPTANCE CERTIFICATE",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: res_height * 0.01,
                                  ),
                                  Wrap(
                                    spacing: 5,
                                    runSpacing: 10,
                                    alignment: WrapAlignment.start,
                                    children: [
                                      Text(
                                        """NATIONAL AERO STANDS, LLC (“NAS”) hereby acknowledges, pursuant to the Engine Stand Agreement, by and between NAS and """,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      blank(
                                          widt: 50,
                                          kontroller: customer_detail),
                                      Text(
                                        "(“CUSTOMER”), dated as of",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        width: 85,
                                        child: TextFormField(
                                          controller: redelivery_dates,
                                          readOnly: true,
                                          onSaved: (newValue) =>
                                              redelivery_dates.text,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            isCollapsed: true,
                                            // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                            constraints: BoxConstraints(
                                                maxWidth: 120, minWidth: 10),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                                    context:
                                                        context, //context of current state
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(
                                                        2000), //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101));

                                            if (pickedDate != null) {
                                              // print("date"+
                                              //     pickedDate.toString()); //pickedDate output format => 2021-03-10 00:00:00.000
                                              String formattedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                              // print("final date" + formattedDate);
                                              setState(() {
                                                redelivery_dates.text =
                                                    formattedDate; //set output date to TextField value.
                                              });
                                              // print("delivery_date.text" + delivery_date.text);
                                              //formatted date output using intl package =>  2021-03-16
                                            } else {
                                              print("Date is not selected");
                                            }
                                          },
                                        ),
                                      ),
                                      // blank(
                                      //   widt: 50,

                                      //   //kontroller: stand_color
                                      // ),
                                      Text(
                                        ", 2023 (as amended, supplemented or otherwise modified from time to time, the “Agreement”), that on this",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      TextFormField(
                                        controller: redelivery_days,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Required';
                                          }
                                          return null;
                                        },
                                        maxLength: 2,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          isCollapsed: true,
                                          // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                          constraints: BoxConstraints(
                                              maxWidth: 60, minWidth: 10),
                                          border: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          disabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "day of",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      // blank(
                                      //   widt: 50,

                                      //    kontroller: stand_serial_number
                                      // ),
                                      Container(
                                        width: 85,
                                        child: TextFormField(
                                          controller: receiving_date,
                                          readOnly: true,
                                          onSaved: (newValue) =>
                                              receiving_date.text,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            isCollapsed: true,
                                            // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                            constraints: BoxConstraints(
                                                maxWidth: 120, minWidth: 10),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                                    context:
                                                        context, //context of current state
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(
                                                        2000), //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101));

                                            if (pickedDate != null) {
                                              // print("date"+
                                              //     pickedDate.toString()); //pickedDate output format => 2021-03-10 00:00:00.000
                                              String formattedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                              // print("final date" + formattedDate);
                                              setState(() {
                                                receiving_date.text =
                                                    formattedDate; //set output date to TextField value.
                                              });
                                              // print("delivery_date.text" + delivery_date.text);
                                              //formatted date output using intl package =>  2021-03-16
                                            } else {
                                              print("Date is not selected");
                                            }
                                          },
                                        ),
                                      ),
                                      // Text(
                                      //   "20",
                                      //   style: TextStyle(
                                      //       fontSize: 13,
                                      //       fontWeight: FontWeight.w500),
                                      // ),
                                      // TextFormField(
                                      //   controller: redelivery_days,
                                      //   validator: (value) {
                                      //     if (value == null || value.isEmpty) {
                                      //       return 'Required';
                                      //     }
                                      //     return null;
                                      //   },
                                      //   maxLength: 2,
                                      //   keyboardType: TextInputType.number,
                                      //   inputFormatters: <TextInputFormatter>[
                                      //     FilteringTextInputFormatter.digitsOnly
                                      //   ],
                                      //   decoration: InputDecoration(
                                      //     isCollapsed: true,
                                      //     // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                      //     constraints: BoxConstraints(
                                      //         maxWidth: 50, minWidth: 10),
                                      //     border: UnderlineInputBorder(
                                      //       borderSide:
                                      //           BorderSide(color: Colors.grey),
                                      //     ),
                                      //     enabledBorder: UnderlineInputBorder(
                                      //       borderSide:
                                      //           BorderSide(color: Colors.grey),
                                      //     ),
                                      //     focusedBorder: UnderlineInputBorder(
                                      //       borderSide:
                                      //           BorderSide(color: Colors.grey),
                                      //     ),
                                      //     disabledBorder: UnderlineInputBorder(
                                      //       borderSide:
                                      //           BorderSide(color: Colors.grey),
                                      //     ),
                                      //   ),
                                      // ),
                                      Text(
                                        "it has received from CUSTOMER possession of the following Engine Stand.  Capitalized terms used but not defined herein shall have the meanings given such terms in the Agreement.",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "1. Description of Engine Stand:",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "Manufacturer:",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      blank(
                                          widt: 50,
                                          kontroller: stand_manufacturer),
                                      Row(
                                        children: [
                                          Text(
                                            "Engine Stand Color: ",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          blank(
                                              widt: 50,
                                              kontroller: stand_color),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Type: ",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          blank(
                                              widt: 50, kontroller: stand_type),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Serial No: ",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          blank(
                                              widt: 50, kontroller: stand_type),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Quantity: ",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          blank(
                                              widt: 50,
                                              kontroller: stand_manufacturer),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "2. Redelivery Acceptance",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                      spacing: 5,
                                      runSpacing: 10,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        Text(
                                          "The Engine Stand is hereby accepted by NAS at ",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        blank(
                                            widt: 50,
                                            kontroller: accepting_location),
                                        Text(
                                          'for redelivery under the Agreement in accordance with the provisions of the Agreement, subject to [the correction by CUSTOMER (or procurement by CUSTOMER at CUSTOMER’s cost) within',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        blank(
                                          widt: 50,
                                          //kontroller: stand_manufacturer
                                        ),
                                        Text(
                                            'days following the date hereof of the discrepancies specified in Attachment 1 hereto][ or subject to the payment of US\$'),
                                        blank(
                                            widt: 50,
                                            kontroller: shipping_cost),
                                        Text(
                                            'by CUSTOMER to NAS with respect to the discrepancies specified in Attachment 1 hereto].'),
                                        Text('3. Termination of the Agreement'),
                                        Text(
                                            'The Agreement is hereby terminated with respect to the Engine Stand without prejudice to CUSTOMER’s continuing obligations and NAS’s continuing rights under the Agreement.'),
                                        Text('4. Governing Law'),
                                        Text(
                                            'THIS REDELIVERY ACCEPTANCE CERTIFICATE SHALL IN ALL RESPECTS BE GOVERNED BY, AND CONSTRUED IN ACCORDANCE WITH, THE LAWS OF THE STATE OF TEXAS'),
                                        Text(
                                            'IN WITNESS WHEREOF, NAS has caused its duly authorized representative to execute this Redelivery Acceptance Certificate as of the day and year first above written.'),
                                      ]),
                                  SizedBox(
                                    height: res_height * 0.01,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text('NATIONAL AERO STANDS, LLC'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text('By: '),
                                          blank(
                                            widt: 163,
                                            //kontroller: stand_manufacturer
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text('Name: '),
                                          blank(
                                            widt: 140,
                                            //kontroller: stand_manufacturer
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text('Title: '),
                                          blank(
                                            widt: 152,
                                            //kontroller: stand_manufacturer
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: res_height * 0.01,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.01,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              print("registered_agent.text" +
                                  registered_agent.text);
                              print("signature_1.text" + signature_1.text);
                              print("signature_2.text" + signature_2.text);
                              global_registered_agent = registered_agent.text;
                              global_signature_1 = signature_1.text;
                              global_signature_2 = signature_2.text;
                              var sendData = {
                                'day': global_day,
                                'month': global_month,
                                'customer_name': global_customer_name,
                                'customer_location': global_customer_location,
                                'stand_manufacturer': global_stand_manufacturer,
                                'stand_color': global_stand_color,
                                'stand_type': global_stand_type,
                                'stand_serial_number':
                                    global_stand_serial_number,
                                'stand_quantity': global_stand_quantity,
                                'delivery_location': global_delivery_location,
                                'delivery_date': global_delivery_date,
                                'daily_rent': global_daily_rent,
                                'replacement_value': global_replacement_value,
                                'security_deposit': global_security_deposit,
                                'guarantor': global_guarantor,
                                'registered_agent': registered_agent.text,
                                'signature_1': signature_1.text,
                                'signature_2': signature_2.text,
                                'tax_file': placeOrderData_tax_file,
                                'quote_id': placeOrderData_quote_id,
                                'fileType': placeOrderData_fileType,
                                'customer_detail': customer_detail.text,
                                'redelivery_dates': redelivery_dates.text,
                                'redelivery_days': redelivery_days.text,
                                'receiving_date': receiving_date.text,
                                'accepting_location': accepting_location.text,
                                'shipping_cost': shipping_cost.text,
                              };
                              var res_data = await ApiService()
                                  .placeOrder(context, sendData);

                              print(
                                  "Lease Form RESPONSE" + res_data.toString());
                              if (res_data['status'] == true) {
                                Get.to(PaymentScreen());
                              } else {
                                Get.snackbar(
                                  'Error',
                                  "Invalid Email Address",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.white,
                                );
                              }

                              // Get.to(PaymentScreen());
                            }

                            // if (formKey.currentState!.validate()) {
                            //   global_day = day.text;
                            //   global_month = month.text;
                            //   global_customer_name = customer_name.text;
                            //   global_customer_location = customer_location.text;
                            //   global_stand_manufacturer = stand_manufacturer.text;
                            //   global_stand_color = stand_color.text;
                            //   global_stand_type = stand_type.text;
                            //   global_stand_serial_number = stand_serial_number.text;
                            //   global_stand_quantity = stand_quantity.text;
                            //   global_delivery_location = delivery_location.text;
                            //   global_delivery_date = delivery_date.text;
                            //   global_daily_rent = daily_rent.text;
                            //   global_replacement_value = replacement_value.text;

                            //   Get.to(lease_form2());
                            // }
                          },
                          child: Container(
                            width: res_width * 0.85,
                            decoration: BoxDecoration(
                                color: Color(0xff85714e),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Center(
                                child: Text(
                                  'Continue',
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
                          height: res_height * 0.01,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class blank extends StatelessWidget {
  TextEditingController? kontroller;
  double? widt;
  blank({
    this.widt,
    this.kontroller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: kontroller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required';
        }
        return null;
      },
      decoration: InputDecoration(
        isCollapsed: true,
        // contentPadding: EdgeInsets.symmetric(vertical: 0),
        constraints: BoxConstraints(maxWidth: widt!, minWidth: 10),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
