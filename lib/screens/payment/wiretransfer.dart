import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/auth/mainlogin.dart';
import 'package:stande_aero/screens/payment/awaiting.dart';

class WireTransfer extends StatefulWidget {
  const WireTransfer({Key? key}) : super(key: key);

  @override
  State<WireTransfer> createState() => _WireTransferState();
}

class _WireTransferState extends State<WireTransfer> {
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                'Wire Transfer',
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
        body: Container(
          width: double.infinity,
          // height:  double.infinity,

          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFieldHelper(hed: "Swift Code", labelText: ""),
                TextFieldHelper(hed: "Payment Refrence", labelText: ""),
                TextFieldHelper(hed: "Account Holder", labelText: ""),
                TextFieldHelper(hed: "Bank Name", labelText: ""),
                TextFieldHelper(hed: "IBAN", labelText: ""),
                TextFieldHelper(hed: "City", labelText: ""),
                TextFieldHelper(hed: "Bank Account Number", labelText: ""),
                TextFieldHelper(hed: "Special ID", labelText: ""),
                SizedBox(
                  height: res_height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    print('asdasd');
                    Get.to(() => AwaitingConfirm());
                    // Get.to(() => MainLoginScreen());
                  },
                  child: Container(
                    width: res_width * 0.9,
                    decoration: BoxDecoration(
                        color: Color(0xffaf8a39),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Center(
                        child: Text(
                          'Fund Transfer',
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
    );
  }
}

class TextFieldHelper extends StatelessWidget {
  var labelText, hed;

  var maxLines;

  TextFieldHelper({Key? key, this.labelText, this.hed, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: res_width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$hed",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          SizedBox(
            height: res_height * 0.0075,
          ),
          Card(
            elevation: 8,
            child: Container(
              // height: 50,
              // padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                maxLines: maxLines,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "$labelText",
                    contentPadding: EdgeInsets.only(
                        left: 10, top: maxLines != null ? 10 : 0)),
                // controller: controller,
              ),
            ),
          ),
          SizedBox(
            height: res_height * 0.0075,
          ),
        ],
      ),
    );
  }
}
