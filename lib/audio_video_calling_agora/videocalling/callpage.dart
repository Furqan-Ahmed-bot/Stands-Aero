import 'dart:convert';
import 'package:StandsAero/services/remote_services.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../helper/global.dart';
import 'setting.dart';

class CallPage extends StatefulWidget {
  /// non-modifiable channel name of the page
  final String? channelName;
  final RtcToken;

  /// non-modifiable client role of the page
  final ClientRole? role;

  /// Creates a call page with given channel name.
  const CallPage({Key? key, this.channelName, this.role, this.RtcToken})
      : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  bool mutevideo = false;

  late RtcEngine _engine;
  int? _remoteUid;

  @override
  void dispose() {
    // clear users
    _users.clear();
    _dispose();
    super.dispose();
  }

  Future<void> _dispose() async {
    // destroy sdk
    await _engine.leaveChannel();
    await _engine.destroy();
  }

  dynamic rtcToken = '';
  dynamic channel;
  dynamic receiverUserUid;
  dynamic receiverUserUid2;
  Future<void> getRtCToken() async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${globaltoken}',
    };
    String Url =
        'https://standsaero-merger.jumppace.com/nsa/api/user/DriectCall?type=video';
    var response = await http.get(Uri.parse(Url), headers: headers);
    if (response.statusCode == 200) {
      var res = response.body;
      dynamic data = json.decode(res);
      rtcToken = data;

      print('RTC Token ${rtcToken['pusherData']['webToken']}');
      channel = rtcToken['pusherData']['channel'];
      webtoken = rtcToken['pusherData']['webToken'];
      receiverUserUid = rtcToken['pusherData']['receiverUserUid'];

      receiverUserUid2 = int.parse(receiverUserUid);

      print(globaltoken);
    } else {
      print('Status Code ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();

    // initialize agora sdk

    getRtCToken().then(
      (value) {
        initialize();
      },
    );
  }

  Future<void> initialize() async {
    // FlutterRingtonePlayer.play(
    //   android: AndroidSounds.ringtone,
    //   ios: IosSounds.glass,
    //   looping: true, // Android only - API >= 28
    //   volume: 0.3, // Android only - API >= 28
    //   asAlarm: false, // Android  only - all APIs
    // );

    if (appId.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(webtoken, channel, null, currecntuid);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.role!);
  }

  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        final info = 'onError: $code';
        _infoStrings.add(info);
      });
    }, joinChannelSuccess: (channel, uid, elapsed) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      });
    }, leaveChannel: (stats) {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
        Get.back();
      });
    }, userJoined: (uid, elapsed) {
      setState(() {
        final info = 'userJoined: $uid';
        _infoStrings.add(info);
        _users.add(uid);
        _remoteUid = uid;
        // FlutterRingtonePlayer.stop();
      });
    }, userOffline: (uid, elapsed) {
      setState(() {
        final info = 'userOffline: $uid';
        _infoStrings.add(info);
        _users.remove(uid);
        _remoteUid = null;
        Get.back();
      });
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _infoStrings.add(info);
      });
    }));
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if (widget.role == ClientRole.Broadcaster) {
      list.add(RtcLocalView.SurfaceView());
    }
    _users.forEach((int uid) =>
        list.add(RtcRemoteView.SurfaceView(channelId: channel, uid: uid)));
    return list;
  }

  /// Video view wrapper
  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  /// Video view row wrapper
  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  Widget _expandedVideoRow1() {
    return Expanded(
        child: Container(
      color: Colors.black,
    ));
  }

  /// Video layout wrapper
  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[_videoView(views[0])],
        ));
      case 2:
        return Column(
          children: <Widget>[
            _expandedVideoRow([views[0]]),
            _expandedVideoRow([views[1]])

            // if (mutevideo == false) ...[

            // ] else ...[
            //   _expandedVideoRow1()
            // ],
          ],
        );

      // Column(
      //   children: [
      //      Stack(
      //     alignment: Alignment.topLeft,
      //     clipBehavior: Clip.none,
      //     children: <Widget>[
      //       _expandedVideoRow([views[1]]),
      //       Positioned(
      //           child: Container(
      //         decoration:
      //             BoxDecoration(borderRadius: BorderRadius.circular(15)),
      //         width: 180,
      //         height: 250,
      //         child: _expandedVideoRow([views[0]]),
      //       ))
      //     ],
      //   ),

      //   ],
      // );
      //  Container(
      //   child:
      //   Column(children: [

      //   ],)

      //   //  Stack(
      //   //   alignment: Alignment.topLeft,
      //   //   clipBehavior: Clip.none,
      //   //   children: <Widget>[
      //   //     _expandedVideoRow([views[1]]),
      //   //     Positioned(
      //   //         child: Container(
      //   //       decoration:
      //   //           BoxDecoration(borderRadius: BorderRadius.circular(15)),
      //   //       width: 180,
      //   //       height: 250,
      //   //       child: _expandedVideoRow([views[0]]),
      //   //     ))
      //   //   ],
      //   // ),
      // );
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }

  /// Toolbar layout
  Widget _toolbar() {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    if (widget.role == ClientRole.Audience) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
              InkWell(
                onTap: () {
                  _onToggleMute();
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    muted ? Icons.mic_off : Icons.mic,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _onCallEnd(context);
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
              InkWell(
                onTap: () {
                  _onSwitchCamera();
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.switch_camera,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    _onvideoClose(context);
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: mutevideo == false
                        ? Icon(Icons.videocam)
                        : Icon(
                            Icons.videocam_off,
                            color: Colors.black,
                          ),
                  ))
            ],
          ),
        ),
      ],
    );

    //  Container(
    //   alignment: Alignment.bottomCenter,
    //   padding: const EdgeInsets.symmetric(vertical: 48),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       RawMaterialButton(
    //         onPressed: _onToggleMute,
    //         child: Icon(
    //           muted ? Icons.mic_off : Icons.mic,
    //           color: muted ? Colors.white : Colors.blueAccent,
    //           size: 20.0,
    //         ),
    //         shape: CircleBorder(),
    //         elevation: 2.0,
    //         fillColor: muted ? Colors.blueAccent : Colors.white,
    //         padding: const EdgeInsets.all(12.0),
    //       ),
    //       RawMaterialButton(
    //         onPressed: () => _onCallEnd(context),
    //         child: Icon(
    //           Icons.call_end,
    //           color: Colors.white,
    //           size: 35.0,
    //         ),
    //         shape: CircleBorder(),
    //         elevation: 2.0,
    //         fillColor: Colors.redAccent,
    //         padding: const EdgeInsets.all(15.0),
    //       ),
    //       RawMaterialButton(
    //         onPressed: _onSwitchCamera,
    //         child: Icon(
    //           Icons.switch_camera,
    //           color: Colors.blueAccent,
    //           size: 20.0,
    //         ),
    //         shape: CircleBorder(),
    //         elevation: 2.0,
    //         fillColor: Colors.white,
    //         padding: const EdgeInsets.all(12.0),
    //       )
    //     ],
    //   ),
    // );
  }

  /// Info panel to show logs
  Widget _panel() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: ListView.builder(
            reverse: true,
            itemCount: _infoStrings.length,
            itemBuilder: (BuildContext context, int index) {
              if (_infoStrings.isEmpty) {
                return Text(
                    "null"); // return type can't be null, a widget was required
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          _infoStrings[index],
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onCallEnd(BuildContext context) {
    ApiService().cancelAudioVideoCalling();
    Navigator.pop(context);
  }

  void _onvideoClose(BuildContext context) {
    setState(() {
      mutevideo = !mutevideo;
      _engine.muteLocalVideoStream(mutevideo);
      _engine.enableLocalVideo(!mutevideo);
    });
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();

    // _engine.muteLocalVideoStream(!mutevideo);
    // _engine.enableLocalVideo(!mutevideo);
  }

  @override
  Widget build(BuildContext context) {
    // if (_remoteUid != null) {
    //   FlutterRingtonePlayer.stop();
    // }

    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _remoteUid == null
          ? Container(
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
                  Text("Calling"),
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
                        InkWell(
                          onTap: () {
                            _onToggleMute();
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.mic,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
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
                          child: Icon(
                            Icons.video_call,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          : Stack(
              children: <Widget>[
                _viewRows(),
                // _panel(),
                _toolbar(),
              ],
            ),
    );

    //  Scaffold(
    //   appBar: AppBar(
    //     title: Text('Agora Flutter QuickStart'),
    //   ),
    //   backgroundColor: Colors.white,
    //   body: Center(
    //     child: _remoteUid == null
    //         ? Text('Calling')
    //         : Stack(
    //             children: <Widget>[
    //               _viewRows(),
    //               // _panel(),
    //               _toolbar(),
    //             ],
    //           ),
    //   ),
    // );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

// const appId = "31cb3060e7fc490786213c0081010e9c";
// const token =
//     "007eJxTYDi+V8/wzS/FjVmptz05BQ9fiH2zY+bP9XYKDQJp+9afWs6uwGCZnJpikJxiZG6eamhiYGJpYWKclGJuYm6alpScZmph7P4kIqUhkJHB9tk2FkYGCATxmRkSk5IZGACWliBc";

// class AgoraCallPage extends StatefulWidget {
//   final String channelName;
//   AgoraCallPage({Key? key, required this.channelName}) : super(key: key);

//   @override
//   _AgoraCallPageState createState() => _AgoraCallPageState();
// }

// class _AgoraCallPageState extends State<AgoraCallPage> {
//   late RtcEngine _engine;
//   int _remoteUid = 0;

//   @override
//   void initState() {
//     super.initState();
//     initializeAgora();
//   }

//   Future<void> initializeAgora() async {
//     await [Permission.microphone, Permission.camera].request();

//     _engine = await RtcEngine.create(appId);

//     _engine.setEventHandler(RtcEngineEventHandler(
//       joinChannelSuccess: (String channel, int uid, int elapsed) {
//         print("Join channel success, uid: $uid");
//       },
//       userJoined: (int uid, int elapsed) {
//         print("User joined, uid: $uid");
//         setState(() {
//           _remoteUid = uid;
//         });
//       },
//       userOffline: (int uid, UserOfflineReason reason) {
//         print("User offline, uid: $uid");
//         setState(() {
//           _remoteUid = 0;
//         });
//       },
//     ));

//     await _engine.joinChannel(token, widget.channelName, null, 0);
//   }

//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.destroy();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.channelName)),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Center(
//             child: _remoteUid == 0
//                 ? Text("Waiting for someone to join...")
//                 : _viewRows(),
//           ),
//           GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Icon(
//                   Icons.phone,
//                   size: 32,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _viewRows() {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             child: RtcRemoteView.SurfaceView(
//               uid: _remoteUid,
//               channelId: widget.channelName,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             child: RtcLocalView.SurfaceView(),
//           ),
//         ),
//       ],
//     );
//   }
// }
