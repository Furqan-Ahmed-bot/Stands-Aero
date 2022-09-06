import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/bottomcontroller.dart';
import 'package:stande_aero/helper/global.dart';
import 'package:stande_aero/screens/kyc_Form/kyc_form.dart';
import 'package:stande_aero/screens/mainhome.dart';

class credit_from2 extends StatefulWidget {
  const credit_from2({Key? key}) : super(key: key);

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
                  Text(
                    'Bank Name: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: bank_name, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Bank Address: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: bank_address, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'City:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: bank_city, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Contact Name:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                    controller: bank_contact_name,
                    res_width: res_width,
                    // maxLines: 4,
                  ),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'State:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: bank_state, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Zip:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: bank_zip, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Phone:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: bank_phone, res_width: res_width),
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
                  Text(
                    'Company Name:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                      controller: bsns_trde_company_name, res_width: res_width),
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
                      controller: bsns_trde_company_address,
                      res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'City:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                      controller: bsns_trde_city, res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'State:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                      controller: bsns_trde_state, res_width: res_width),

                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Zip:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(controller: bsns_trde_zip, res_width: res_width),

                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Phone:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  textfiel_kyc(
                      controller: bsns_trde_phone, res_width: res_width),

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
                  textfiel_kyc(controller: bsns_trde_fax, res_width: res_width),

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
                  textfiel_kyc(
                      controller: bsns_trde_email, res_width: res_width),
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
    final uri = Uri.parse(
        'https://qtdev.the4loop.com/api/user/credit-application-submit');

    print(uri);

    var sendData = {
      'bank_name': bank_name.text,
      'bank_address': bank_address.text,
      'bank_city': bank_city.text,
      'bank_contact_name': bank_contact_name.text,
      'bank_state': bank_state.text,
      'bank_zip': bank_zip.text,
      'bank_phone': bank_phone.text,
      'bsns_trde_company_name': bsns_trde_company_name.text,
      'bsns_trde_company_address': bsns_trde_company_address.text,
      'bsns_trde_city': bsns_trde_city.text,
      'bsns_trde_state': bsns_trde_state.text,
      'bsns_trde_zip': bsns_trde_zip.text,
      'bsns_trde_phone': bsns_trde_phone.text,
      'bsns_trde_fax': bsns_trde_fax.text,
      'bsns_trde_email': bsns_trde_email.text,
      'sig_name_title': sig_name_title.text,
      'sig_date': sig_date.text,
    };

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
      Get.to(() => MainScreen());
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

  textfiel_kyc({
    TextEditingController? controller,
    Key? key,
    this.maxLines,
    required this.res_width,
  }) : super(key: key);

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
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
