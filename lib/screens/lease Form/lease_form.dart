import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/lease%20Form/lease_form2.dart';

class lease_Form extends StatelessWidget {
  const lease_Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      extendBodyBehindAppBar: true,
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
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: res_width * 0.925,
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
                          Text(
                            """This Engine Stand Agreement (the "Agreement") is entered this_____ day of______ 2022 by and between (i) National Aero Stands, LLC, a Texas limited liability company, having its principal place of business at 500 W. 5th Street, Suite 1010, Austin, TX 78701("NAS"), and (ii)_________having its principal place of business at___________.("CUSTOMER"). """,
                            style: TextStyle(fontSize: 12),
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
                          Text(
                            """For sufficient consideration the receipt of which is hereby mutually acknowledged, NAS, as owner, hereby agrees to lease one (1) bootstrap capable engine transportation stand (including accompanying hardware) (herein the foregoing collectively referred to as the "Engine Stand"), as more particularly described below, to CUSTOMER and CUSTOMER agrees to lease the Engine Stand from NAS in accordance with the following basic terms and conditions set forth herein:\n\n 1. Description of Engine Stand: Manufacturer:_________ Engine Stand Color:________ Type:________ Serial No.________ Quantity:___ \n\n2. Delivery: The Engine Stand will be delivered to CUSTOMER ExWorks (Incoterms 2010 Edition) NAS's facility, located in_________ ("Delivery Location") by NAS's tender of the Engine Stand to CUSTOMER's common carrier for shipment outside the State of Florida on (the "Delivery Date")___________. -2022 \n\n3. Agreement Term: This Agreement shall commence on the Delivery Date and shall continue until the date that the Engine Stand has been returned to NAS in accordance with the provisions of Section 14 below (the "Agreement Term") \n\n4. Daily Rent: Daily Rent will be charged as follows:___________ U.S. Dollars (US.00) per Day of the Agreement Term, payable in advance for the first thirty (30) days of the Agreement Term and payable in advance of every Agreement Month thereafter. Agreement Month is defined as thirty (30) consecutive days, commencing on the Delivery date and recurring every thirty (30) days there- after. In all events, CUSTOMER will be charged and CUSTOMER shall pay Daily Rent until the Engine Stand is Redelivered to the redelivery Location in the Redelivery Condition in accordance with Section 14 below. \n\n5. Interest on Past Due Payments: Any payment due hereunder not made within five (5) days after the due date shall accrue interest at the rate of ten percent 10% per annum. \n\n6. Total Loss: It is hereby agreed that if the Engine Stand is lost, destroyed or damaged beyond economic repair, CUSTOMER shall forthwith pay NAS the Agreed Value, in addition to the unpaid Daily Rent, for the Engine Stand. Such payment shall be without setoff for rent or other money paid by CUSTOMER. The Agreed Value for the replacement of the Engine Stand is USS_________ U.S. Dollars (USSI100.000.00). \n\n7. Risk of Loss: Risk of Loss of the Engine Stand passes from NAS to CUSTOMER on the Deliver Date and shall remain with CUSTOMER until the Engine Stand is redelivered in accordance with the provisions of Section 14 below. """,
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
                    Get.to(lease_form2());
                  },
                  child: Container(
                    width: res_width * 0.9,
                    decoration: BoxDecoration(
                        color: Color(0xffaf8a39),
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
