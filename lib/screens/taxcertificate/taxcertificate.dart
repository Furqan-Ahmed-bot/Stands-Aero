import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stande_aero/screens/mainhome.dart';

class TexCertificateScreen extends StatefulWidget {
  const TexCertificateScreen({Key? key}) : super(key: key);

  @override
  State<TexCertificateScreen> createState() => _TexCertificateScreenState();
}

class _TexCertificateScreenState extends State<TexCertificateScreen> {
  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
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
                'Tax Certificate',
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
              NotBox("CF34-10 DAE", "Miami, Florida"),
              SizedBox(
                height: res_height * 0.01,
              ),
              NotBox("CF34-10 DAE", "Miami, Florida"),
              SizedBox(
                height: res_height * 0.01,
              ),
              NotBox("CF34-10 DAE", "Miami, Florida"),
              SizedBox(
                height: res_height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget NotBox(MODEL, location) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: res_width * 0.925,
      child: Card(
        // margin: EdgeInsets.fromLTRB(18.0, 4.0, 18.0, 18.0),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$MODEL",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: res_height * 0.006,
                  ),
                  Row(
                    children: [
                      Text(
                        "Location: ",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$location",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: res_height * 0.006,
                  ),
                  Container(
                    width: res_width * 0.35,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consecteturadipiscing elit.",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: res_width * 0.05,
              // ),
              Container(
                  width: res_width * 0.35,
                  height: res_height * 0.17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Image.asset(
                    "assets/slicing/Untitled-68.png",
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
