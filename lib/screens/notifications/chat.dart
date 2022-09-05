import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stande_aero/screens/mainhome.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
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
                'Chat',
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/slicing/Untitled-1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 13, left: 13),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          // topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        // border: Border.all(
                        //   width: 3,
                        //   color: Colors.green,
                        //   style: BorderStyle.solid,
                        // ),
                      ),
                      width: res_width * 0.75,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet consecteturadipiscing elit integer, sociis quisque.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 6, left: 13),
                      child: Text(
                        '3:00pm',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 13, right: 13),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                            // topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          // border: Border.all(
                          //   width: 3,
                          //   color: Colors.green,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        width: res_width * 0.75,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet consecteturadipiscing elit integer, sociis quisque.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 6, right: 13),
                        child: Text(
                          '3:00pm',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              Spacer(),
              Container(
                color: Colors.transparent.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 13, right: 13, top: 13, bottom: 25),
                  child: Container(
                    child: TextField(
                      controller: chatcontroller,
                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle:
                            TextStyle(fontSize: 16.0, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                          color: Colors.white,
                        )),
                        hintText: 'Write Message',
                        suffixIcon: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // added line
                          mainAxisSize: MainAxisSize.min, // added line

                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  chatcontroller.clear();
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.send),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
