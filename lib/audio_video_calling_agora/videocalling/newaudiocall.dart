import 'package:flutter/material.dart';

class NewAudioCallScreen extends StatefulWidget {
  const NewAudioCallScreen({super.key});

  @override
  State<NewAudioCallScreen> createState() => _NewAudioCallScreenState();
}

class _NewAudioCallScreenState extends State<NewAudioCallScreen> {
  @override
  Widget build(BuildContext context) {
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
                  Container(
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
                  Container(
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
      ),
    );
  }
}
