import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/lease%20Form/lease_form7.dart';

class lease_form6 extends StatelessWidget {
  const lease_form6({Key? key}) : super(key: key);

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
                        """17.Security Deposit: ___________ U.S.Dollars (SI_100.00) ("Security Deposit"). All of CUSTOMER's interest in and to the Security Deposit or any other monies or assets held or possessed by NAS are hereby pledged to NAS, and CUSTOMER hereby grants a general lien on and a security interest in, any assets of CUSTOMER in the possession of NAS as security for the performance of this Agreement or to satisfy any obligation owed by CUSTOMER to NAS under any agreement without bliability for interest thereon to CUSTOMER. The Security Deposit will be returned to CUSTOMER within 5 business days of return of the Engine Stand in accordance with the provisions of Section 14 above. 5 \n\n18. Guarantee: The obligations of CUSTOMER under this Agreement are absolutely, irrevocably and unconditionally quaranteed by _____________ ("Guarantor") who shall be liable for all of CUSTOMER's obligations hereunder.. \n\n19. Counterparts: This Agreement may be executed in multiple fax or scanned counterparts. Such counterpart documents, when taken together, will constitute one and the same original document. \n\n20. Merger Clause & Modifications: This Agreement constitutes the entire agreement between the parties and supersedes all previous agreements, understandings, representations or communications, oral or written or otherwise. This Agreement may not be amended, changed, waived or terminated in whole or in part orally, but only by an express instrument in writing signed by the party against which the enforcement of the change, waiver or termination is sought. \n\n21. Notices: Notices shall be sent via first class registered mail (in which case servicewill be deemed to be effected 5 days after posting) or hand delivery or facsimile to the addresses hereinbefore set forth, if to CUSTOMER, to the attention of [INSERT NAME, ADDRESS, EMAIL, FAX, TEL]. \n\n22. Registered Agent / Process Agent. CUSTOMER appoints____________ as its [registered agent process agent] for service of legal process or any legal proceedings ["Registered Agent" / ("Process Agent")] brought in the courts of the State of Texas pursuant to the Agreement or any other document to which CUSTOMER is a party and will provide NAS with a [document confirming the Registered Agent / letter from such Process Agent confirming the appointment]. CUSTOMER agrees that it will not replace the [Registered Agent / Process Agent] without notifying NAS in writing. \n\n23. GOVERNING LAW: THIS AGREEMENT SHALL IN ALL RESPECTS BE GOVERNED BY. AND CONSTRUED IN ACCORDANCE WITH. THE LAWS OF THE STATE OF TEXAS. [9:45 AM, 7/1/2022] UmaiZ Software:""",
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
