import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/helper/global.dart';
import 'package:stande_aero/screens/Profile/profile.dart';
import 'package:stande_aero/screens/credit_Form/credit_form.dart';
import 'package:stande_aero/screens/mainhome.dart';

class kyc_form extends StatefulWidget {
  const kyc_form({Key? key}) : super(key: key);

  @override
  State<kyc_form> createState() => _kyc_formState();
}

class _kyc_formState extends State<kyc_form> {
  TextEditingController client_id = TextEditingController();
  TextEditingController company_name = TextEditingController();
  TextEditingController company_type = TextEditingController();
  TextEditingController company_state_country = TextEditingController();
  TextEditingController company_address = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController fax = TextEditingController();
  TextEditingController contact_person = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController company_website = TextEditingController();
  TextEditingController company_additional_members = TextEditingController();
  TextEditingController company_prmy_bsns = TextEditingController();
  TextEditingController fund_src = TextEditingController();
  TextEditingController company_countrylist = TextEditingController();

  String apiGlobal = "https://qtdev.the4loop.com/";
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
        // leading: GestureDetector(
        //   behavior: HitTestBehavior.translucent,
        //   onTap: () {
        //     Navigator.pop(context);
        //     // _key.currentState!.openDrawer();
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.all(15),
        //     child: Container(
        //         width: 25,
        //         child: Image.asset(
        //           'assets/slicing/Untitled-3.png',
        //         )),
        //   ),
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'KYC Form',
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-62.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: res_width * 0.04),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kyc_main_text(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                  kyc_main_text(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                  SizedBox(
                    height: res_height * 0.01,
                  ),
                  Text(
                    'Company information',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.01,
                  ),
                  Text(
                    'Required name of company(the "company")',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: company_name, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Type of company (i.e corporation, partnership, LLC,etc )',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: company_type, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'State of Company Formation. Country of company Formation (if other U.S.)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                      controller: company_state_country, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Company Address:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                    controller: company_address,
                    res_width: res_width,
                    maxLines: 4,
                  ),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Phone Number:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: number, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Fax Number:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: fax, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Contact Person:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                      controller: contact_person, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Email:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: email, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Company Website:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                      controller: company_website, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'List Of Officer, Direction And/or Principles Of The Company',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: res_width * 0.925 / 2.1,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: company_additional_members,
                            decoration: InputDecoration(hintText: "Name"),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: res_width * 0.925 / 2.1,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: company_additional_members,
                            decoration: InputDecoration(hintText: "Title"),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: res_width * 0.925 / 2.1,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: company_additional_members,
                            decoration: InputDecoration(hintText: "Name"),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: res_width * 0.925 / 2.1,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: company_additional_members,
                            decoration: InputDecoration(hintText: "Title"),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Container(
                    width: res_width * 0.925,
                    decoration: BoxDecoration(
                        color: Color(0xffaf8a39),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Center(
                        child: Text(
                          'Add More',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    "Busniess Activity And source of Funds",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    "Primary busnies and type of activity engaged in by Company",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  textfiel_kyc(
                      controller: company_prmy_bsns, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    "Service Fund To Be Paid",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Approximate Lease Lenth (The minimum lease requirement is 1 day, we invoice in 30 day increaments but only charge for the actual days the stand is out on lease. The lease begins the day the stand leaves our facilty and ends the day it is returned to our facility complete, in the same condition that it left).',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                  textfiel_kyc(controller: fund_src, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'If Your busnies is international, list of countries in which you do busniess and the address in each country',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                      controller: company_countrylist, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      KYC();
                    },
                    child: Container(
                      width: res_width * 0.925,
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
                    height: res_height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  KYC() async {
    final uri = Uri.parse('https://qtdev.the4loop.com/api/user/kyc-submit');

    print(uri);

    var sendData = {
      'client_id': client_id.text,
      'company_name': company_name.text,
      'company_type': company_type.text,
      'company_state_country': company_state_country.text,
      'company_address': company_address.text,
      'number': number.text,
      'fax': fax.text,
      'contact_person': contact_person.text,
      'email': email.text,
      'company_website': company_website.text,
      'company_additional_members': company_additional_members.text,
      'company_prmy_bsns': company_prmy_bsns.text,
      'fund_src': fund_src.text,
      'company_countrylist': company_countrylist.text,
    };
      print(sendData);
    var jsonBody = json.encode(sendData);

    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${globaltoken}',
    };

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    print(response.statusCode);

    print(response.body);
    // try {
    //   var res_data = json.decode(response.body);
    // } catch (e) {
    //   log('$e');
    // }
    var res_data = json.decode(response.body);

    print(res_data);
    if (res_data["status"] == true) {
      Get.to(() => credit_form());
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }
}

class textfiel_kyc extends StatelessWidget {
  var maxLines;
  TextEditingController? controller;
  textfiel_kyc({
    this.controller,
    Key? key,
    this.maxLines,
    required this.res_width,
  }) : super(key: key);

  final double res_width;

  @override
  Widget build(BuildContext context) {
    // var controller;
    return Container(
      width: res_width * 0.925,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class kyc_main_text extends StatelessWidget {
  var text;

  kyc_main_text({Key? key, this.text}) : super(key: key);

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
              padding: EdgeInsets.all(12.0),
              child: Text(
                "$text",
                style: TextStyle(fontSize: 13),
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
