import 'dart:developer';

import 'package:StandsAero/bottomcontroller.dart';
import 'package:StandsAero/controller/usercontroller.dart';
import 'package:StandsAero/helper/global.dart';
import 'package:StandsAero/screens/kyc_Form/kyc_form.dart';
import 'package:StandsAero/services/remote_services.dart';
import 'package:StandsAero/widgets/disallow_indicator_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class credit_from2 extends StatefulWidget {
  final int clientId;
  const credit_from2({Key? key, required this.clientId}) : super(key: key);

  @override
  State<credit_from2> createState() => _credit_from2State();
}

class _credit_from2State extends State<credit_from2> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController bank_name = TextEditingController();
  TextEditingController bank_address = TextEditingController();
  TextEditingController bank_city = TextEditingController();
  TextEditingController bank_contact_name = TextEditingController();
  TextEditingController bank_state = TextEditingController();
  TextEditingController bank_zip = TextEditingController();
  TextEditingController bank_phone = TextEditingController();
  TextEditingController bsns_trde_company_name = TextEditingController();
  TextEditingController bsns_trde_company_address = TextEditingController();
  TextEditingController bsns_trde_city = TextEditingController();
  TextEditingController bsns_trde_state = TextEditingController();
  TextEditingController bsns_trde_zip = TextEditingController();
  TextEditingController bsns_trde_phone = TextEditingController();
  TextEditingController bsns_trde_fax = TextEditingController();
  TextEditingController bsns_trde_email = TextEditingController();
  TextEditingController sig_name_title = TextEditingController();
  TextEditingController sig_date = TextEditingController();

  final usercontroller = Get.put(UserController());

  final bottomctrl = Get.put(BottomController());
  //

  // var requestDataofQuote;

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero, () {
  //     setState(() {

  //     requestDataofQuote = jsonEncode(widget.requestFormdata);
  //     productId.text = requestDataofQuote['product_id'];
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    // log("requestFormdatafromQuote Osama" + requestFormdatafromQuote.toString());
    // var requestforvalue = widget.requestFormdata.s
    log("kycformData " + kycrequestFormdatafromQuote.toString());
    log("creditfirstFormData " + creditfirstFormData.toString());
    // requestDataofQuote = jsonEncode(widget.requestFormdata);
    // productId.text = requestFormdatafromQuote['product_id'];
    FocusNode myFocusNode = new FocusNode();

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
                'Credit Application Form',
                style: TextStyle(color: Colors.black, fontSize: 15),
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
              child: DisAllowIndicatorWidget(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // kyc_main_text(
                        //     text:
                        //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                        // kyc_main_text(
                        //     text:
                        //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                        SizedBox(
                          height: res_height * 0.01,
                        ),
                        Text(
                          'Bank information',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.01,
                        ),
                        // Text(
                        //   'Bank Name: ',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        textfiel_kyc(
                            controller: bank_name,
                            head: 'Bank Name: ',
                            res_width: res_width),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'Bank Address: ',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        textfiel_kyc(
                            controller: bank_address,
                            head: 'Bank Address: ',
                            res_width: res_width),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'City:',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        textfiel_kyc(
                            controller: bank_city,
                            head: 'City:',
                            res_width: res_width),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'Contact Name:',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        textfiel_kyc(
                            controller: bank_contact_name,
                            res_width: res_width,
                            head: 'Contact Name:'
                            // maxLines: 4,
                            ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'State:',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        textfiel_kyc(
                            controller: bank_state,
                            head: 'State:',
                            res_width: res_width),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'Zip:',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        // textfiel_kyc(
                        //     controller: bank_zip,
                        //     head: 'Zip:',
                        //     res_width: res_width
                        //     ),
                        Container(
                          width: res_width * 0.925,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 0, right: 8, left: 8),
                            child: TextFormField(
                              controller: bank_zip,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter bank zip code';
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
                                  labelText: 'Zip',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'Phone:',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        // textfiel_kyc(
                        //     controller: bank_phone,
                        //     head: 'Phone:',
                        //     res_width: res_width),
                        Container(
                          width: res_width * 0.925,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 0, right: 8, left: 8),
                            child: TextFormField(
                              controller: bank_phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter bank phone';
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
                                  labelText: 'Phone',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),

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
                        //           'Add Another',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 17),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: res_height * 0.01,
                        // ),
                        Text(
                          'Business/Trade reference',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'Company Name:',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        textfiel_kyc(
                            controller: bsns_trde_company_name,
                            head: 'Company Name:',
                            res_width: res_width),
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
                        textfiel_kyc(
                            controller: bsns_trde_company_address,
                            head: 'Company Address:',
                            res_width: res_width),
                        SizedBox(
                          height: res_height * 0.02,
                        ),

                        textfiel_kyc(
                            controller: bsns_trde_city,
                            head: 'City:',
                            res_width: res_width),
                        SizedBox(
                          height: res_height * 0.02,
                        ),

                        textfiel_kyc(
                            controller: bsns_trde_state,
                            head: 'State:',
                            res_width: res_width),

                        SizedBox(
                          height: res_height * 0.02,
                        ),

                        Container(
                          width: res_width * 0.925,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 0, right: 8, left: 8),
                            child: TextFormField(
                              controller: bsns_trde_zip,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter zip code';
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
                                  labelText: 'Zip',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'Phone:',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),

                        Container(
                          width: res_width * 0.925,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 0, right: 8, left: 8),
                            child: TextFormField(
                              controller: bsns_trde_phone,
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
                                  labelText: 'Phone',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'Fax:',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        // textfiel_kyc(
                        //     controller: bsns_trde_fax,
                        //     head: 'Fax:',
                        //     res_width: res_width),
                        Container(
                          width: res_width * 0.925,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 0, right: 8, left: 8),
                            child: TextFormField(
                              controller: bsns_trde_fax,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter fax';
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
                                  labelText: 'Fax',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: res_height * 0.02,
                        ),

                        Container(
                          width: res_width * 0.925,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 0, right: 8, left: 8),
                            child: TextFormField(
                              controller: bsns_trde_email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (text) =>
                                  EmailValidator.validate(text.toString())
                                      ? null
                                      : "Please enter a valid email",
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  labelText: 'Email:',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Container(
                        //   width: res_width * 0.925,
                        //   decoration: BoxDecoration(
                        //       color: Color(0xffaf8a39),
                        //       borderRadius: BorderRadius.all(Radius.circular(7))),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(13.0),
                        //     child: Center(
                        //       child: Text(
                        //         'Add Another',
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 17),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: res_height * 0.02,
                        // ),
                        kyc_main_text(
                            text:
                                "Agrement \nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                        SizedBox(
                          height: res_height * 0.03,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Signature: "),
                            Container(
                              // height: 1,
                              width: res_width * 0.6,
                              // color: Colors.black,
                              child: TextFormField(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        Text(
                          'Name and Title:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        textfiel_kyc(
                            controller: sig_name_title,
                            head: 'Name and Title:',
                            res_width: res_width),

                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Text(
                        //   'Date:',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        // textfiel_kyc(controller: sig_date, res_width: res_width),
                        Container(
                          width: res_width * 0.925,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 0, right: 8, left: 8),
                            child: TextFormField(
                              controller: sig_date,
                              readOnly: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Date ';
                                }
                                return null;
                              },
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context, //context of current state
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(
                                        2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(formattedDate);
                                  setState(() {
                                    sig_date.text =
                                        formattedDate; //set output date to TextField value.
                                  }); //formatted date output using intl package =>  2021-03-16
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  labelText: "Date ",
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),

                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              bottomctrl.navBarChange(2);

                              final DateTime now = DateTime.now();
                              final DateFormat formatter =
                                  DateFormat('yyyy-MM-dd');
                              final String formattedDate =
                                  formatter.format(now);
                              log("date field display " + formattedDate);

                              var sendData = {
                                'client_id': widget.clientId.toString(),
                                'company_name':
                                    creditfirstFormData['company_name'],
                                'company_address':
                                    creditfirstFormData['company_address'],
                                'city': creditfirstFormData['city'],
                                'contact_name':
                                    creditfirstFormData['contact_name'],
                                'phone': creditfirstFormData['phone'],
                                'sole_proprietorship':
                                    creditfirstFormData['sole_proprietorship'],
                                'corporation':
                                    creditfirstFormData['corporation'],
                                'other': creditfirstFormData['other'],
                                'date_business_stared':
                                    creditfirstFormData['date_business_stared'],
                                'federal_id': creditfirstFormData['federal_id'],
                                'state': creditfirstFormData['state'],
                                'fax': creditfirstFormData['fax'],
                                'zip': creditfirstFormData['zip'],
                                'email': creditfirstFormData['email'],
                                'partnership':
                                    creditfirstFormData['partnership'],
                                'type_of_business':
                                    creditfirstFormData['type_of_business'],
                                'd_and_b': creditfirstFormData['d_and_b'],
                                'bank_name': bank_name.text.toString(),
                                'bank_address': bank_address.text.toString(),
                                'bank_city': bank_city.text.toString(),
                                'bank_contact_name':
                                    bank_contact_name.text.toString(),
                                'bank_state': bank_state.text.toString(),
                                'bank_zip': bank_zip.text.toString(),
                                'bank_phone': bank_phone.text.toString(),
                                'bsns_trde_company_name':
                                    bsns_trde_company_name.text.toString(),
                                'bsns_trde_company_address':
                                    bsns_trde_company_address.text.toString(),
                                'bsns_trde_city':
                                    bsns_trde_city.text.toString(),
                                'bsns_trde_state':
                                    bsns_trde_state.text.toString(),
                                'bsns_trde_zip': bsns_trde_zip.text.toString(),
                                'bsns_trde_phone':
                                    bsns_trde_phone.text.toString(),
                                'bsns_trde_fax': bsns_trde_fax.text.toString(),
                                'bsns_trde_email':
                                    bsns_trde_email.text.toString(),
                                'sig_name_title':
                                    sig_name_title.text.toString(),
                                'sig_date': sig_date.text,
                              };
                              // sendData.addAll(widget.requestFormdata);
                              // sendData.addAll(kycrequestFormdatafromQuote);
                              // sendData.addAll(creditfirstFormData);

                              log("send data all value" + sendData.toString());
                              // var jsonBody = json.encode(sendData);

                              var res_data = await ApiService()
                                  .creditFormApi(context, sendData);
                            }

                            // CFA2();
                            // Get.to(() => MainScreen());
                          },
                          child: Container(
                            width: res_width * 0.925,
                            decoration: BoxDecoration(
                                color: Color(0xffaf8a39),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
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
        ));
  }

  CFA2() async {
    // final uri = Uri.parse(
    //     '${apiGlobal}/user/credit-application-submit');
    // log("Osama");
    // var getrequestedDatavar= json.encode(widget.requestFormdata);
    // log( widget.requestFormdata['product_id']);

    // print("widget.requestFormdata['product_id'].toString()"+ int.tryParse(widget.requestFormdata['product_id']).toString());

    // final headers = {
    //   'Content-Type': 'application/x-www-form-urlencoded',
    //   'Authorization': 'Bearer ${globaltoken}',
    // };

    // http.Response response = await http.post(
    //   uri,
    //   headers: headers,
    //   body: jsonBody,
    // );

    // print(response.statusCode);

    // print(response.body);

    // var res_data = json.decode(response.body);

    // print(res_data);
    // if (res_data["status"] == true) {
    //   Get.to(() => MainScreen());
    // } else
    //   Get.snackbar(
    //     'Error',
    //     'Wrong Credentials',
    //     animationDuration: Duration(seconds: 2),
    //     snackPosition: SnackPosition.BOTTOM,
    //   );

    // return res_data;
  }
}

class textfiel_kyc extends StatelessWidget {
  var maxLines, head;
  TextEditingController? controller;
  textfiel_kyc({
    Key? key,
    this.head,
    this.controller,
    this.maxLines,
    required this.res_width,
  }) : super(key: key);

  final double res_width;
  // FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4,
        ),
        Container(
          width: res_width * 0.925,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 0, right: 8, left: 8),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter ${head} ';
                }
                return null;
              },
              controller: controller,
              maxLines: maxLines,
              // focusNode: myFocusNode,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: head,
                  labelStyle: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
}
