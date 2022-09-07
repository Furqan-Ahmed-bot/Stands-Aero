import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stande_aero/helper/colors.dart';
import 'package:http/http.dart' as http;
import '../../helper/global.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController photo = TextEditingController();
  String apiGlobal = "https://qtdev.the4loop.com/api/";
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    _getFromGallery() async {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 2500,
        maxHeight: 2500,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    }

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
              'Profile',
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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-46.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 18.0),
              child: Column(
                children: [
                  // Container(
                  //     width: res_width * 0.375,
                  //     // child: Image.asset(
                  //     //   'assets/slicing/Untitled-51.png',
                  //     //   height: 150,
                  //     )),
                  // backgroundColor: Colors.red,

                  // Positioned(
                  //   bottom: -10,
                  //   left: 80,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.add_a_photo),
                  //   ),
                  // ),
                  Stack(
                    children: [
                      Container(
                        child: imageFile == null
                            ? CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 75,
                                backgroundImage: AssetImage(
                                    'assets/slicing/Untitled-31.png'),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 75,
                                backgroundImage: FileImage(imageFile!),
                              ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 25,
                        child: CircleAvatar(
                          radius: 18,
                          child: IconButton(
                            onPressed: () {
                              _getFromGallery();
                            },
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  profile_textfield(
                    controller: name,
                    hed: "Name",
                    labelText: "John Doe",
                  ),
                  profile_textfield(
                    controller: email,
                    hed: "Email",
                    labelText: "John@gmail.com",
                  ),
                  profile_textfield(
                    controller: country,
                    hed: "Country",
                    labelText: "Country",
                  ),
                  profile_textfield(
                    controller: city,
                    hed: "City",
                    labelText: "City",
                  ),
                  profile_textfield(
                    controller: phone,
                    hed: "Phone Number",
                    labelText: "Phone Number",
                  ),
                  profile_textfield(
                    hed: "Description",
                    labelText:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    maxLines: 6,
                  ),
                  SizedBox(
                    height: res_height * 0.0125,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: res_width * 0.9,
                      decoration: BoxDecoration(
                          color: Color(0xffaf8a39),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Center(
                          child: Text(
                            'Safe',
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
                    height: res_height * 0.0125,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CFA() async {
    final uri = Uri.parse('https://qtdev.the4loop.com/api/user/profile/update');

    print(uri);

    var sendData = {
      'name': name.text,
      'email': email.text,
      'phone': phone.text,
      'country': country.text,
      'city': city.text,
      'photo': imageFile,
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
      // Get.to(() => credit_from2());
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

class profile_textfield extends StatelessWidget {
  var labelText, hed;

  var maxLines;

  profile_textfield({
    TextEditingController? controller,
    Key? key,
    this.labelText,
    this.hed,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    var controller;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$hed",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: res_height * 0.01,
        ),
        Card(
          elevation: 8,
          child: Container(
            // height: 50,
            // padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white)),
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
          height: res_height * 0.01,
        ),
      ],
    );
  }
}
