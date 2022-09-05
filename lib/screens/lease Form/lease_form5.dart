import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/lease%20Form/lease_form6.dart';

class lease_form5 extends StatelessWidget {
  const lease_form5({Key? key}) : super(key: key);

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
                        """16. Remedies upon Default: Upon the occurrence of anyEvent of Default and at any time thereafter NAS may in itssole discretion elect to do one or more of the followingwith respect to the Engine Stand, to the extent permittedby applicable law then in effect:\n\n(a) NAS's Actions: NASmay do anything for CUSTOMER's account that mayreasonably be required to cure any Default Event ofDefault and recover from CUSTOMER all reasonable costs,including reasonable attorney fees, incurred in so doing,plus interest if provided by law;\n\n(b) Damages: NAS may proceed by appropriate courtaction or actions to enforce performance by CUSTOMERof this Agreement and/or to recover damages for thebreach hereof:(c) NAS may: (i) Cancel: Cancel CUSTOMER's rights ofpossession and use under this Agreement and under anyand all leases between NAS and CUSTOMER; (li)Repossess: Demand that CUSTOMER, and CUSTOMERshall upon such demand, return the Engine Stand promptlyto NAS free of any claims or rights of CUSTOMER in themanner andcondition required by, and otherwise in accordance with,all the provisions of this Agreement as if such EngineStand were being returned at the end of the AgreementTerm; or NAS, at its option, may enter upon the premiseswhere such Engine Stand is located (if permitted by law)and takeimmediate possession of and remove the same bysummary proceedings or otherwise free of any claims orrights of CUSTOMER, all without liability to CUSTOMER foror by reason of such entry or taking of possession orremoval, whether for the restoration of damage toproperty caused by such taking or otherwise, whichliability is hereby waived by the CUSTOMER, andCUSTOMER shall be responsible for any costs associatedwith restoring such Engine Stand to the condition requiredby, and in accordance with all the provisions of thisAgreement. Further, CUSTOMER hereby waives anydefenses or objections to NAS's repossession of the""",
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
                    Get.to(lease_form6());
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
