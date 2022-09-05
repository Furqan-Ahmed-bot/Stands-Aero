import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/lease%20Form/lease_form5.dart';

class lease_form4 extends StatelessWidget {
  const lease_form4({Key? key}) : super(key: key);

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
                        """15. Default: The occurrence of any of the following eventsshall constitute an "Event of Default" and material breachand a repudiation of the Agreement hereunder byCUSTOMER (whether such events shall be voluntary orinvoluntary or come about or be effected by operation of lawor pursuant to or in compliance with any judgment, decreeor order of any court or any order, rule or regulation of anyadministrative or governmental body):\n\n(a) Payment: If CUSTOMER shall fail to make anypayment due hereunder in the manner provided hereinwithin five (5) days after the date when such payment isdue;\n\n(b) Other obligations: If CUSTOMER shall fail to observe orperform any of its other obligations hereunder or any otherlease with NAS and shall fail to cure the same within five (5)days after written notice there of from NAS:\n\n(c) Discontinue Business: If CUSTOMER either temporarilyor permanently discontinues business or sells or otherwisedisposes of all or substantially all of its assets or if CUS-TOMER voluntarily suspends all or substantially all of itscommercial operations or the franchises, concessions,permits, rights or privileges required for the conduct of thebusiness and operations of CUSTOMER are revokedcancelled or otherwise terminated or the free and continueduse and exercise thereof curtailed or prevented, and as aresult thereof the preponderant business activity ofCUSTOMER ceases: and/or\n\n(d) Insolvency: If CUSTOMER shall (i) be insolvent, (i)be generally not paying its debts (trade or other) as theybecome due, (ill) file, or consent by answer or otherwise tothe filing against it of, a petition of relief or reorganization orarrangement or any other petition in bankruptcy, forliquidation or to take advantage of any bankruptcy orinsolvency law of any jurisdiction, (iv) make an assignmentof the benefit of its creditors, (v) consent to the appointmentof a custodian, receiver, trustee or other officer with similarpowers of itself or of any substantial part of its property or(vi) take corporate action for the purpose of any of theforegoing. 4 Any event that with the giving of notice, thepassage of time or both would become an Event of Defaultshall be considered a "Default" for all purposes here of""",
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
                    Get.to(lease_form5());
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
