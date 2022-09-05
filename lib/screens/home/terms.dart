import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
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
                'Terms & Condition',
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet consectetur adipiscing elit,cure nibh porttitor nulla diam justo, habitasse dignissimhabitant placerat tristique penatibus. Lectus rhoncus musaccumsan venenatis litora metus, eros lobortis feugiat velvolutpat blandit, nibh habitant tempor placerat vulputate.Nulla aliquam risus quam pulvinar phasellus metus prae-sent accumsan at, faucibus tellus curabitur eleifend orcicubilia scelerisque varius nec isl, cras id mollis conguepellentesque purus felis ac.\n\nLorem ipsum dolor sit amet consectetur adipiscing elit,cure nibh porttitor nulla diam justo, habitasse dignissimhabitant placerat tristique penatibus. Lectus rhoncus musaccumsan venenatis litora metus, eros lobortis feugiat velvolutpat blandit, nibh habitant tempor placerat vulputate.Nulla aliquam risus quam pulvinar phasellus metus prae-sent accumsan at, faucibus tellus curabitur eleifend orcicubilia scelerisque varius nec isl, cras id mollis conguepellentesque purus felis ac.',
                    style: TextStyle(fontSize: 14, height: 1.35),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
