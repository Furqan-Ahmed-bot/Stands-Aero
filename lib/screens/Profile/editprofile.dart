import 'package:flutter/material.dart';
import 'package:stande_aero/helper/colors.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Scaffold(
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
              'Profile',
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
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-46.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 18.0),
              child: Column(
                children: [
                  Container(
                      width: res_width * 0.375,
                      child: Image.asset(
                        'assets/slicing/Untitled-51.png',
                        height: 150,
                      )),
                  // backgroundColor: Colors.red,

                  // Positioned(
                  //   bottom: -10,
                  //   left: 80,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.add_a_photo),
                  //   ),
                  // ),
                  profile_textfield(hed: "Name", labelText: "John Doe"),
                  profile_textfield(hed: "Email", labelText: "John@gmail.com"),
                  profile_textfield(hed: "Country", labelText: "Country"),
                  profile_textfield(hed: "City", labelText: "City"),
                  profile_textfield(
                      hed: "Phone Number", labelText: "Phone Number"),
                  profile_textfield(
                      hed: "Description",
                      labelText:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                      maxLines: 6),
                                      SizedBox(
                  height: res_height * 0.0125,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: res_width * 0.9,
                    decoration: BoxDecoration(
                        color: Color(0xffaf8a39),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Center(
                        child: Text(
                          'Safe',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: res_height * 0.0125,
                ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class profile_textfield extends StatelessWidget {
  var labelText, hed;

  var maxLines;

  profile_textfield({Key? key, this.labelText, this.hed, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$hed",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: res_height * 0.01,
        ),
        Card(
          elevation: 8,
          child: Container(
            // height: 50,
            // padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white)),
            child: TextField(
              maxLines: maxLines,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "$labelText",
                  contentPadding: EdgeInsets.only(left: 10, top: maxLines != null ? 10 : 0)),
              // controller: controller,
            ),
          ),
        ),
        SizedBox(
          height: res_height * 0.01,
        ),
      ],
    );
  }
}
