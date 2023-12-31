import 'dart:io';

import 'package:StandsAero/helper/global.dart';
import 'package:StandsAero/widgets/disallow_indicator_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lease_form8.dart';

class lease_form7 extends StatefulWidget {
  const lease_form7({Key? key}) : super(key: key);

  @override
  State<lease_form7> createState() => _lease_form7State();
}

class _lease_form7State extends State<lease_form7> {
  File? imageFile;
  late String _selectedValue1;
  String? filePath;
  String? fileType;
  String? fileName;
  _getFromGallery() async {
    // XFile? xFile = await ImagePicker().pickImage(
    //     source: ImageSource.gallery, maxWidth: 2000, maxHeight: 2000);

    // if (xFile != null) {
    //   setState(() {
    //     imageFile = File(xFile.path);
    //     signatureeee = imageFile.toString();
    //     print("imageFile data" + signatureeee);
    //   });
    //   // imageProvider.addImage(imageFile);
    //   // imagesList[i] = imageFile;
    // }
    FilePickerResult? resultvar = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'png', 'jpg'],
    );
    if (resultvar != null) {
      String? filevar = resultvar.files.single.path;
      filePath = filevar;
      fileType = resultvar.files.single.extension;

      print("filevar" + filevar.toString());
      print("filevar type" + resultvar.files.single.extension.toString());

      setState(() {
        fileName = resultvar.files.single.name;
        signature = filevar.toString();
        signaturetype = resultvar.files.single.name;

        print('Filenameeee  ${signaturetype}');
      });
    } else {
      // User canceled the picker
    }
  }

  TextEditingController registered_agent = TextEditingController();
  TextEditingController signature_1 = TextEditingController();
  TextEditingController signature_2 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Get.back();
              // _key.currentState!.openDrawer();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lease Form',
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
        // extendBodyBehindAppBar: true,
        body: Container(
          // width: double.infinity,
          // height: double.infinity,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/slicing/Untitled-46.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: DisAllowIndicatorWidget(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: res_width * 0.85,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    """ 24. Jurisdiction: Each party hereby irrevocably and unconditionally submits, for itself and its property, to the nonexclusive jurisdiction of the courts of the State of Texas in any action or proceeding arising out of or relating \nto this Agreement, or for recognition or enforcement of any judgment, and each party hereby irrevocably and unconditionally agrees that all claims in respect of any such action or proceeding may be heard and determined in the courts of the State of Texas. The prevailing party shall be entitled to reimbursement of all reasonable attorney fees and costs. \n\n25. WAIVER OF JURY TRIAL: NAS AND CUSTOMER WAIVE TRIAL BY JURY IN ANY JUDICIAL PROCEEDING TO WHICH THEY ARE PARTIES INVOLVING, DIRECTLY OR INDIRECTLY, ANY MATTER ARISING OUT OF OR RELATING TO THIS AGREEMENT. (Signatures on following page) IN WITNESS WHEREOF, NAS and CUSTOMER have caused their respective duly authorized representatives to execute this Agreement as of the day and year first above written. NATIONAL AERO STANDS, LLC CUSTOMER NAME """,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Column(
                                  //       children: [
                                  //         Text(
                                  //           """ By:""",
                                  //           style: TextStyle(fontSize: 12),
                                  //         )
                                  //       ],
                                  //     ),
                                  //     Column(
                                  //       children: [
                                  //         blank(
                                  //           widt: 100,
                                  //         )
                                  //       ],
                                  //     )
                                  //   ],
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Column(
                                  //       children: [
                                  //         Text(
                                  //           """ By:""",
                                  //           style: TextStyle(fontSize: 12),
                                  //         )
                                  //       ],
                                  //     ),
                                  //     Column(
                                  //       children: [
                                  //         blank(
                                  //           widt: 100,
                                  //           kontroller: signature_1,
                                  //         )
                                  //       ],
                                  //     )
                                  //   ],
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Column(
                                  //       children: [
                                  //         Text(
                                  //           """ Name:""",
                                  //           style: TextStyle(fontSize: 12),
                                  //         )
                                  //       ],
                                  //     ),
                                  //     Column(
                                  //       children: [
                                  //         blank(
                                  //           widt: 100,
                                  //           kontroller: signature_2,
                                  //         )
                                  //       ],
                                  //     )
                                  //   ],
                                  // ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              """ Customer Signature:""",
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        ),
                                        // Column(
                                        //   children: [
                                        //     InkWell(
                                        //         onTap: () {

                                        //         },
                                        //         child: Icon(Icons.upload))
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _getFromGallery();
                                    },
                                    child: Container(
                                      width: res_width * 0.6,
                                      decoration: BoxDecoration(
                                          color: Color(0xff85714e),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Center(
                                          child: Text(
                                            fileName != null
                                                ? fileName.toString()
                                                : 'Upload Signature',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   child: imageFile == null
                                  //       ? ClipRRect(
                                  //           borderRadius:
                                  //               BorderRadius.circular(0),
                                  //           child: CachedNetworkImage(
                                  //             height: 100,
                                  //             width: 100,
                                  //             imageUrl: '',
                                  //             //usercontroller.user.propic.toString(),
                                  //             errorWidget:
                                  //                 (context, url, error) {
                                  //               return Container(
                                  //                 height: 50,
                                  //                 width: 50,
                                  //                 decoration: BoxDecoration(
                                  //                   color: Colors.grey,
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           0),
                                  //                 ),
                                  //                 child: Center(
                                  //                     child: Icon(
                                  //                   Icons.image,
                                  //                   color: Colors.black,
                                  //                 )),
                                  //               );
                                  //             },
                                  //           ),
                                  //         )
                                  //       // CircleAvatar(
                                  //       //     backgroundColor: Colors.transparent,
                                  //       //     radius: 50,
                                  //       //     backgroundImage: NetworkImage(
                                  //       //         usercontroller.user.propic.toString()),
                                  //       //   )
                                  //       : Container(
                                  //           height: 100,
                                  //           width: 100,
                                  //           child: CircleAvatar(
                                  //             backgroundColor:
                                  //                 Colors.transparent,
                                  //             radius: 50,
                                  //             backgroundImage:
                                  //                 FileImage(imageFile!),
                                  //           ),
                                  //         ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: res_height * 0.01,
                        ),
                        // GestureDetector(
                        //   onTap: () async {
                        //     if (formKey.currentState!.validate()) {
                        //       print("registered_agent.text" +
                        //           registered_agent.text);
                        //       print("signature_1.text" + signature_1.text);
                        //       print("signature_2.text" + signature_2.text);
                        //       global_registered_agent = registered_agent.text;
                        //       global_signature_1 = signature_1.text;
                        //       global_signature_2 = signature_2.text;
                        //       var sendData = {
                        //         'day': global_day,
                        //         'month': global_month,
                        //         'customer_name': global_customer_name,
                        //         'customer_location': global_customer_location,
                        //         'stand_manufacturer': global_stand_manufacturer,
                        //         'stand_color': global_stand_color,
                        //         'stand_type': global_stand_type,
                        //         'stand_serial_number':
                        //             global_stand_serial_number,
                        //         'stand_quantity': global_stand_quantity,
                        //         'delivery_location': global_delivery_location,
                        //         'delivery_date': global_delivery_date,
                        //         'daily_rent': global_daily_rent,
                        //         'replacement_value': global_replacement_value,
                        //         'security_deposit': global_security_deposit,
                        //         'guarantor': global_guarantor,
                        //         'registered_agent': registered_agent.text,
                        //         'signature_1': signature_1.text,
                        //         'signature_2': signature_2.text,
                        //         'tax_file': placeOrderData_tax_file,
                        //         'quote_id': placeOrderData_quote_id,
                        //         'fileType': placeOrderData_fileType
                        //       };
                        //       var res_data = await ApiService()
                        //           .placeOrder(context, sendData);

                        //       print(
                        //           "Lease Form RESPONSE" + res_data.toString());
                        //       if (res_data['status'] == true) {
                        //         Get.to(PaymentScreen());
                        //       } else {
                        //         Get.snackbar(
                        //           'Error',
                        //           "Invalid Email Address",
                        //           snackPosition: SnackPosition.BOTTOM,
                        //           backgroundColor: Colors.white,
                        //         );
                        //       }

                        //       Get.to(PaymentScreen());
                        //     }
                        //     // Get.to(lease_form7());
                        //   },
                        //   child: Container(
                        //     width: res_width * 0.85,
                        //     decoration: BoxDecoration(
                        //         color: Color(0xff85714e),
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(7))),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(13.0),
                        //       child: Center(
                        //         child: Text(
                        //           'Pay via Paypal',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 17),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: res_height * 0.01,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              if (signaturetype == null) {
                                Get.snackbar(
                                    'Error', 'Please Upload Signature');
                              } else {
                                Get.to(lease_form8());
                              }
                            }
                            // Get.to(lease_form7());
                          },
                          child: Container(
                            width: res_width * 0.85,
                            decoration: BoxDecoration(
                                color: Color(0xff85714e),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
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
                        // GestureDetector(
                        //   onTap: () async {
                        //     if (formKey.currentState!.validate()) {
                        //       print("registered_agent.text" +
                        //           registered_agent.text);
                        //       print("signature_1.text" + signature_1.text);
                        //       print("signature_2.text" + signature_2.text);
                        //       global_registered_agent = registered_agent.text;
                        //       global_signature_1 = signature_1.text;
                        //       global_signature_2 = signature_2.text;
                        //       var sendData = {
                        //         'day': global_day,
                        //         'month': global_month,
                        //         'customer_name': global_customer_name,
                        //         'customer_location': global_customer_location,
                        //         'stand_manufacturer': global_stand_manufacturer,
                        //         'stand_color': global_stand_color,
                        //         'stand_type': global_stand_type,
                        //         'stand_serial_number':
                        //             global_stand_serial_number,
                        //         'stand_quantity': global_stand_quantity,
                        //         'delivery_location': global_delivery_location,
                        //         'delivery_date': global_delivery_date,
                        //         'daily_rent': global_daily_rent,
                        //         'replacement_value': global_replacement_value,
                        //         'security_deposit': global_security_deposit,
                        //         'guarantor': global_guarantor,
                        //         'registered_agent': registered_agent.text,
                        //         'signature_1': signature_1.text,
                        //         'signature_2': signature_2.text,
                        //         'tax_file': placeOrderData_tax_file,
                        //         'quote_id': placeOrderData_quote_id,
                        //         'fileType': placeOrderData_fileType
                        //       };
                        //       Get.to(WireTransfer());
                        //     }

                        //     // Get.to(PaymentScreen());
                        //     // Get.to(lease_form7());
                        //   },
                        //   child: Container(
                        //     width: res_width * 0.85,
                        //     decoration: BoxDecoration(
                        //         color: Color(0xff85714e),
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(7))),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(13.0),
                        //       child: Center(
                        //         child: Text(
                        //           'Pay via Wire Transfer',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 17),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
}

class blank extends StatelessWidget {
  TextEditingController? kontroller;
  double? widt;
  blank({
    this.widt,
    this.kontroller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: kontroller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required';
        }
        return null;
      },
      decoration: InputDecoration(
        isCollapsed: true,
        // contentPadding: EdgeInsets.symmetric(vertical: 0),
        constraints: BoxConstraints(maxWidth: widt!, minWidth: 10),
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
    );
  }
}
