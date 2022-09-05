import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stande_aero/screens/home/home.dart';
import 'package:stande_aero/screens/lease%20Form/lease_form3.dart';

class lease_form2 extends StatelessWidget {
  const lease_form2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    void currency() {
      Locale locale = Localizations.localeOf(context);
      var format = NumberFormat.simpleCurrency(locale: locale.toString());
      print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
      print("CURRENCY NAME ${format.currencyName}"); // USD
    }

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
                        """8. Insurance Requirements: At all times during thisagreement CUSTOMER shall maintain in full force andeffect policies of insurance providing or causing to beprovided:\n\n• Comprehensive General Liability Insurance and/orComprehensive Airline Liability Insurance and/orComprehensive Aviation Insurance to cover the liabilityexposures of the CUSTOMER from any and alloccurrences with limits of not less than US.000.000any one occurrence and in the aggregate with respect ofProducts and Personal Injury0\n\n9. Owner of Engine Stand. NAS is the owner of theEngine Stand. Nothing in this Agreement alters, changes,modifies or transfers NAS's 100% ownership. NAS'sownership of the Stand is absolute.\n\n10. Taxes: All sales, use and similar taxes and anycustoms, duties and similar charges (all of the foregoingcollectively referred to as "Taxes") arising from thetransaction described in this Agreement shall be for theaccount of CUSTOMER. CUSTOMER shall indemnify NASfor all such Taxes against NAS for which CUSTOMER isresponsible under this provision, including NAS's attorneyfees and costs of defending against such Taxes wherenecessitated as a result of CUSTOMER's failure to ensuretimely payment of any such Taxes..\n\n11. Release, Indemnity and Hold Harmless: CUSTOMERdoes hereby indemnify, defend, hold harmless, waive,release and forever discharge NAS and its lenders,shareholders, directors, officers, employees, agents,successors and assigns (collectively, the "NASIndemnitees" or any one an "NAS Indemnitee"), in anyand all of their capacities, from any and all AdverseConsequences (as defined below) of whatever nature,whether known or unknown, relating to or arising inconnection with the Engine Stand or this Agreementregardless of whether such Adverse Consequences arethe result of NAS's negligence, active, passive or otherwise(excluding any Adverse Consequences to the extentrelating to or arising from the willful misconduct or grossnegligence of any NAS Indemnitee). For purposes of thisAgreement, "Adverse Consequences" means all actions,suits, proceedings, hearings, investigations, charges,complaints, claims, demands, injunctions, judgments,orders, decrees, rulings, damages, dues, penalties, fines,costs, amounts paid in settlement, liabilities, obligations,Taxes, liens, losses, expenses, and fees, including courtcosts and reasonable attorney fees and expenses arisingas a result of or in direct relation to the leasing of theEngine Stand. CUSTOMER acknowledges that theforegoing release and limitation of liability of NAS areessential elements of this Agreement.""",
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
                    Get.to(lease_form3());
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
