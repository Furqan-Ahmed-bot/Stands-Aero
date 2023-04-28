import 'package:StandsAero/controller/usercontroller.dart';
import 'package:StandsAero/helper/colors.dart';
import 'package:StandsAero/helper/data_storage.dart';
import 'package:StandsAero/screens/Profile/editprofile.dart';
import 'package:StandsAero/screens/home/drawer.dart';
import 'package:StandsAero/services/remote_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:StandsAero/screens/home/Profile/editprofile.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController description = TextEditingController();
  UserController userController = Get.put(UserController());
  // dynamic profileInfo;

  @override
  void initState() {
    profiledata();
    // Future.delayed(Duration.zero, () {
    //   setState(() {
    //     getProfileInfo();
    //   });
    // });

    super.initState();

    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     // animation.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     animation.forward();
    //   }
    // });
    // animation.forward();

    setInitValues();
  }

  setInitValues() {
    setState(() {
      name.text = userController.user.fullName.toString();
      email.text = userController.user.email.toString();
      phone.text = userController.user.phone.toString();
      country.text = userController.user.country.toString();
      city.text = userController.user.city.toString();
      description.text = userController.user.description.toString() == 'null'
          ? 'Enter your Description'
          : userController.user.description.toString();
    });
  }

  dynamic profiledetails;
  dynamic kycformdata;
  Future<void> profiledata() async {
    profiledetails = await ApiService().downloadLeaseForm();

    print("order_historyvar" + profiledetails['data'].toString());
    kycformdata = profiledetails['data']['credit_application_details'];

    print('KYC ${kycformdata}');
  }

  // Future<void> getProfileInfo() async {
  //   profileInfo = await ApiService().prof();

  //   log("profileInfo" + profileInfo.toString());

  //   setState(() {
  //     userController.addUser(
  //       UserModel(
  //         id: profileInfo['data']['id'],
  //         fullName: profileInfo['data']['full_name'],
  //         phone: profileInfo['data']['phone'],
  //         email: profileInfo['data']['email'],
  //         propic: profileInfo['data']['propic'],
  //         city: profileInfo['data']['city'],
  //         country: profileInfo['data']['country'],
  //         description: profileInfo['data']['description'],
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print(userController.user.fullName);

    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _key,
      drawer: NavDrawer(),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _key.currentState!.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                width: 25,
                child: Image.asset('assets/slicing/Untitled-44.png')),
          ),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Get.to(() => Editprofile());
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                  width: 25,
                  child: Image.asset('assets/slicing/Untitled-45.png')),
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
        height: double.infinity,
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
                  // userController.user.propic?.contains('1567655174profile.jpg')
                  // ?
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        height: 100,
                        width: 100,
                        imageUrl: userController.user.propic.toString(),
                        errorWidget: (context, url, error) {
                          return Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.image,
                              color: Colors.black,
                            )),
                          );
                        },
                      ),
                    ),
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.transparent,
                  //   radius: 60,
                  //   backgroundImage:
                  //       AssetImage('assets/slicing/Untitled-31.png'),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  profile_textfield(
                    controller: name,
                    hed: "Name",
                    labelText: userController.user.fullName,
                  ),
                  profile_textfield(
                    controller: email,
                    hed: "Email",
                    labelText: userController.user.email,
                  ),
                  // profile_textfield(
                  //   controller: country,
                  //   hed: "Country",
                  //   labelText: userController.user.country,
                  // ),
                  profile_textfield(
                    controller: city,
                    hed: "City",
                    labelText: userController.user.city,
                  ),
                  profile_textfield(
                    controller: phone,
                    hed: "Phone Number",
                    labelText: userController.user.phone,
                  ),
                  profile_textfield(
                    controller: description,
                    hed: "Description",
                    labelText: userController.user.description,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: res_height * 0.01,
                  ),
                  // Text('Helo'),
                  GestureDetector(
                    onTap: () async {
                      await DataStorage.getInstance.clearSession();
                      ApiService().logout(context);
                    },
                    child: Container(
                      width: res_width * 0.9,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // Color(0xffaf8a39),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Center(
                          child: Text(
                            'Logout',
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
                    height: res_height * 0.015,
                  ),
                  GestureDetector(
                    onTap: () {
                      ApiService().deleteAccount();
                    },
                    child: Container(
                      width: res_width * 0.9,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 238, 0, 0),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Center(
                          child: Text(
                            'Delete my account',
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
                    height: res_height * 0.030,
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
                readOnly: true,
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
