import 'dart:async';

import 'package:StandsAero/helper/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:StandsAero/helper/global.dart';
import 'package:intl/intl.dart';
import 'package:StandsAero/services/remote_services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatcontroller = TextEditingController();
  dynamic chat_historyvar;
  bool stopTimer = false;
  ScrollController scrollController = new ScrollController();

  // final ScrollController _controller = ScrollController();
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        get_messages_previous();
      });
    });
    if (stopTimer == true || counter == 0) {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        get_messages_previous1();
      });
    }

    super.initState();
  }

  late int lengthOfChat;
  Future<dynamic> get_messages_previous1() async {
    chat_historyvar = await ApiService().get_messages(context);
    if (lengthOfChat < chat_historyvar['data']['0'].length) {
      print("previous messages length" +
          chat_historyvar['data']['0'].length.toString());
      if (mounted) {
        setState(() {});
      }

      lengthOfChat = chat_historyvar['data']['0'].length;
    }

    // _scrollDown();
  }

  Future<void> get_messages_previous() async {
    chat_historyvar = await ApiService().get_messages(context);
    lengthOfChat = chat_historyvar['data']['0'].length;
    // _scrollDown();
  }

//   void _scrollDown() {
//     log("chat_historyvar['messages'].length " + chat_historyvar['messages'].length.toString());
//   _controller.jumpTo(_controller.position.maxScrollExtent);
// }
  int counter = 0;
  Timer? timer;
  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-62.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 350,
                height: 60,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 60,
                      child: TextFormField(
                        controller: chatcontroller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 15, left: 20),
                          hintText: "Write message...",
                          suffixIcon: InkWell(
                            onTap: () async {
                              if (chatcontroller.text.isNotEmpty) {
                                var temporaryMsgId = 'temp_' + userid;
                                var sendData = {
                                  'id': 1,
                                  'type': 'user',
                                  'message': chatcontroller.text,
                                  'temporaryMsgId': temporaryMsgId
                                };
                                ApiService().send_messages(context, sendData);

                                setState(() {
                                  chatcontroller.clear();
                                });
                              } else {
                                Get.snackbar(
                                  'Error',
                                  "Please write your message",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.white,
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.asset(
                                'assets/slicing/Untitled-72.png',
                                scale: 4,
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xffDCDFE2),
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              stopTimer = true;
              deactivate();
              timer!.cancel();
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
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              FutureBuilder<dynamic>(
                  future: get_messages_previous1(),
                  builder: (context, snapshot) {
                    print("chat_historyvar['messages'].lengt" +
                        counter.toString());
                    if (snapshot.connectionState == ConnectionState.done ||
                        counter > 0) {
                      counter++;
                      return ListView(
                        shrinkWrap: true,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: res_height * 0.8,
                            child: ListView(
                              shrinkWrap: true,
                              reverse: true,
                              children: [
                                ListView.builder(
                                    // dragStartBehavior: DragStartBehavior.start,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    // itemCount: quotations_data['data'].length,
                                    itemCount:
                                        chat_historyvar['data']['0'].length,
                                    itemBuilder: (context, index) {
                                      return chat_historyvar['data']['0'][index]
                                                  ['sent_user'] ==
                                              userid
                                          ? Align(
                                              alignment: Alignment.topRight,
                                              child: Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                                  Positioned(
                                                    // right: 0,
                                                    // top: MediaQuery.of(context).size.height * .035,
                                                    child: Image.asset(
                                                      "assets/slicing/lid.png",
                                                      scale: 35,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 13,
                                                                right: 13),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xff86714f),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10),
                                                            ),
                                                          ),
                                                          // width: res_width * 0.5,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth:
                                                                res_width *
                                                                    0.75,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(13.0),
                                                            child: Text(
                                                              chat_historyvar[
                                                                          'data']
                                                                      [
                                                                      '0'][index]
                                                                  ['message'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 6,
                                                                  right: 13),
                                                          child: Text(
                                                            DateFormat.jm()
                                                                .format(DateTime.parse(
                                                                    chat_historyvar['data']['0']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'created_at']))
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff6c6c6c)),
                                                          ))
                                                    ],
                                                  ),
                                                ],
                                              ))
                                          : Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                  Positioned(
                                                    // right: 0,
                                                    // top: MediaQuery.of(context).size.height * .035,
                                                    child: Image.asset(
                                                      "assets/slicing/admin-lid.png",
                                                      scale: 35,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 13,
                                                                left: 13),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10),
                                                            ),
                                                            // border: Border.all(
                                                            //   width: 3,
                                                            //   color: Colors.green,
                                                            //   style: BorderStyle.solid,
                                                            // ),
                                                          ),
                                                          width:
                                                              res_width * 0.75,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(13.0),
                                                            child: Text(
                                                              chat_historyvar[
                                                                          'data']
                                                                      [
                                                                      '0'][index]
                                                                  ['message'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 6,
                                                                  left: 13),
                                                          child: Text(
                                                            DateFormat.jm()
                                                                .format(DateTime.parse(
                                                                    chat_historyvar['data']['0']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'created_at']))
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ))
                                                    ],
                                                  ),
                                                ]);
                                    }),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       bottom: MediaQuery.of(context).viewInsets.bottom),
                          //   child: Container(
                          //     color: Colors.transparent.withOpacity(0.2),
                          //     child: Padding(
                          //       padding: EdgeInsets.only(
                          //           left: 13, right: 13, top: 10, bottom: 10),
                          //       child: TextField(
                          //         controller: chatcontroller,
                          //         decoration: new InputDecoration(
                          //           fillColor: Colors.white,
                          //           filled: true,
                          //           hintStyle: TextStyle(
                          //               fontSize: 16.0, color: Colors.grey),
                          //           focusedBorder: OutlineInputBorder(
                          //             borderSide:
                          //                 const BorderSide(color: Colors.white),
                          //           ),
                          //           border: new OutlineInputBorder(
                          //               borderSide: new BorderSide(
                          //             color: Colors.white,
                          //           )),
                          //           hintText: 'Write Message',
                          //           suffixIcon: Row(
                          //             mainAxisAlignment: MainAxisAlignment
                          //                 .spaceBetween, // added line
                          //             mainAxisSize: MainAxisSize.min, // added line

                          //             children: [
                          //               GestureDetector(
                          //                 behavior: HitTestBehavior.translucent,
                          //                 onTap: () async {
                          //                   if (chatcontroller.text.isNotEmpty) {
                          //                     var temporaryMsgId = 'temp_' + userid;
                          //                     var sendData = {
                          //                       'id': 1,
                          //                       'type': 'user',
                          //                       'message': chatcontroller.text,
                          //                       'temporaryMsgId': temporaryMsgId
                          //                     };
                          //                     ApiService()
                          //                         .send_messages(context, sendData);

                          //                     setState(() {
                          //                       chatcontroller.clear();
                          //                     });
                          //                   } else {
                          //                     Get.snackbar(
                          //                       'Error',
                          //                       "Please write your message",
                          //                       snackPosition: SnackPosition.TOP,
                          //                       backgroundColor: Colors.white,
                          //                     );
                          //                   }
                          //                 },
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.all(10.0),
                          //                   child: Icon(Icons.send),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      );
                    } else {
                      return spinkit;
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
