import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:StandsAero/screens/auth/emaillogin.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'audio_video_calling_agora/videocalling/acceptandrejectcaalscreen.dart';
import 'services/remote_services.dart';

final _channelController = TextEditingController();
final _messageController = TextEditingController();
final _messages = <String>[];
late PusherClient _pusher;
late Channel _channel;
String pusherAppKey = '87dcfbf1725d5ae0f886';
String pusherAppCluster = 'ap2';
ClientRole? _role = ClientRole.Broadcaster;

Future<void> connectPusher() async {
  try {
    _pusher = PusherClient(
      pusherAppKey,
      PusherOptions(cluster: pusherAppCluster),
      enableLogging: true,
    );
    _pusher.connect();
    _channel = _pusher.subscribe('client.call');
    print('Channel Subscribed');
    _channel.bind('nsa-video-call', (dynamic data) {
      Map<String, dynamic> map = jsonDecode(data.data);
      print('Bind Dataaaaa $map');
      print('Channel name is ${map['channel']}');
      print('Token name is ${map['token']}');
      print('Receiver Id  ${map['receiverUserUid']}');
      Get.to(AcceptAndRejectCall(
        incomingchannelname: map['channel'],
        incomingvideocalltoken: map['token'],
        receiveruserid: map['receiverUserUid'],
        role: _role,
        callername: map['receiverUserName'],
      ));
      // _messages.add('${data.data}: ${data['message']}');
    });
    _channel.bind('nsa-ticket-audio-call', (dynamic data) {
      Map<String, dynamic> map = jsonDecode(data.data);
      print('Bind Dataaaaa $map');
      print('Channel name is ${map['channel']}');
      print('Token name is ${map['token']}');
      print('Receiver Id  ${map['receiverUserUid']}');
      Get.to(AcceptAndRejectCall(
        incomingchannelname: map['channel'],
        incomingvideocalltoken: map['token'],
        receiveruserid: map['receiverUserUid'],
        role: _role,
        callername: map['receiverUserName'],
        isaudiocall: true,
      ));
      // Get.to(IncomingAudioCall(
      //   incomingaudiochannelname: map['channel'],
      //   incomingaudiocalltoken: map['token'],
      //   receiveruserid: map['receiverUserUid'],
      //   role: _role,
      // ));
      _messages.add('${data.data}: ${data['message']}');
    });
  } catch (error) {
    print(error);
  }
}

void main() {
  runApp(const MyApp());
  connectPusher();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Map<int, Color> _yellow700Map = {
      50: Color(0xffbd9f50),
      100: Color(0xffbd9f50),
      200: Color(0xffbd9f50),
      300: Color(0xffbd9f50),
      400: Color(0xffbd9f50),
      500: Color(0xffbd9f50),
      600: Color(0xffbd9f50),
      700: Color(0xffbd9f50),
      800: Color(0xffbd9f50),
      900: Color(0xffbd9f50),
    };
    final MaterialColor _yellow700Swatch =
        MaterialColor(Color(0xffbd9f50).value, _yellow700Map);
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: Duration(seconds: 1),
      debugShowCheckedModeBanner: false,
      title: 'Stands Aero',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
        primarySwatch: _yellow700Swatch,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    start();

    super.initState();
  }

  // Future<void> connectPusher() async {
  //   try {
  //     _pusher = PusherClient(
  //       pusherAppKey,
  //       PusherOptions(cluster: pusherAppCluster),
  //       enableLogging: true,
  //     );
  //     _pusher.connect();
  //     _channel = _pusher.subscribe('client.call');
  //     print('Channel Subscribed');
  //        _channel.bind('nsa-video-call', (dynamic data) {
  //       setState(() {
  //         Map<String, dynamic> map = jsonDecode(data.data);
  //         print('Bind Dataaaaa $map');
  //         print('Channel name is ${map['channel']}');
  //         print('Token name is ${map['token']}');
  //         // _messages.add('${data.data}: ${data['message']}');
  //       });
  //     });
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  start() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.getString('email') != null) {
      var sendData = {
        "email":
            pref.getString('email'), // "hammadkhaultz@gmail.com", //email.text,
        "password": pref.getString('password'), //"password", //password.text,
        "device_token": "123654"
      };

      ApiService().login(context, sendData, loader: true);
    } else {
      Timer(Duration(seconds: 2), () => Get.offAll(() => EmailLoginScreen()));
    }

    log('start called');
    // Timer(
    //   Duration(seconds: 2),
    //   () => Get.offAll(() =>
    //       pref.getString('email') == null ? EmailLoginScreen() : HomeScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        //child: Center(child: Image.asset('assets/slicing/Untitled-2.png')),
      ),
    );
  }
}
