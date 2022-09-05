import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/bottomcontroller.dart';
import 'package:stande_aero/screens/kyc_Form/kyc_form.dart';
import 'package:stande_aero/screens/mainhome.dart';

class credit_from2 extends StatefulWidget {
  const credit_from2({Key? key}) : super(key: key);

  @override
  State<credit_from2> createState() => _credit_from2State();
}

class _credit_from2State extends State<credit_from2> {
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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),

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
                  textfiel_kyc(res_width: res_width),

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
                  textfiel_kyc(res_width: res_width),

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
                  textfiel_kyc(res_width: res_width),

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
                  textfiel_kyc(res_width: res_width),
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
                  textfiel_kyc(res_width: res_width),

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
                  textfiel_kyc(res_width: res_width),

                  SizedBox(
                    height: res_height * 0.02,
                  ),

                  GestureDetector(
                    onTap: () {
                      bottomctrl.navBarChange(2);
                      Get.to(() => MainScreen());
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
}
