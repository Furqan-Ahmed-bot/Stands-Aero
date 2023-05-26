// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math' as math;
import '../../helper/colors.dart';
import 'audiocalling.dart';
import 'callpage.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole? _role = ClientRole.Broadcaster;

  @override
  void initState() {
    [Permission.microphone].request();
    [Permission.camera].request();
    // getRtCToken();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  final String localUserID = math.Random().nextInt(10000).toString();

  dynamic rtcToken = '';
  dynamic channel;
  // void getRtCToken() async {
  //   String Url =
  //       'https://standsaero-merger.jumppace.com/nsa/api/user/DriectCall?type=video';
  //   var response = await http.get(Uri.parse(Url), headers: globalHeaders);
  //   if (response.statusCode == 200) {
  //     var res = response.body;
  //     dynamic data = json.decode(res);
  //     rtcToken = data;
  //     print('RTC Token ${rtcToken['pusherData']['webToken']}');
  //     channel = rtcToken['pusherData']['channel'];
  //     webtoken = rtcToken['pusherData']['webToken'];
  //     print(globaltoken);
  //   } else {
  //     print('Status Code ${response.statusCode}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Calling'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 400,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        Get.to(AudioCall(
                          channelID: '',
                          userID: '',
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              'Audio Call',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          border:
                              Border.all(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 50,
                        width: 150,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        // FlutterRingtonePlayer.playNotification();

                        Get.to(
                          CallPage(
                            channelName: '117supportCaller',

                            role: _role,
                            // RtcToken: rtcToken['pusherData']['webToken'],
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.video_call,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              'Video Call',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          border:
                              Border.all(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 50,
                        width: 150,
                      ),
                    ),
                  ),
                ],
              ),

              // Row(
              //   children: <Widget>[
              //     Expanded(
              //       child: TextField(
              //         controller: _channelController,
              //         decoration: InputDecoration(
              //           errorText:
              //               _validateError ? 'Channel name is mandatory' : null,
              //           border: UnderlineInputBorder(
              //             borderSide: BorderSide(width: 1),
              //           ),
              //           hintText: 'Channel name',
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // Column(
              //   children: [
              //     ListTile(
              //       title: Text(ClientRole.Broadcaster.toString()),
              //       leading: Radio(
              //         value: ClientRole.Broadcaster,
              //         groupValue: _role,
              //         onChanged: (ClientRole? value) {
              //           setState(() {
              //             _role = value;
              //           });
              //         },
              //       ),
              //     ),
              //     ListTile(
              //       title: Text(ClientRole.Audience.toString()),
              //       leading: Radio(
              //         value: ClientRole.Audience,
              //         groupValue: _role,
              //         onChanged: (ClientRole? value) {
              //           setState(() {
              //             _role = value;
              //           });
              //         },
              //       ),
              //     )
              //   ],
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 20),
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //         child: ElevatedButton(
              //           onPressed: onJoin,
              //           child: Text('Join'),
              //           style: ButtonStyle(
              //               backgroundColor:
              //                   MaterialStateProperty.all(Colors.blueAccent),
              //               foregroundColor:
              //                   MaterialStateProperty.all(Colors.white)),
              //         ),
              //       ),
              //       // Expanded(
              //       //   child: RaisedButton(
              //       //     onPressed: onJoin,
              //       //     child: Text('Join'),
              //       //     color: Colors.blueAccent,
              //       //     textColor: Colors.white,
              //       //   ),
              //       // )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              //  AVCalling(
              //       webtoken: rtcToken['pusherData']['webToken'],
              //     )
              // AgoraCallPage(
              //   channelName: 'abc',
              // )

              // AudioCalling()
              //     AudioCall(
              //   userID: 117,
              //   webtoken: rtcToken['pusherData']['webToken'],
              //   channelID: '',
              // ),

              CallPage(
            channelName: '117supportCaller',
            role: _role,
            // RtcToken: rtcToken['pusherData']['webToken'],
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
