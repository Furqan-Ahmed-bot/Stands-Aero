import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stande_aero/screens/lease%20Form/lease_form4.dart';

class lease_form3 extends StatelessWidget {
  const lease_form3({Key? key}) : super(key: key);

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
                        """12. WARRANTY DISCLAIMER: NAS EXPRESSLYDISCLAIMS AND MAKES NO REPRESENTATIONS ORWARRANTIES, EXPRESS OR IMPLIED, AS TO ANY MATTER WHAT SO EVER,\nINCLUDING, WITHOUT LIMITATION, THE SELECTION, CAPACITY, AGE, AIRWORTHINESS,DESCRIPTION. CONFORMITY TO THE DESCRIPTION INTHIS AGREEMENT. OUALITY. OR CONDITION OF THEENGINE STAND, ITS MERCHANTABILITY, SUITABILITY.FITNESS FOR ANY PARTICULAR PURPOSE THEOPERATION OR PERFORMANCE OF THE ENGINE STANDOR THE MAINTENANCE THEREOF. NEITHER PARTYSHALL BE LIABLE TO THE OTHER PARTY FOR ANY INDI-RECT,SPECIAL OR CONSEQUENTIAL DAMAGES CAUSED ORARISING UNDER THIS AGREEMENT.\n\n13. Inspection: Prior to the execution and delivery ofthis Agreement, CUSTOMER has inspected the EngineStand and hereby confirms (i) that it accepts the EngineStand in its respective "As Is, Where Is" condition at theDelivery Location on the Delivery Date in accordance withthe Agreement, and (ill) NAS has fully performed itsobligations relating to the delivery to the CUSTOMER ofthe Engine Stand under the Agreement. 3\n\n14. Redelivery: CUSTOMER shall redeliver the EngineStand to NAS Delivered Duty Paid (DDP Incoterms) at theDelivery Location or such other location as may bemutually agreed by the parties hereto. Should the standbe redlievered to a location other than the DeliveryLocation, CUSTOMER may be subject to a redelivery feeto be determined according to the new RedeliveryLocation. CUSTOMER shall pay Daily Rent each day untilthe Engine Stand is Redelivered to the RedeliveryLocation in the Redelivery Condition. When redelivered toNAS, the Engine Stand shall be in the same condition aswhen delivered to CUSTOMER, excluding normal wearand tear (the"Redelivery Condition"). To evidence itsacceptance of the condition of the Engine Stand atredelivery, NAS shall execute and deliver to CUSTOMERa redelivery acceptance certificate with respect to theEngine Stand in the form attached hereto as Exhibit A(the "Redelivery Acceptance Certificate"). In theevent that NAS determines, acting reasonably, that theEngine Stand does not meet the Redelivery Condition,this Agreement shall continue (and CUSTOMER shall beliable for Daily Rent to NAS) with respect to the EngineStand until either (i) the correction by CUSTOMER(or procurement by CUSTOMER at CUSTOMER's cost) ofthe discrepancies specified in Attachment 1 to theRedelivery Acceptance Certificate, or (ii) NAS andCUSTOMER agree in writing to a financial resolution withrespect to such discrepancies. """,
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
                    Get.to(lease_form4());
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
