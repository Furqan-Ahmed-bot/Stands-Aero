import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../helper/loader.dart';
import '../../services/remote_services.dart';
import '../../widgets/disallow_indicator_widget.dart';
import '../../widgets/remove_focus_widget.dart';
import '../credit_Form/credit_form.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class KycForm2 extends StatefulWidget {
  final int clientId;
  final Map<String, dynamic> firstKycFormData;
  const KycForm2(
      {super.key, required this.firstKycFormData, required this.clientId});

  @override
  State<KycForm2> createState() => _KycForm2State();
}

class _KycForm2State extends State<KycForm2> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController company_name2 = TextEditingController();
  TextEditingController byController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

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
      body: RemoveFocusWidget(
        child: Container(
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
                        KycText(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                        KycText(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                        KycText(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                        KycText(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                        SizedBox(
                          height: res_height * 0.01,
                        ),
                        Text(
                          'Company Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: res_height * 0.01,
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
                              controller: company_name2,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name of company';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        Text(
                          'By',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: res_height * 0.01,
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
                              controller: byController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter By of company ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        Text(
                          'Title',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
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
                              controller: titleController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter title of company ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        Text(
                          'Date',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        // Container(
                        //   width: res_width * 0.925,
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey,
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(7))),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //         top: 8, bottom: 0, right: 8, left: 8),
                        //     child: TextFormField(
                        //       controller: dateController,
                        //       validator: (value) {
                        //         if (value == null || value.isEmpty) {
                        //           return 'Please enter date';
                        //         }
                        //         return null;
                        //       },
                        //       decoration: InputDecoration(
                        //         contentPadding:
                        //             EdgeInsets.symmetric(horizontal: 10),
                        //       ),
                        //     ),
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
                              controller: dateController,
                              readOnly: true,
                              onSaved: (newValue) => dateController.text,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                // isCollapsed: true,
                                // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                constraints:
                                    BoxConstraints(maxWidth: 120, minWidth: 10),
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
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  // print("final date" + formattedDate);
                                  setState(() {
                                    dateController.text =
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
                        ),
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              submitKycForm();
                            }
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
                                  'Submit Form',
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
        ),
      ),
    );
  }

  submitKycForm() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/api/user/kyc-submit');

    // print(uri);

    widget.firstKycFormData['company2_name'] = company_name2.text;
    widget.firstKycFormData['_by'] = byController.text;
    widget.firstKycFormData['title'] = titleController.text;
    widget.firstKycFormData['date'] = dateController.text;
    // log('KYC SUBMIT FORM DATA: ${widget.firstKycFormData.toString()}');

    var jsonBody = json.encode(widget.firstKycFormData);

    log('KYC FORM jsonbody: $jsonBody');

    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'bearer ${globaltoken}',
    };

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: widget.firstKycFormData,
    );

    log(response.statusCode.toString());

    // log(response.body);
    // try {
    //   var res_data = json.decode(response.body);
    // } catch (e) {
    //   log('$e');
    // }
    var res_data = json.decode(response.body);

    print(res_data);
    if (res_data["status"] == true) {
      // Get.back();
      Get.snackbar(
        'Great',
        'KYC Form Submit Successfully',
        animationDuration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(() => credit_form(
            clientId: widget.clientId,
          ));
    } else {
      // Get.back();
      Get.snackbar(
        'Error',
        res_data['error'].toString(),
        animationDuration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class KycText extends StatelessWidget {
  final String text;

  KycText({Key? key, required this.text}) : super(key: key);

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
