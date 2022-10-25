import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/services/remote_services.dart';
import 'package:stande_aero/contrloller/usercontroller.dart';
import 'package:stande_aero/helper/colors.dart';
import 'package:stande_aero/helper/global.dart';
import 'package:stande_aero/screens/Profile/editprofile.dart';
import 'package:stande_aero/screens/auth/mainlogin.dart';
import 'package:stande_aero/screens/home/drawer.dart';

import '../../helper/model.dart';

// import 'package:stande_aero/screens/home/Profile/editprofile.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;
  UserController userController = Get.put(UserController());
  dynamic profileInfo;
  // UserController userController = UserController();
  @override
  void initState() {
    // setState(() {
    //   prof();
    // });
    Future.delayed(Duration.zero, () {
      setState(() {
        getProfileInfo();
      });
    });
    
    super.initState();
    
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  Future<void> getProfileInfo() async{
      profileInfo =await ApiService().prof();

      log("profileInfo"+profileInfo.toString());
      setState(() {
        userController.addUser(
        UserModel(
          id: profileInfo['data']['id'],
          fullName: profileInfo['data']['full_name'],
          phone: profileInfo['data']['phone'],
          email: profileInfo['data']['email'],
          propic: profileInfo['data']['propic'],
          city: profileInfo['data']['city'],
          country: profileInfo['data']['country'],
          desc: profileInfo['data']['desc'],
        ),
      );
      });

  }

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
      body: FadeTransition(
        opacity: _fadeInFadeOut,
        child: Container(
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
              child: Column(
                children: [
                  Container(
                    width: res_width * 0.375,
                    child: Image.asset(
                      'assets/slicing/Untitled-31.png',
                      height: 150,
                    ),
                  ),
                  profile_text(text: userController.user.fullName),
                  profile_text(text: userController.user.email),
                  profile_text(text: userController.user.country),
                  profile_text(text: userController.user.city),
                  profile_text(text: userController.user.phone),
                  profile_text(text: userController.user.desc),
                  SizedBox(
                    height: res_height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      ApiService().logout();
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  
}



class profile_text extends StatelessWidget {
  var text;

  profile_text({Key? key, this.text}) : super(key: key);

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
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "$text",
                style: TextStyle(fontSize: 16),
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
