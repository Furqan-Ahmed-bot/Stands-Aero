import 'package:StandsAero/bottomcontroller.dart';
import 'package:StandsAero/helper/colors.dart';
import 'package:StandsAero/screens/List%20Quotes/quotes.dart';
import 'package:StandsAero/screens/Profile/profile.dart';
// import 'package:StandsAero/screens/home/Profile/profile.dart';
import 'package:StandsAero/screens/home/home.dart';
import 'package:StandsAero/screens/notifications/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bottomctrl = Get.put(BottomController());

  void _onItemTapped(int index) {
    bottomctrl.navBarChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: GetBuilder<BottomController>(
              builder: (_) => BottomNavigationBar(
                    backgroundColor: Color(0xff212330),
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: kPrimaryColor,
                    unselectedItemColor: Color.fromRGBO(158, 158, 158, 1),
                    currentIndex: bottomctrl.navigationBarIndexValue,
                    onTap: _onItemTapped,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          bottomctrl.navigationBarIndexValue == 0
                              ? AssetImage("assets/slicing/Untitled-15.png")
                              : AssetImage("assets/slicing/Untitled-15.png"),
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          bottomctrl.navigationBarIndexValue == 1
                              ? AssetImage("assets/slicing/Untitled-47.png")
                              : AssetImage("assets/slicing/Untitled-16.png"),
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          bottomctrl.navigationBarIndexValue == 2
                              ? AssetImage("assets/slicing/Untitled-53.png")
                              : AssetImage("assets/slicing/Untitled-48.png"),
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          bottomctrl.navigationBarIndexValue == 3
                              ? AssetImage("assets/slicing/Untitled-35.png")
                              : AssetImage(
                                  "assets/slicing/Untitled-50.png",
                                ),
                        ),
                        label: '',
                      ),
                    ],
                  )),
          body: Container(
            child: GetBuilder<BottomController>(
                builder: (_) => bottomctrl.navigationBarIndexValue == 0
                    ? HomeScreen()
                    : bottomctrl.navigationBarIndexValue == 1
                        ? NotificationScreen()
                        : bottomctrl.navigationBarIndexValue == 2
                            ? quotes()
                            : bottomctrl.navigationBarIndexValue == 3
                                ? profile()
                                : Container()),
          ),
        ),
      ),
    );
  }
}
