import 'package:flutter/material.dart';
import 'package:get/get.dart';

class lease_form7 extends StatelessWidget {
  const lease_form7({Key? key}) : super(key: key);
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
            // _key.currentState!.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                width: 25,
                child: Image.asset('assets/slicing/Untitled-44.png')),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lease Form',
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
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slicing/Untitled-46.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: res_width * 0.925,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        """ 24. Jurisdiction: Each party hereby irrevocably and unconditionally submits, for itself and its property, to the nonexclusive jurisdiction of the courts of the State of Texas in any action or proceeding arising out of or relating \nto this Agreement, or for recognition or enforcement of any judgment, and each party hereby irrevocably and unconditionally agrees that all claims in respect of any such action or proceeding may be heard and determined in the courts of the State of Texas. The prevailing party shall be entitled to reimbursement of all reasonable attorney fees and costs. \n\n25. WAIVER OF JURY TRIAL: NAS AND CUSTOMER WAIVE TRIAL BY JURY IN ANY JUDICIAL PROCEEDING TO WHICH THEY ARE PARTIES INVOLVING, DIRECTLY OR INDIRECTLY, ANY MATTER ARISING OUT OF OR RELATING TO THIS AGREEMENT. (Signatures on following page) IN WITNESS WHEREOF, NAS and CUSTOMER have caused their respective duly authorized representatives to execute this Agreement as of the day and year first above written. NATIONAL AERO STANDS, LLC CUSTOMER NAME \n\nBy:_________ \n\nBy:________  \n\nName: Name: \n\nTitle: Title: \n\nGUARANTOR NAME""",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: res_height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(lease_form7());
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
                          'Continue',
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
                  height: res_height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
