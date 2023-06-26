import 'dart:async';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';

import '../../services/remote_services.dart';

const appId = "9ced0cd277e14049843bd7475fbcf583";
const token =
    "0069ced0cd277e14049843bd7475fbcf583IAB80IVASUlAV9IDyqnxKhPzpcYyBdb4YlxM8cqI/dxVWDB/3cnSY0iIIgCkdk0oa9dcZAQAAQD7k1tkAgD7k1tkAwD7k1tkBAD7k1tk";

class IncomingAudioCall extends StatefulWidget {
  final incomingaudiocalltoken;
  final incomingaudiochannelname;
  final receiveruserid;

  /// non-modifiable client role of the page
  final ClientRole? role;
  // final webtoken;

  IncomingAudioCall(
      {Key? key,
      this.incomingaudiocalltoken,
      this.incomingaudiochannelname,
      this.receiveruserid,
      this.role})
      : super(key: key);

  @override
  _IncomingAudioCallState createState() => _IncomingAudioCallState();
}

class _IncomingAudioCallState extends State<IncomingAudioCall> {
  late RtcEngine _engine;

  bool muted = false;
  int? _remoteUid;
  bool _speakerEnabled = false;
  bool _isScreenOn = true;
  Stopwatch _stopwatch = Stopwatch();
  ClientRole? _role = ClientRole.Broadcaster;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    await [Permission.microphone].request();
    _engine = await RtcEngine.create(appId);
    await _engine.enableAudio();
    await _engine.joinChannel(widget.incomingaudiocalltoken,
        widget.incomingaudiochannelname, null, widget.receiveruserid);
    _engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
      print("Local User $uid joined");
    }, userJoined: (int uid, int elapsed) {
      print("Remote user $uid joined");

      setState(() {
        _remoteUid = uid;
        _stopwatch.start();
      });
    }, userOffline: (int uid, UserOfflineReason reason) {
      print("Remote user $uid left channel");
      setState(() {
        _remoteUid = null;
      });
      Get.back();
      Get.back();
    }));
  }

  void cancelCall() async {
    dynamic response;
    response = await ApiService().cancelAudioVideoCalling();
  }

  Future<void> endCall() async {
    Get.back();
    await _engine.leaveChannel();
    await _engine.destroy();
    Navigator.pop(context);
  }

  Future<void> muteAudio() async {
    await _engine.muteLocalAudioStream(!muted);
    setState(() {
      muted = !muted;
    });
  }

  void _toggleSpeakerEnabled() {
    setState(() {
      _speakerEnabled = !_speakerEnabled;
    });
    _engine.setEnableSpeakerphone(_speakerEnabled);
  }

  @override
  void dispose() {
    _engine.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Audiooooooo  ${widget.receiveruserid}');
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: res_width * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/slicing/Untitled-5.jpg"),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text("CSR"),
            Text(
              _remoteUid == null ? "Connecting..." : "In Call",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Spacer(),
            Container(
              width: res_width * 1,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(muted ? Icons.mic_off : Icons.mic),
                        onPressed: () => muteAudio(),
                      )),
                  InkWell(
                    onTap: () {
                      ApiService().cancelAudioVideoCalling();
                      endCall();
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Icon(
                        Icons.call_end,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                          _speakerEnabled ? Icons.volume_up : Icons.volume_off),
                      onPressed: _toggleSpeakerEnabled,
                    ),

                    //  Icon(
                    //   Icons.,
                    //   color: Colors.black,
                    // ),
                  ),
                  // Container(
                  //   width: 70,
                  //   height: 70,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.white,
                  //   ),
                  //   child: IconButton(
                  //       icon: Icon(Icons.video_call),
                  //       onPressed: () async {
                  //         dynamic res =
                  //             await ApiService().cancelAudioVideoCalling();

                  //         if (res['status'] == true) {
                  //           Future.delayed(
                  //               const Duration(seconds: 2),
                  //               () => Get.to(
                  //                     CallPage(
                  //                       channelName: '117supportCaller',
                  //                       role: _role,

                  //                       // RtcToken: rtcToken['pusherData']['webToken'],
                  //                     ),
                  //                   ));
                  //         }
                  //       }),

                  //   //  Icon(
                  //   //   Icons.,
                  //   //   color: Colors.black,
                  //   // ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back),
    //       onPressed: () => endCall(),
    //     ),
    //     title: Text("Audio Call"),
    //     actions: [
    //       IconButton(
    //         icon: Icon(muted ? Icons.mic_off : Icons.mic),
    //         onPressed: () => muteAudio(),
    //       )
    //     ],
    //   ),
    //   body: Center(
    //     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //       Text(
    //         _remoteUid == null ? "Calling..." : "In Call",
    //         style: TextStyle(fontSize: 20),
    //       ),
    //       SizedBox(height: 30),
    //       Icon(
    //         Icons.person,
    //         size: 100,
    //       ),
    //       SizedBox(height: 30),
    //       Text(
    //         "User Name",
    //         style: TextStyle(fontSize: 20),
    //       IconButton(
    //         icon: Icon(_speakerEnabled ? Icons.volume_up : Icons.volume_off),
    //         onPressed: _toggleSpeakerEnabled,
    //       ),
    //     ]),
    //   ),
    // );
  }
}
