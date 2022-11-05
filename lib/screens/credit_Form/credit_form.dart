import 'dart:convert';
import 'dart:developer';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/credit_Form/credit_form2.dart';
import 'package:stande_aero/helper/global.dart';
import 'package:stande_aero/services/remote_services.dart';
import 'package:intl/intl.dart';

class credit_form extends StatefulWidget {
  final kycformData;
  const credit_form({Key? key, required this.kycformData}) : super(key: key);

  @override
  State<credit_form> createState() => _credit_formState();
}

class _credit_formState extends State<credit_form> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController company_name = TextEditingController();
  TextEditingController company_address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController contact_name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController sole_proprietorship = TextEditingController();
  TextEditingController corporation = TextEditingController();
  TextEditingController other = TextEditingController();
  TextEditingController date_business_stared = TextEditingController();
  TextEditingController federal_id = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController fax = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController partnership = TextEditingController();
  TextEditingController type_of_business = TextEditingController();
  TextEditingController d_and_b = TextEditingController();
  // String apiGlobal = "https://standsaero.jumppace.com/api/";
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    log("requestFormdatafromQuote form data " +
        requestFormdatafromQuote.toString());
    log("Kyc Form Data " + widget.kycformData.toString());

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
                      'Busniess and contact information',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: res_height * 0.01,
                    ),
                    // Text(
                    //   'Company Name: ',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: company_name,
                    //     hed: 'Company Name: ',
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
                              return 'Please enter Company Name ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Company Name",
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
                    //   'Company Address: ',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: company_address,
                    //     hed: 'Company Address: ',
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
                          controller: company_address,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Company address ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Company Address",
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
                    //   'City:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: city, hed: 'City:', res_width: res_width),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: city,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter city ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "City",
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
                    //   'Contact Name:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //   controller: contact_name,
                    //   res_width: res_width,
                    //   hed: 'Contact Name:',
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
                          controller: contact_name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter contact name ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Contact Name",
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
                    // textfiel_kyc(
                    //     controller: phone,
                    //     hed: 'Phone Number:',
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
                          controller: phone,
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
                    //   'Sole Proprietorship:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: sole_proprietorship,
                    //     hed: 'Sole Proprietorship:',
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
                          controller: sole_proprietorship,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter sole proprietorship ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Sole Proprietorship",
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
                    //   'Corporation:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: corporation,
                    //     hed: 'Corporation:',
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
                          controller: corporation,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter corporation';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Corporation",
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
                    //   'Other:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: other, hed: 'Other:', res_width: res_width),

                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: other,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Other",
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
                    //   'Date Busniess Started:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: date_business_stared,
                    //     hed: 'Date Busniess Started:',
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
                          controller: date_business_stared,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Date Busniess Started';
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
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);
                              setState(() {
                                date_business_stared.text =
                                    formattedDate; //set output date to TextField value.
                              }); //formatted date output using intl package =>  2021-03-16
                            } else {
                              print("Date is not selected");
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Date Busniess Started",
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
                    //   'Fedral ID:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: federal_id,
                    //     hed: 'Fedral ID:',
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
                          controller: federal_id,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter federal ID';
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
                              labelText: 'Federal ID',
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
                    //   'State:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: state, hed: 'State:', res_width: res_width),

                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: state,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "State",
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
                    //   'Fax:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: fax, hed: 'Fax:', res_width: res_width),
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
                    //   'Zip:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: zip, hed: 'Zip:', res_width: res_width),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: zip,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter zip';
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
                    // textfiel_kyc(
                    //     controller: email, hed: 'Email:', res_width: res_width),

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
                    //   'Partnership:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: partnership,
                    //     hed: 'Partnership:',
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
                          controller: partnership,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter partnership';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Partnership",
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
                    //   'Type Of Busniess:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: type_of_business,
                    //     hed: 'Type Of Busniess:',
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
                          controller: type_of_business,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter partnership';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Type Of Busniess",
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
                    //   'D&B#:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    // textfiel_kyc(
                    //     controller: d_and_b, hed: 'D&B#:', res_width: res_width),
                    Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 8),
                        child: TextFormField(
                          controller: d_and_b,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "D&B#",
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

                    GestureDetector(
                      onTap: () async {
                        // print(Response);
                        // CFA();
                        if (formKey.currentState!.validate()) {
                          var sendData = {
                            'company_name': company_name.text,
                            'company_address': company_address.text,
                            'city': city.text,
                            'contact_name': contact_name.text,
                            'phone': phone.text,
                            'sole_proprietorship': sole_proprietorship.text,
                            'corporation': corporation.text,
                            'other': other.text,
                            'date_business_stared': date_business_stared.text,
                            'federal_id': federal_id.text,
                            'state': state.text,
                            'fax': fax.text,
                            'zip': zip.text,
                            'email': email.text,
                            'type_of_business': type_of_business.text,
                            'd_and_b': d_and_b.text,
                          };

                          log("requestFormdatafromQuote send data" +
                              requestFormdatafromQuote.toString());
                          log("kyc send data" + widget.kycformData.toString());
                          log("send data" + sendData.toString());
                          creditfirstFormData = sendData;
                          Get.to(() => credit_from2());
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
}
//   CFA() async {
//     final uri = Uri.parse(
//         '${apiGlobal}user/credit-application-submit');

//     print(uri);

//     var sendData = {
//       // 'client_id': '29',
//       // 'company_name': 'test company',
//       // 'company_address': 'abc address',
//       // 'city': 'california',
//       // 'contact_name': 'george',
//       // 'phone': '+1321654987',
//       // 'sole_proprietorship': 'test sole proprietorship',
//       // 'corporation': 'block box',
//       // 'other': 'other details',
//       // 'date_business_stared': '2022-06-06',
//       // 'federal_id': '56456',
//       // 'state': 'las vegas',
//       // 'fax': '3234234',
//       // 'zip': '022985',
//       // 'email': 'saasd@qwqw.com',
//       // 'partnership': 'asdsd',
//       // 'type_of_business': 'dasd',
//       // 'd_and_b': 'asdasd',
//       // 'bank_name': 'sdasd',
//       // 'bank_address': 'asdas',
//       // 'bank_city': 'as',
//       // 'bank_contact_name': 'asdasd',
//       // 'bank_state': 'asds',
//       // 'bank_zip': '32154',
//       // 'bank_phone': 'asdadasdsa',
//       // 'bsns_trde_company_name': 'asasd',
//       // 'bsns_trde_company_address': 'asdsda',
//       // 'bsns_trde_city': 'assdasd',
//       // 'bsns_trde_state': 'asdas',
//       // 'bsns_trde_zip': '2565',
//       // 'bsns_trde_phone': 'asdasd',
//       // 'bsns_trde_fax': 'asdasd',
//       // 'bsns_trde_email': 'asdsad',
//       // 'sig_name_title': 'asdasd',
//       // 'sig_date': '2022-05-05'
//       'company_name': company_name.text,
//       'company_address': company_address.text,
//       'city': city.text,
//       'contact_name': contact_name.text,
//       'phone': phone.text,
//       'sole_proprietorship': sole_proprietorship.text,
//       'corporation': corporation.text,
//       'other': other.text,
//       'date_business_stared': date_business_stared.text,
//       'federal_id': federal_id.text,
//       'state': state.text,
//       'fax': fax.text,
//       'zip': zip.text,
//       'email': email.text,
//       'type_of_business': type_of_business.text,
//       'd_and_b': d_and_b.text,
//     };

//     var jsonBody = json.encode(sendData);

//     final headers = {
//       'Content-Type': 'application/x-www-form-urlencoded',
//       'Authorization': 'Bearer ${globaltoken}',
//     };

//     http.Response response = await http.post(
//       uri,
//       headers: headers,
//       body: jsonBody,
//     );

//     print(response.statusCode);

//     print(response.body);
//     // try {
//     //   var res_data = json.decode(response.body);
//     // } catch (e) {
//     //   log('$e');
//     // }
//     var res_data = json.decode(response.body);

//     print(res_data);
//     if (res_data["status"] == true) {
//       Get.to(() => credit_from2());
//     } else
//       Get.snackbar(
//         'Error',
//         'Wrong Credentials',
//         animationDuration: Duration(seconds: 2),
//         snackPosition: SnackPosition.BOTTOM,
//       );

//     return res_data;
//   }
// }

class textfiel_kyc extends StatelessWidget {
  var maxLines, hed;
  TextEditingController? controller;
  textfiel_kyc({
    this.controller,
    Key? key,
    this.maxLines,
    this.hed,
    required this.res_width,
  }) : super(key: key);
  FocusNode myFocusNode = new FocusNode();
  final double res_width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4,
        ),
        Container(
          width: res_width * 0.925,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            focusNode: myFocusNode,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: hed,
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus ? Colors.white : Colors.black)),
          ),
        ),
      ],
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
