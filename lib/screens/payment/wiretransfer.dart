import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/auth/mainlogin.dart';
import 'package:stande_aero/screens/orders/orderstatus.dart';
import 'package:stande_aero/screens/payment/awaiting.dart';

import '../../helper/global.dart';
import '../../services/remote_services.dart';

class WireTransfer extends StatefulWidget {
  const WireTransfer({Key? key}) : super(key: key);

  @override
  State<WireTransfer> createState() => _WireTransferState();
}

class _WireTransferState extends State<WireTransfer> {
  TextEditingController wire_swift_code = TextEditingController();
  TextEditingController wire_payment_reference = TextEditingController();

  TextEditingController wire_account_holder = TextEditingController();
  TextEditingController wire_bank_name = TextEditingController();

  TextEditingController wire_iban = TextEditingController();
  TextEditingController wire_city = TextEditingController();

  TextEditingController wire_bank_account_number = TextEditingController();
  TextEditingController wire_special_id = TextEditingController();

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
                TextFieldHelper(
                    hed: "Swift Code",
                    labelText: "",
                    controller: wire_swift_code),
                TextFieldHelper(
                    hed: "Payment Refrence",
                    labelText: "",
                    controller: wire_payment_reference),
                TextFieldHelper(
                    hed: "Account Holder",
                    labelText: "",
                    controller: wire_account_holder),
                TextFieldHelper(
                    hed: "Bank Name",
                    labelText: "",
                    controller: wire_bank_name),
                TextFieldHelper(
                    hed: "IBAN", labelText: "", controller: wire_iban),
                TextFieldHelper(
                    hed: "City", labelText: "", controller: wire_city),
                TextFieldHelper(
                    hed: "Bank Account Number",
                    labelText: "",
                    controller: wire_bank_account_number),
                TextFieldHelper(
                    hed: "Special ID",
                    labelText: "",
                    controller: wire_special_id),
                SizedBox(
                  height: res_height * 0.01,
                ),
                GestureDetector(
                  onTap: () async {
                    var sendData = {
                      'day': global_day,
                      'month': global_month,
                      'customer_name': global_customer_name,
                      'customer_location': global_customer_location,
                      'stand_manufacturer': global_stand_manufacturer,
                      'stand_color': global_stand_color,
                      'stand_type': global_stand_type,
                      'stand_serial_number': global_stand_serial_number,
                      'stand_quantity': global_stand_quantity,
                      'delivery_location': global_delivery_location,
                      'delivery_date': global_delivery_date,
                      'daily_rent': global_daily_rent,
                      'replacement_value': global_replacement_value,
                      'security_deposit': global_security_deposit,
                      'guarantor': global_guarantor,
                      'registered_agent': global_registered_agent,
                      'signature_1': global_signature_1,
                      'signature_2': global_signature_2,
                      'tax_file': placeOrderData_tax_file,
                      'quote_id': placeOrderData_quote_id,
                      'fileType': placeOrderData_fileType
                    };
                    var res_data =
                        await ApiService().placeOrder(context, sendData);

                    print("Lease Form RESPONSE" + res_data.toString());
                    if (res_data['status'] == true) {
                      var wiretransferData = {
                        'wire_swift_code': wire_swift_code.text,
                        'wire_payment_reference': wire_payment_reference.text,
                        'wire_account_holder': wire_account_holder.text,
                        'wire_bank_name': wire_bank_name.text,
                        'wire_iban': wire_iban.text,
                        'wire_city': wire_city.text,
                        'wire_bank_account_number':
                            wire_bank_account_number.text,
                        'wire_special_id': wire_special_id.text
                      };

                      var res_data2 = await ApiService()
                          .wireTransfer(context, wiretransferData);
                      if (res_data2['status'] == true) {
                        Get.snackbar(
                          'Success',
                          "Kindly Pay the Amount using wire transfer",
                          snackPosition: SnackPosition.TOP,
                        );

                        Get.to(() => OrderStatus());
                      } else {
                        Get.back();

                        Get.snackbar(
                          'Error',
                          "Payment Failed",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                        );
                      }
                      // Get.to(PaymentScreen());
                    } else {
                      Get.snackbar(
                        'Error',
                        "Invalid Email Address",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.white,
                      );
                    }
                    // print('asdasd');
                    // Get.to(() => AwaitingConfirm());
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
  TextEditingController controller;
  TextFieldHelper(
      {Key? key,
      this.labelText,
      this.hed,
      this.maxLines,
      required this.controller})
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
                controller: controller,
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
