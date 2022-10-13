import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stande_aero/contrloller/usercontroller.dart';
import 'package:stande_aero/helper/colors.dart';
import 'package:http/http.dart' as http;
import 'package:stande_aero/screens/Profile/profile.dart';
import '../../helper/global.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/remote_services.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final usercontroller = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController desc = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  
  // String apiGlobal = "https://standsaero.jumppace.com/api/";
  File? imageFile;
  
   _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 2000,
      maxHeight: 2000,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print("imageFile data"+imageFile.toString());
      });
      // imageProvider.addImage(imageFile);
      // imagesList[i] = imageFile;
    }
  }

  @override
  Widget build(BuildContext context) {
    log(usercontroller.user.id.toString());

    name.text = usercontroller.user.fullName.toString();
    email.text = usercontroller.user.email.toString();

    phone.text = usercontroller.user.phone.toString();
    country.text = usercontroller.user.country.toString();
    city.text = usercontroller.user.city.toString();
    desc.text = usercontroller.user.desc.toString();
    // email.text = usercontroller.user.email.toString();
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
            // Navigator.pop(context);
            Get.back();
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
            child: Form(
            key: _formKey,
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
                      labelText: usercontroller.user.fullName,
                    ),
                    profile_textfield(
                      controller: email,
                      hed: "Email",
                      labelText: usercontroller.user.email,
                    ),
                    profile_textfield(
                      controller: country,
                      hed: "Country",
                      labelText: usercontroller.user.country,
                    ),
                    profile_textfield(
                      controller: city,
                      hed: "City",
                      labelText: usercontroller.user.city,
                    ),
                    profile_textfield(
                      controller: phone,
                      hed: "Phone Number",
                      labelText: usercontroller.user.phone,
                    ),
                    profile_textfield(
                      controller: desc,
                      hed: "Description",
                      labelText: usercontroller.user.desc,
                      maxLines: 6,
                    ),
                    SizedBox(
                      height: res_height * 0.0125,
                    ),
                    GestureDetector(
                      onTap: () {
                        // CFA1();
                        if (_formKey.currentState!.validate()) {
                            if (name != -1) {
                             
                                var data = {
                                  "propic": imageFile,
                                  "name": name.text,
                                  "email": email.text,
                                  "country": country.text,
                                  "city": city.text,
                                  "phone": phone.text,
                                  "desc":desc.text,
                                  // "image": ""
                                };
                                ApiService().updateProfile(context, data);
                             
                              }
                            }
            
            
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
      ),
    );
  }

//   CFA1() async {
//     final uri = Uri.parse('${apiGlobal}user/profile/update');

//     print(uri);

//     // var sendData = {
//     //   // 'id': userid,
//     //   'name': name.text,
//     //   'email': email.text,
//     //   'phone': phone.text,
//     //   'country': country.text,
//     //   'city': city.text,
//     //   'photo': "abc.jpg"
//     //   // 'desc': desc.text,
//     // };

//     var request = http.MultipartRequest('POST', uri);
//     request.fields['user_id'] = userid;
//     request.fields['name'] = name.text;
//     request.fields['email'] = email.text;
//     request.fields['phone'] = phone.text;
//     request.fields['country'] = country.text;
//     request.fields['city'] = city.text;
//     request.fields['desc'] = desc.text;
//     if (data['image'] != null) {
//       var multipartFile = await http.MultipartFile.fromPath(
//           'image', data['image']!.path,
//           filename: data['image'].path.split('/').last,
//           contentType: MediaType("image", "png"));
//       request.files.add(multipartFile);
//     }


//     request.fields['photo'] = data['userAbout'];
    



//     print(sendData);
//     var jsonBody = json.encode(sendData);
//     print(sendData.toString());

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
//       Get.to(() => profile());
//     } else
//       Get.snackbar(
//         'Error',
//         'Wrong Credentials',
//         animationDuration: Duration(seconds: 2),
//         snackPosition: SnackPosition.BOTTOM,
//       );

//     return res_data;
//   }
}

class profile_textfield extends StatelessWidget {
  var labelText, hed;
  TextEditingController? controller;
  var maxLines;

  profile_textfield({
    this.controller,
    Key? key,
    this.labelText,
    this.hed,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    //  TextEditingController controller =profile_textfield.control ;
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
            child: TextFormField(
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
