import 'dart:developer';
import 'dart:io';

import 'package:StandsAero/controller/usercontroller.dart';
import 'package:StandsAero/widgets/custom_menu_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/remote_services.dart';
import '../../widgets/remove_focus_widget.dart';

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
  TextEditingController description = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // String apiGlobal = "https://standsaero.jumppace.com/api/";
  File? imageFile;
  late String _selectedValue1;
  _getFromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 2000, maxHeight: 2000);

    if (xFile != null) {
      setState(() {
        imageFile = File(xFile.path);
        print("imageFile data" + imageFile.toString());
      });
      // imageProvider.addImage(imageFile);
      // imagesList[i] = imageFile;
    }
  }

  @override
  void initState() {
    super.initState();

    name.text = usercontroller.user.fullName.toString();
    email.text = usercontroller.user.email.toString();

    phone.text = usercontroller.user.phone.toString();
    country.text = usercontroller.user.country.toString();
    city.text = usercontroller.user.city.toString();
    _selectedValue1 = usercontroller.user.city.toString();
    description.text = usercontroller.user.description.toString();

    log('settingvalue: $email');
    log('settingvalue2: $phone');
    log('settingvalue1: $_selectedValue1');
  }

  @override
  Widget build(BuildContext context) {
    log(usercontroller.user.id.toString());

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
      body: RemoveFocusWidget(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/slicing/Untitled-46.jpg"),
              fit: BoxFit.fill,
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
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child: CachedNetworkImage(
                                      height: 150,
                                      width: 150,
                                      imageUrl:
                                          usercontroller.user.propic.toString(),
                                      errorWidget: (context, url, error) {
                                        return Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Center(
                                              child: Icon(
                                            Icons.person,
                                            color: Colors.black,
                                          )),
                                        );
                                      },
                                    ),
                                  )
                                // CircleAvatar(
                                //     backgroundColor: Colors.transparent,
                                //     radius: 50,
                                //     backgroundImage: NetworkImage(
                                //         usercontroller.user.propic.toString()),
                                //   )
                                : CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 50,
                                    backgroundImage: FileImage(imageFile!),
                                  ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
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
                        readOnly: false,
                        controller: name,
                        hed: "Name",
                        labelText: usercontroller.user.fullName,
                      ),
                      profile_textfield(
                        readOnly: true,
                        controller: email,
                        hed: "Email",
                        labelText: usercontroller.user.email,
                      ),
                      // profile_textfield(
                      //   controller: country,
                      //   hed: "Country",
                      //   labelText: usercontroller.user.country,
                      // ),
                      SizedBox(
                        height: res_height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          CustomMenuWidget.showBottomSheet(context, [
                            CustomMenuTile(
                                onTapped: () {
                                  setState(() {
                                    _selectedValue1 = 'New York';
                                    city.text = 'New York';
                                  });
                                  Navigator.pop(context);
                                },
                                text: 'New York'),
                            CustomMenuTile(
                                onTapped: () {
                                  setState(() {
                                    _selectedValue1 = 'New Jersey';
                                    city.text = 'New Jersey';
                                  });
                                  Navigator.pop(context);
                                },
                                text: 'New Jersey'),
                          ]);
                        },
                        child: Container(
                            width: Get.width * 0.9,
                            height: 60,
                            // alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 25, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selectedValue1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            )
                            // child:
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButtonFormField<String>(
                            //       decoration: InputDecoration(
                            //           fillColor: Colors.white,
                            //           contentPadding: EdgeInsets.all(12),
                            //           isCollapsed: true,
                            //           enabledBorder: InputBorder.none),
                            //       hint: Text(
                            //         'City',
                            //         style:
                            //             TextStyle(fontSize: 18, color: Colors.black),
                            //       ),
                            //       isExpanded: true,
                            //       value: _selectedValue1,
                            //       items: <String>['New York', 'New Jersey', 'Toronto']
                            //           .map((String value) {
                            //         return DropdownMenuItem<String>(
                            //           value: value,
                            //           child: Text(value),
                            //         );
                            //       }).toList(),
                            //       onChanged: (value) {
                            //         setState(() {
                            //           _selectedValue1 = value!;
                            //           city.text = _selectedValue1;
                            //           print("selected value" +
                            //               _selectedValue1.toString());
                            //           print("selected city" + city.text);
                            //           // city = _selectedValue1 as TextEditingController;
                            //         });
                            //       },
                            //       style: TextStyle(color: Colors.grey),
                            //       // icon: Icon(
                            //       //   Icons.arrow_forward_ios,
                            //       //   color: kPrimaryColor,
                            //       //   size: 20,
                            //       // ),
                            //       // iconSize: 20,
                            //       validator: (text) {
                            //         if (text == null ||
                            //             text.isEmpty ||
                            //             text.length < 5) {
                            //           return 'Select City !';
                            //         }
                            //         return null;
                            //       }),
                            // ),
                            ),
                      ),
                      // profile_textfield(
                      //   controller: city,
                      //   hed: "City",
                      //
                      //labelText: usercontroller.user.city,
                      // ),
                      SizedBox(
                        height: res_height * 0.01,
                      ),
                      profile_textfield(
                        readOnly: false,
                        controller: phone,
                        hed: "Phone Number",
                        labelText: usercontroller.user.phone,
                      ),
                      profile_textfield(
                        readOnly: false,
                        controller: description,
                        hed: "Description",
                        labelText: usercontroller.user.description,
                        maxLines: 6,
                      ),
                      SizedBox(
                        height: res_height * 0.0125,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // CFA1();
                          if (_formKey.currentState!.validate()) {
                            if (name != -1) {
                              var data = {
                                "photo": imageFile,
                                "name": name.text,
                                "email": email.text,
                                "country": 'USA',
                                "city": city.text,
                                "phone": phone.text,
                                "description": description.text,
                                // "image": ""
                              };
                              var res_data = await ApiService()
                                  .updateProfile(context, data);
                              if (res_data['status'] == true) {
                                Navigator.pop(context);
                              }
                            }
                          }
                        },
                        child: Container(
                          width: res_width * 0.9,
                          decoration: BoxDecoration(
                              color: Color(0xffaf8a39),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Center(
                              child: Text(
                                'Save',
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
  bool readOnly;

  profile_textfield(
      {this.controller,
      Key? key,
      this.labelText,
      this.hed,
      this.maxLines,
      required this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    //  TextEditingController controller =profile_textfield.control ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "$hed",
        //   style: TextStyle(color: Colors.black, fontSize: 15),
        // ),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
                maxLines: maxLines,
                readOnly: readOnly,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "$labelText",
                    labelText: hed,
                    contentPadding: EdgeInsets.only(
                        left: 10, top: maxLines != null ? 10 : 0)),
                // controller: controller,
              ),
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
