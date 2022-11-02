import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stande_aero/controller/usercontroller.dart';
import 'package:stande_aero/helper/loader.dart';
import 'package:stande_aero/services/remote_services.dart';
import 'package:stande_aero/bottomcontroller.dart';
import 'package:stande_aero/helper/global.dart';
import 'package:stande_aero/screens/kyc_Form/kyc_form.dart';
import 'package:stande_aero/screens/mainhome.dart';

class credit_from2 extends StatefulWidget {
  const credit_from2({
    Key? key,
  }) : super(key: key);

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

  final usercontroller = Get.put(UserController());

  final bottomctrl = Get.put(BottomController());

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
    log("requestFormdatafromQuote Osama" + requestFormdatafromQuote.toString());
    // var requestforvalue = widget.requestFormdata.s
    log("kycformData " + kycrequestFormdatafromQuote.toString());
    log("creditfirstFormData " + creditfirstFormData.toString());
    // requestDataofQuote = jsonEncode(widget.requestFormdata);
    // productId.text = requestFormdatafromQuote['product_id'];

    log("widget.requestFormdatafromQuote" +
        requestFormdatafromQuote['product_id'].toString());
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
                    textfiel_kyc(
                        controller: bank_zip,
                        head: 'Zip:',
                        res_width: res_width),
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
                        controller: bank_phone,
                        head: 'Phone:',
                        res_width: res_width),
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
                    // Text(
                    //   'City:',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //   ),
                    // ),
                    textfiel_kyc(
                        controller: bsns_trde_city,
                        head: 'City:',
                        res_width: res_width),
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
                        controller: bsns_trde_state,
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
                    textfiel_kyc(
                        controller: bsns_trde_zip,
                        head: 'Zip:',
                        res_width: res_width),

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
                        controller: bsns_trde_phone,
                        head: 'Phone:',
                        res_width: res_width),

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
                    textfiel_kyc(
                        controller: bsns_trde_fax,
                        head: 'Fax:',
                        res_width: res_width),

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
                        controller: bsns_trde_email,
                        head: 'Email:',
                        res_width: res_width),
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
                      onTap: () async {
                        bottomctrl.navBarChange(2);
                        log("aaja bhai1 " +
                            requestFormdatafromQuote['product_id'].toString());
                        log("aaja bhai2 " +
                            requestFormdatafromQuote['location'].toString());
                        log("aaja bhai3 " +
                            requestFormdatafromQuote['date_from'].toString());

                        log("aaja bhai4 " +
                            requestFormdatafromQuote['date_to'].toString());

                        final DateTime now = DateTime.now();
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        final String formattedDate = formatter.format(now);
                        log("date field display " +
                            formattedDate);

                        if (requestFormdatafromQuote['product_id'] != null) {
                          var sendData = {
                            'product_id': requestFormdatafromQuote['product_id']
                                .toString(),
                            'location':
                                requestFormdatafromQuote['location'].toString(),
                            'date_from': requestFormdatafromQuote['date_from']
                                .toString(),
                            'date_to':
                                requestFormdatafromQuote['date_to'].toString(),
                            'kyc_client_id': usercontroller.user.id.toString(),
                            'kyc_company_name':
                                kycrequestFormdatafromQuote['company_name'],
                            'kyc_company_type':
                                kycrequestFormdatafromQuote['company_type'],
                            'kyc_company_state_country':
                                kycrequestFormdatafromQuote[
                                    'company_state_country'],
                            'kyc_company_address':
                                kycrequestFormdatafromQuote['company_address'],
                            'kyc_number': kycrequestFormdatafromQuote['number'],
                            'kyc_fax': kycrequestFormdatafromQuote['fax'],
                            'kyc_contact_person':
                                kycrequestFormdatafromQuote['contact_person'],
                            'kyc_email': kycrequestFormdatafromQuote['email'],
                            'kyc_date' : formattedDate,
                            'kyc_company_website':
                                kycrequestFormdatafromQuote['company_website'],
                            'kyc_company_additional_members':
                                kycrequestFormdatafromQuote[
                                    'company_additional_members'],
                            'kyc_company_prmy_bsns':
                                kycrequestFormdatafromQuote[
                                    'company_prmy_bsns'],
                            'kyc_fund_src':
                                kycrequestFormdatafromQuote['fund_src'],
                            'kyc_company_countrylist':
                                kycrequestFormdatafromQuote[
                                    'company_countrylist'],
                            'crd_company_name':
                                creditfirstFormData['company_name'],
                            'crd_company_address':
                                creditfirstFormData['company_address'],
                            'crd_city': creditfirstFormData['city'],
                            'crd_contact_name':
                                creditfirstFormData['contact_name'],
                            'crd_phone': creditfirstFormData['phone'],
                            'crd_sole_proprietorship':
                                creditfirstFormData['sole_proprietorship'],
                            'crd_corporation':
                                creditfirstFormData['corporation'],
                            'crd_other': creditfirstFormData['other'],
                            'crd_date_business_stared':
                                creditfirstFormData['date_business_stared'],
                            'crd_federal_id': creditfirstFormData['federal_id'],
                            'crd_state': creditfirstFormData['state'],
                            'crd_fax': creditfirstFormData['fax'],
                            'crd_zip': creditfirstFormData['zip'],
                            'crd_email': creditfirstFormData['email'],
                            'crd_type_of_business':
                                creditfirstFormData['type_of_business'],
                            'crd_d_and_b': creditfirstFormData['d_and_b'],
                            'crd_bank_name': bank_name.text.toString(),
                            'crd_bank_address': bank_address.text.toString(),
                            'crd_bank_city': bank_city.text.toString(),
                            'crd_bank_contact_name':
                                bank_contact_name.text.toString(),
                            'crd_bank_state': bank_state.text.toString(),
                            'crd_bank_zip': bank_zip.text.toString(),
                            'crd_bank_phone': bank_phone.text.toString(),
                            'crd_bsns_trde_company_name':
                                bsns_trde_company_name.text.toString(),
                            'crd_bsns_trde_company_address':
                                bsns_trde_company_address.text.toString(),
                            'crd_bsns_trde_city':
                                bsns_trde_city.text.toString(),
                            'crd_bsns_trde_state':
                                bsns_trde_state.text.toString(),
                            'crd_bsns_trde_zip': bsns_trde_zip.text.toString(),
                            'crd_bsns_trde_phone':
                                bsns_trde_phone.text.toString(),
                            'crd_bsns_trde_fax': bsns_trde_fax.text.toString(),
                            'crd_bsns_trde_email':
                                bsns_trde_email.text.toString(),
                            'crd_sig_name_title':
                                sig_name_title.text.toString(),
                            'crd_sig_date': sig_date.text,
                          };
                          // sendData.addAll(widget.requestFormdata);
                          // sendData.addAll(kycrequestFormdatafromQuote);
                          // sendData.addAll(creditfirstFormData);

                          log("send data all value" + sendData.toString());
                          // var jsonBody = json.encode(sendData);

                          var res_data = await ApiService()
                              .getQuoteRequest(context, sendData);
                        }

                        // CFA2();
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
