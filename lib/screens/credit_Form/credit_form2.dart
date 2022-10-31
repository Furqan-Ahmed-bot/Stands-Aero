import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/services/remote_services.dart';
import 'package:stande_aero/bottomcontroller.dart';
import 'package:stande_aero/helper/global.dart';
import 'package:stande_aero/screens/kyc_Form/kyc_form.dart';
import 'package:stande_aero/screens/mainhome.dart';

class credit_from2 extends StatefulWidget {
  final requestFormdata;
  final kycformData;
  final creditfirstFormData;
  final requestProductId ;
  const credit_from2({Key? key, required this.requestFormdata, required this.kycformData, required this.creditfirstFormData, required this.requestProductId}) : super(key: key);

  @override
  State<credit_from2> createState() => _credit_from2State();
}

class _credit_from2State extends State<credit_from2> {
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

  final bottomctrl = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    log("requestFormdata " + widget.requestFormdata.toString());
    // var requestforvalue = widget.requestFormdata.s
    log("kycformData " + widget.kycformData.toString());
    log("creditfirstFormData " + widget.creditfirstFormData.toString());
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
            child: SingleChildScrollView(
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
                  textfiel_kyc(controller: bank_name,head:'Bank Name: ', res_width: res_width),
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
                  textfiel_kyc(controller: bank_address,head:'Bank Address: ', res_width: res_width),
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
                  textfiel_kyc(controller: bank_city,head:'City:', res_width: res_width),
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
                    head:'Contact Name:'
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
                  textfiel_kyc(controller: bank_state,head:'State:', res_width: res_width),
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
                  textfiel_kyc(controller: bank_zip,head:'Zip:', res_width: res_width),
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
                  textfiel_kyc(controller: bank_phone,head:'Phone:', res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),

                  GestureDetector(
                    child: Container(
                      width: res_width * 0.925,
                      decoration: BoxDecoration(
                          color: Color(0xffaf8a39),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Center(
                          child: Text(
                            'Add Another',
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
                  Text(
                    'Busniess/Trade reference',
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
                      controller: bsns_trde_company_name,head:'Company Name:', res_width: res_width),
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
                      head:'Company Address:',
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
                      controller: bsns_trde_city,head:'City:', res_width: res_width),
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
                      controller: bsns_trde_state,head:'State:', res_width: res_width),

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
                  textfiel_kyc(controller: bsns_trde_zip,head:'Zip:', res_width: res_width),

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
                  textfiel_kyc(
                      controller: bsns_trde_phone,head:'Phone:', res_width: res_width),

                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Fax:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: bsns_trde_fax,head:'Fax:', res_width: res_width),

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
                  textfiel_kyc(
                      controller: bsns_trde_email,head:'Email:', res_width: res_width),
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
                          'Add Another',
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
                        child: TextField(),
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
                      controller: sig_name_title, res_width: res_width),

                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Date:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: sig_date, res_width: res_width),

                  SizedBox(
                    height: res_height * 0.02,
                  ),

                  GestureDetector(
                    onTap: () {
                      bottomctrl.navBarChange(2);
                      CFA2();
                      // Get.to(() => MainScreen());
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
    );
  }

  CFA2() async {
    // final uri = Uri.parse(
    //     '${apiGlobal}/user/credit-application-submit');
    // log("Osama");
    // var getrequestedDatavar= json.encode(widget.requestFormdata);
    // log( widget.requestFormdata['product_id']);

    // print("widget.requestFormdata['product_id'].toString()"+ int.tryParse(widget.requestFormdata['product_id']).toString());

    var sendData = {
      'crd_bank_name': bank_name.text.toString(),
      'crd_bank_address': bank_address.text.toString(),
      'crd_bank_city': bank_city.text.toString(),
      'crd_bank_contact_name': bank_contact_name.text.toString(),
      'crd_bank_state': bank_state.text.toString(),
      'crd_bank_zip': bank_zip.text.toString(),
      'crd_bank_phone': bank_phone.text.toString(),
      'crd_bsns_trde_company_name': bsns_trde_company_name.text.toString(),
      'crd_bsns_trde_company_address': bsns_trde_company_address.text.toString(),
      'crd_bsns_trde_city': bsns_trde_city.text.toString(),
      'crd_bsns_trde_state': bsns_trde_state.text.toString(),
      'crd_bsns_trde_zip': bsns_trde_zip.text.toString(),
      'crd_bsns_trde_phone': bsns_trde_phone.text.toString(),
      'crd_bsns_trde_fax': bsns_trde_fax.text.toString(),
      'crd_bsns_trde_email': bsns_trde_email.text.toString(),
      'crd_sig_name_title': sig_name_title.text.toString(),
      'crd_sig_date': sig_date.text.toString(),
      'product_id' : widget.requestFormdata['product_id'].toString(),
      'location': widget.requestFormdata['location'].toString(),
      'date_from' : widget.requestFormdata['firstDay'].toString(),
      'date_to' : widget.requestFormdata['lastDay'].toString(),
      'kyc_client_id': widget.kycformData['client_id'].toString(),
      'kyc_company_name': widget.kycformData['company_name'].toString(),
      'kyc_company_type': widget.kycformData['company_type'].toString(),
      'kyc_company_state_country': widget.kycformData['company_state_country'].toString(),
      'kyc_company_address': widget.kycformData['company_address'].toString(),
      'kyc_number': widget.kycformData['number'].toString(),
      'kyc_fax': widget.kycformData['fax'].toString(),
      'kyc_contact_person': widget.kycformData['contact_person'].toString(),
      'kyc_email': widget.kycformData['email'].toString(),
      'kyc_company_website': widget.kycformData['company_website'].toString(),
      'kyc_company_additional_members': widget.kycformData['company_additional_members'].toString(),
      'kyc_company_prmy_bsns': widget.kycformData['company_prmy_bsns'].toString(),
      'kyc_fund_src': widget.kycformData['fund_src'].toString(),
      'kyc_company_countrylist': widget.kycformData['company_countrylist.tex'].toString(),
      'crd_company_name': widget.creditfirstFormData['company_name'].toString(),
      'crd_company_address': widget.creditfirstFormData['company_address'].toString(),
      'crd_city': widget.creditfirstFormData['city'].toString(),
      'crd_contact_name': widget.creditfirstFormData['contact_name'].toString(),
      'crd_phone': widget.creditfirstFormData['phone'].toString(),
      'crd_sole_proprietorship': widget.creditfirstFormData['sole_proprietorship'].toString(),
      'crd_corporation': widget.creditfirstFormData['corporation'].toString(),
      'crd_other': widget.creditfirstFormData['other'].toString(),
      'crd_date_business_stared': widget.creditfirstFormData['date_business_stared'].toString(),
      'crd_federal_id': widget.creditfirstFormData['federal_id'].toString(),
      'crd_state': widget.creditfirstFormData['state'].toString(),
      'crd_fax': widget.creditfirstFormData['fax'].toString(),
      'crd_zip': widget.creditfirstFormData['zip'].toString(),
      'crd_email': widget.creditfirstFormData['email'].toString(),
      'crd_type_of_business': widget.creditfirstFormData['type_of_business'].toString(),
      'crd_d_and_b': widget.creditfirstFormData['d_and_b'].toString(),
    };
    // sendData.addAll(widget.requestFormdata);
    // sendData.addAll(widget.kycformData);
    // sendData.addAll(widget.creditfirstFormData);

    log("send data all value" + sendData.toString());
    // var jsonBody = json.encode(sendData);

    var res_data= await ApiService().getQuoteRequest(context,widget.requestProductId,sendData);

    
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
  var maxLines,head;
  TextEditingController? controller;
  textfiel_kyc({
    Key? key,
    this.head,
    this.controller,
    this.maxLines,
    required this.res_width,
  }) : super(key: key);

  final double res_width;
  FocusNode myFocusNode = new FocusNode();

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
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            focusNode: myFocusNode,            
           decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: head,
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus ? Colors.white : Colors.black)),
          ),
        ),
      ],
    );
  }
}
