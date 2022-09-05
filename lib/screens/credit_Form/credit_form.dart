import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/credit_Form/credit_form2.dart';

class credit_form extends StatelessWidget {
  const credit_form({Key? key}) : super(key: key);

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
                    'Busniess and contact information',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: res_height * 0.01,
                  ),
                  Text(
                    'Company Name: ',
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
                    'Company Address: ',
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
                  textfiel_kyc(res_width: res_width),
                  SizedBox(
                    height: res_height * 0.02,
                  ),
                  Text(
                    'Sole Proprietorship:',
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
                    'Corporation:',
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
                    'Other:',
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
                    'Date Busniess Started:',
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
                    'Fedral ID:',
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
                    'Satate:',
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
                  Text(
                    'Partnership:',
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
                    'Type Of Busniess:',
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
                    'D&B#:',
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
                      print("object");
                      Get.to(() => credit_from2());
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
}

class textfiel_kyc extends StatelessWidget {
  var maxLines;

  textfiel_kyc({
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
