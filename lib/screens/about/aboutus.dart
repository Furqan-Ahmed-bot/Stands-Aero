import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Aboututs extends StatefulWidget {
  const Aboututs({Key? key}) : super(key: key);

  @override
  State<Aboututs> createState() => _AboututsState();
}

class _AboututsState extends State<Aboututs> {
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      // height:  double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'About us',
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
          child: Column(
            children: [
              SizedBox(
                height: res_height * 0.02,
              ),
              textbox('What Makes Engine Stands so Important?'),
              SizedBox(
                height: res_height * 0.015,
              ),
              textbox('Why Choose National Aero Stands?')
            ],
          ),
        ),
      ),
    );
  }

  Widget textbox(title) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Container(
      width: res_width * 0.9,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: res_height * 0.01,
            ),
            Text(
              'National Aero Stands was founded with the purpose of providing aircraft engine transportation stand support for MRO, airline and engine leasing customers worldwide. As the world leader of engine stand leasing, our extensive inventory can fulfill all your leasing needs',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
