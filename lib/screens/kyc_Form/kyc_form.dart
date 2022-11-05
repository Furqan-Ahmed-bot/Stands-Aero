import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/helper/global.dart';
import 'package:stande_aero/screens/Profile/profile.dart';
import 'package:stande_aero/screens/credit_Form/credit_form.dart';
import 'package:stande_aero/screens/mainhome.dart';
import 'package:stande_aero/services/remote_services.dart';
import 'package:email_validator/email_validator.dart';

class kyc_form extends StatefulWidget {
  const kyc_form({Key? key}) : super(key: key);

  @override
  State<kyc_form> createState() => _kyc_formState();
}

class _kyc_formState extends State<kyc_form> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
  TextEditingController company_additional_member_name1 =
      TextEditingController();
  TextEditingController company_additional_member_title1 =
      TextEditingController();
  TextEditingController company_additional_member_name2 =
      TextEditingController();
  TextEditingController company_additional_member_title2 =
      TextEditingController();
  TextEditingController company_prmy_bsns = TextEditingController();
  TextEditingController fund_src = TextEditingController();
  TextEditingController company_countrylist = TextEditingController();
  List<Widget> list = [];
  int fieldCount = 0;

  // String apiGlobal = "https://standsaero.jumppace.com/api/";
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    log("requestFormdatafromQuote form Data" +
        requestFormdatafromQuote.toString());

    FocusNode myFocusNode = new FocusNode();
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
              child: Form(
                key: formKey,
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
                    // Text(
                    //   'Required name of company(the "company")',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: company_name,
                    //     hed: 'Required name of company(the "company")',
                    //     res_width: res_width),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: company_name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name of company';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText:
                                  'Required name of company(the "company")',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: res_height * 0.02,
                    ),
                    // Text(
                    //   'Type of company (i.e corporation, partnership, LLC,etc )',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),

                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: company_type,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Type of company ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText:
                                  'Type of company (i.e corporation, partnership, LLC,etc )',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
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

                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: company_state_country,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter state of company formation';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: res_height * 0.02,
                    ),
                    // Text(
                    //   'Company Address:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //   controller: company_address,
                    //   hed: 'Company Address:',
                    //   res_width: res_width,
                    //   maxLines: 4,

                    // ),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: company_address,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter company address';
                            }
                            return null;
                          },
                          maxLines: 4,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: 'Company Address',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: res_height * 0.02,
                    ),
                    // Text(
                    //   'Phone Number:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: res_height * 0.02,
                    ),
                    // Text(
                    //   'Fax Number:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: fax,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter fax number';
                            }
                            return null;
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: 'Fax Number',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: res_height * 0.02,
                    ),
                    // Text(
                    //   'Contact Person:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),

                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: contact_person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter contact person';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: 'Contact Person:',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: res_height * 0.02,
                    ),
                    // Text(
                    //   'Email:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: email,
                          validator: (text) =>
                              EmailValidator.validate(text.toString())
                                  ? null
                                  : "Please enter a valid email",
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: 'Email:',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: res_height * 0.02,
                    ),
                    // Text(
                    //   'Company Website:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: company_website,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter company website';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: 'Company Website:',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
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
                          height: 50,
                          width: res_width * 0.925 / 2.1,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: company_additional_member_name1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: res_width * 0.925 / 2.1,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: company_additional_member_title1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter title';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Title",
                                  labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.white
                                          : Colors.black)),
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
                          height: 50,
                          width: res_width * 0.925 / 2.1,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: company_additional_member_name2,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.white
                                          : Colors.black)),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: res_width * 0.925 / 2.1,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: company_additional_member_title2,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter title';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Title",
                                  labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.white
                                          : Colors.black)),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: res_height * 0.02,
                    // ),
                    // GestureDetector(
                    //   child: Container(
                    //     width: res_width * 0.925,
                    //     decoration: BoxDecoration(
                    //         color: Color(0xffaf8a39),
                    //         borderRadius: BorderRadius.all(Radius.circular(7))),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(13.0),
                    //       child: Center(
                    //         child: Text(
                    //           'Add More',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 17),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     setState(() {
                    //       fieldCount++;
                    //       list.add(buildField(fieldCount));
                    //     });
                    //   },
                    // ),
                    SizedBox(
                      height: res_height * 0.02,
                    ),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,   
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: company_prmy_bsns,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter busniess activity ';
                            }
                            return null;
                          },
                          focusNode: myFocusNode,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText:
                                  "Busniess Activity And source of Funds",
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    ),
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
                    Container(
                        width: res_width * 0.925,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 0, right: 8, left: 8),
                          child: TextFormField(
                            controller: fund_src,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter service fund to be paid';
                              }
                              return null;
                            },
                            focusNode: myFocusNode,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        )),
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

                    Container(
                        width: res_width * 0.925,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 0, right: 8, left: 8),
                          child: TextFormField(
                            controller: company_countrylist,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter list of countries';
                              }
                              return null;
                            },
                            focusNode: myFocusNode,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: res_height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          KYC();
                        }
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
      ),
    );
  }

  KYC() async {
    final uri = Uri.parse('${apiGlobal}user/kyc-submit');

    print(uri);
    if (client_id.text == "") {}

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
      'company_additional_members': company_additional_member_name1.text +
          "," +
          company_additional_member_title1.text +
          "," +
          company_additional_member_name2.text +
          "," +
          company_additional_member_title2.text,
      'company_prmy_bsns': company_prmy_bsns.text,
      'fund_src': fund_src.text,
      'company_countrylist': company_countrylist.text,
    };

    log("sendData" + sendData.toString());
    kycrequestFormdatafromQuote = sendData;
    Get.to(credit_form(kycformData: kycrequestFormdatafromQuote));

    //   print(sendData);
    //   var jsonBody = json.encode(sendData);

    //   final headers = {
    //     'Content-Type': 'application/x-www-form-urlencoded',
    //     'Authorization': 'Bearer ${globaltoken}',
    //   };

    //   http.Response response = await http.post(
    //     uri,
    //     headers: headers,
    //     body: jsonBody,
    //   );

    //   print(response.statusCode);

    //   print(response.body);
    //   // try {
    //   //   var res_data = json.decode(response.body);
    //   // } catch (e) {
    //   //   log('$e');
    //   // }
    //   var res_data = json.decode(response.body);

    //   print(res_data);
    //   if (res_data["status"] == true) {
    //     Get.to(() => credit_form());
    //   } else
    //     Get.snackbar(
    //       'Error',
    //       'Wrong Credentials',
    //       animationDuration: Duration(seconds: 2),
    //       snackPosition: SnackPosition.BOTTOM,
    //     );

    //   return res_data;
  }
}

class textfiel_kyc extends StatelessWidget {
  var maxLines, hed;
  TextEditingController? controller;
  textfiel_kyc({
    this.controller,
    Key? key,
    this.hed,
    this.maxLines,
    required this.res_width,
  }) : super(key: key);

  final double res_width;
  final formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // var controller;
    return Form(
      key: formKey,
      child: Container(
        width: res_width * 0.925,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(7))),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 0, right: 8, left: 8),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            maxLines: maxLines,
            focusNode: myFocusNode,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: hed,
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus ? Colors.white : Colors.black)),
          ),
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

Widget buildField(int i) {
  return ListTile(
    leading: CircleAvatar(
      child: Text((i + 1).toString()),
    ),
    title: TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        labelText: "Itinerary ${i + 1}",
      ),
    ),
    trailing: const Icon(Icons.delete_outlined, color: Colors.red),
  );
}
