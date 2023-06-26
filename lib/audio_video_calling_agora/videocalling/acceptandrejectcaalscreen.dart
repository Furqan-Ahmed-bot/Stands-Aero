import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../services/remote_services.dart';
import 'incomingaudiocalling.dart';
import 'incomingvideocalling.dart';

class AcceptAndRejectCall extends StatefulWidget {
  final incomingvideocalltoken;
  final incomingchannelname;
  final receiveruserid;
  final ClientRole? role;
  final callername;
  final isaudiocall;

  AcceptAndRejectCall({
    super.key,
    this.incomingvideocalltoken,
    this.incomingchannelname,
    this.receiveruserid,
    this.role,
    this.callername,
    this.isaudiocall,
  });

  @override
  State<AcceptAndRejectCall> createState() => _AcceptAndRejectCallState();
}

class _AcceptAndRejectCallState extends State<AcceptAndRejectCall> {
  ClientRole? _role = ClientRole.Broadcaster;
  bool _isRinging = false;

  @override
  void initState() {
    _isRinging = true;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    if (_isRinging == true) {
      FlutterRingtonePlayer.play(
        android: AndroidSounds.ringtone,
        ios: IosSounds.glass,
        looping: true, // Android only - API >= 28
        volume: 0.3, // Android only - API >= 28
        asAlarm: false, // Android  only - all APIs
      );
    } else {
      FlutterRingtonePlayer.stop();
    }
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
              height: 120,
            ),
            Text(
              widget.callername,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.isaudiocall == true ? 'Audio Calling' : 'Video  Calling',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 50,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                    setState(() {
                      _isRinging = false;
                    });

                    ApiService().cancelAudioVideoCalling();
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Icon(
                      Icons.call_end,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: IconButton(
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        setState(() {
                          _isRinging = false;
                        });

                        if (widget.isaudiocall == true) {
                          Get.to(IncomingAudioCall(
                            incomingaudiochannelname:
                                widget.incomingchannelname,
                            incomingaudiocalltoken:
                                widget.incomingvideocalltoken,
                            receiveruserid: widget.receiveruserid,
                            role: _role,
                          ));
                        } else {
                          Get.to(IncomingVideoCalling(
                            incomingchannelname: widget.incomingchannelname,
                            incomingvideocalltoken:
                                widget.incomingvideocalltoken,
                            receiveruserid: widget.receiveruserid,
                            role: _role,
                          ));
                        }
                      }),

                  //  Icon(
                  //   Icons.,
                  //   color: Colors.black,
                  // ),
                )
              ],
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );

    //  Scaffold(
    //   appBar: AppBar(
    //     title: Text('Incoming Call'),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           'John Doe is calling...',
    //           style: TextStyle(fontSize: 24),
    //         ),
    //         SizedBox(height: 16),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: <Widget>[
    //             ElevatedButton(
    //               onPressed: () {
    //                 setState(() {
    //                   _isRinging = false;
    //                 });

    //                 Get.to(IncomingVideoCalling(
    //                   incomingchannelname: widget.incomingchannelname,
    //                   incomingvideocalltoken: widget.incomingvideocalltoken,
    //                   receiveruserid: 117,
    //                   role: _role,
    //                 ));
    //                 // Accept call logic
    //                 print('Call accepted');
    //               },
    //               child: Text('Accept'),
    //             ),
    //             ElevatedButton(
    //               onPressed: () {
    //                 // Reject call logic
    //                 print('Call rejected');
    //               },
    //               child: Text('Reject'),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    Scaffold(
      appBar: AppBar(
        title: Text('Testing'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isRinging = false;
                  });

                  Get.to(IncomingVideoCalling(
                    incomingchannelname: widget.incomingchannelname,
                    incomingvideocalltoken: widget.incomingvideocalltoken,
                    receiveruserid: 117,
                    role: _role,
                  ));
                },
                child: Text('AccepCall')),
          )
        ],
      ),
    );
  }
}
