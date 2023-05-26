import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';

class AVCalling extends StatefulWidget {
  final webtoken;
  const AVCalling({super.key, this.webtoken});

  @override
  State<AVCalling> createState() => _AVCallingState();
}

class _AVCallingState extends State<AVCalling> {
  // dynamic rtcToken = '';
  // dynamic channel;
  // dynamic webToken;
  // Future<void> getRtCToken() async {
  //   String Url =
  //       'https://standsaero-merger.jumppace.com/nsa/api/user/DriectCall?type=video';
  //   var response = await http.get(Uri.parse(Url), headers: globalHeaders);
  //   if (response.statusCode == 200) {
  //     var res = response.body;
  //     dynamic data = json.decode(res);
  //     rtcToken = data;
  //     print('RTC Token ${rtcToken['pusherData']['webToken']}');
  //     webToken = rtcToken['pusherData']['webToken'];
  //     channel = rtcToken['pusherData']['channel'];
  //   } else {
  //     print('Status Code ${response.statusCode}');
  //   }
  // }

  final AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
    uid: 117,
    rtmUid: '9',
    appId: "9ced0cd277e14049843bd7475fbcf583",
    channelName: "117supportCaller",
    username: "harry",
    tempToken: webtoken,
  ));
  @override
  void initState() {
    // getRtCToken();
    super.initState();

    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agora VideoUIKit'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: true, // Add this to enable host controls
              ),
              AgoraVideoButtons(
                client: client,
                onDisconnect: () {
                  Get.back();
                },
                // Add this to enable screen sharing
              ),
            ],
          ),
        ),
      ),
    );
  }
}
