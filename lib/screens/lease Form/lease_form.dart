import 'package:StandsAero/helper/global.dart';
import 'package:StandsAero/screens/lease%20Form/lease_form2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class lease_Form extends StatefulWidget {
  final placeOrderData;
  const lease_Form(this.placeOrderData, {Key? key}) : super(key: key);

  @override
  State<lease_Form> createState() => _lease_FormState();
}

class _lease_FormState extends State<lease_Form> {
  @override
  void initState() {
    // stand_manufacturer.text = global_stand_manufacturer;
    // stand_color.text = global_stand_color;
    // stand_type.text = global_stand_type;
    // stand_quantity.text = global_stand_quantity;
    // stand_serial_number.text = global_stand_serial_number;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController day = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController customer_name = TextEditingController();
  TextEditingController customer_location = TextEditingController();
  TextEditingController stand_manufacturer = TextEditingController();
  TextEditingController stand_color = TextEditingController();
  TextEditingController stand_type = TextEditingController();
  TextEditingController stand_serial_number = TextEditingController();
  TextEditingController stand_quantity = TextEditingController();
  TextEditingController delivery_location = TextEditingController();
  TextEditingController delivery_date = TextEditingController();
  TextEditingController daily_rent = TextEditingController();
  TextEditingController replacement_value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(widget.placeOrderData.toString());
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
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/slicing/Untitled-46.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                              "Engine Stand Agreement",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
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
                                  "This Engine Stand Agreement (the \"Agreement\") is entered this",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                // SizedBox(width: 5),
                                TextFormField(
                                  controller: day,
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextFormField(
                                  controller: month,
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
                                  """2022 by and between (i) National Aero Stands, LLC, a Texas limited liability company, having its principal place of business at 500 W. 5th Street, Suite 1010, Austin, TX 78701(\"NAS\"), and (ii)""",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                blank(widt: 60, kontroller: customer_name),
                                Text(
                                  "having its principal place of business at",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                blank(
                                  widt: 30,
                                  kontroller: customer_location,
                                ),
                                Text(
                                  """("CUSTOMER"). """,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: res_height * 0.01,
                            ),
                            Text(
                              "Witnesseth",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
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
                                  """For sufficient consideration the receipt of which is hereby mutually acknowledged, NAS, as owner, hereby agrees to lease one (1) bootstrap capable engine transportation stand (including accompanying hardware) (herein the foregoing collectively referred to as the "Engine Stand"), as more particularly described below, to CUSTOMER and CUSTOMER agrees to lease the Engine Stand from NAS in accordance with the following basic terms and conditions set forth herein:\n\n 1. Description of Engine Stand: Manufacturer:""",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                blank(widt: 50, kontroller: stand_manufacturer),
                                Text(
                                  "Engine Stand Color:",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                blank(widt: 50, kontroller: stand_color),
                                Text(
                                  "Type:",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                blank(widt: 50, kontroller: stand_type),
                                Text(
                                  "Serial No.",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                blank(
                                    widt: 50, kontroller: stand_serial_number),
                                Text(
                                  "Quantity:",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextFormField(
                                  controller: stand_quantity,
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
                                        maxWidth: 50, minWidth: 10),
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
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Wrap(
                              spacing: 5,
                              runSpacing: 10,
                              alignment: WrapAlignment.start,
                              children: [
                                Text(
                                  "Delivery: The Engine Stand will be delivered to CUSTOMER ExWorks (Incoterms 2010 Edition) NAS's facility, located in",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                blank(widt: 50, kontroller: delivery_location),
                                Text(
                                  """("Delivery Location") by NAS's tender of the Engine Stand to CUSTOMER's common carrier for shipment outside the State of Florida on (the "Delivery Date")""",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextFormField(
                                  controller: delivery_date,
                                  readOnly: true,
                                  onSaved: (newValue) => delivery_date.text,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                    constraints: BoxConstraints(
                                        maxWidth: 120, minWidth: 10),
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
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
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
                                        delivery_date.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                      // print("delivery_date.text" + delivery_date.text);
                                      //formatted date output using intl package =>  2021-03-16
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Wrap(
                              spacing: 5,
                              runSpacing: 10,
                              alignment: WrapAlignment.start,
                              children: [
                                Text(
                                  "Agreement Term: This Agreement shall commence on the Delivery Date and shall continue until the date that the Engine Stand has been returned to NAS in accordance with the provisions of Section 14 below (the \"Agreement Term\")",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "\n\n4:Daily Rent: Daily Rent will be charged as follows:",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextFormField(
                                  controller: daily_rent,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  maxLength: 7,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                    constraints: BoxConstraints(
                                        maxWidth: 80, minWidth: 10),
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
                                  "U.S. Dollars (US.00) per Day of the Agreement Term, payable in advance for the first thirty (30) days of the Agreement Term and payable in advance of every Agreement Month thereafter. Agreement Month is defined as thirty (30) consecutive days, commencing on the Delivery date and recurring every thirty (30) days there- after. In all events, CUSTOMER will be charged and CUSTOMER shall pay Daily Rent until the Engine Stand is Redelivered to the redelivery Location in the Redelivery Condition in accordance with Section 14 below. \n\n5. Interest on Past Due Payments: Any payment due hereunder not made within five (5) days after the due date shall accrue interest at the rate of ten percent 10% per annum. \n\n6. Total Loss: It is hereby agreed that if the Engine Stand is lost, destroyed or damaged beyond economic repair, CUSTOMER shall forthwith pay NAS the Agreed Value, in addition to the unpaid Daily Rent, for the Engine Stand. Such payment shall be without setoff for rent or other money paid by CUSTOMER. The Agreed Value for the replacement of the Engine Stand is USS",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextFormField(
                                  controller: replacement_value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  maxLength: 7,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                    constraints: BoxConstraints(
                                        maxWidth: 50, minWidth: 10),
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
                              ],
                            ),
                            Text(
                              """ U.S. Dollars (USSI100.000.00). \n\n7. Risk of Loss: Risk of Loss of the Engine Stand passes from NAS to CUSTOMER on the Deliver Date and shall remain with CUSTOMER until the Engine Stand is redelivered in accordance with the provisions of Section 14 below. """,
                              style: TextStyle(fontSize: 12),
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
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        global_day = day.text;
                        global_month = month.text;
                        global_customer_name = customer_name.text;
                        global_customer_location = customer_location.text;
                        global_stand_manufacturer = stand_manufacturer.text;
                        global_stand_color = stand_color.text;
                        global_stand_type = stand_type.text;
                        global_stand_serial_number = stand_serial_number.text;
                        global_stand_quantity = stand_quantity.text;
                        global_delivery_location = delivery_location.text;
                        global_delivery_date = delivery_date.text;
                        global_daily_rent = daily_rent.text;
                        global_replacement_value = replacement_value.text;

                        Get.to(lease_form2());
                      }
                    },
                    child: Container(
                      width: res_width * 0.85,
                      decoration: BoxDecoration(
                          color: Color(0xff85714e),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
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
          return 'Please enter All fields';
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

class txtfield_ extends StatelessWidget {
  var width;

  txtfield_({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 14,
        child: TextField(
          style: TextStyle(
            fontSize: 12,
          ),
        ));
  }
}

class lease_form_text extends StatelessWidget {
  var text;

  lease_form_text({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: res_width * 0.925,
          child: Card(
            // margin: EdgeInsets.fromLTRB(18.0, 4.0, 18.0, 18.0),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "$text",
                style: TextStyle(fontSize: 16),
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
