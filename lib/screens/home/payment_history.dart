import 'package:flutter/material.dart';
import 'package:StandsAero/helper/loader.dart';
import 'package:StandsAero/screens/home/drawer.dart';
import 'package:StandsAero/services/remote_services.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<dynamic> responseData = [];
  dynamic paymentsHistory;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      // setState(() {
      payment_history();
      // });
    });
    super.initState();
  }

  Future<void> payment_history() async {
    paymentsHistory = await ApiService().payment_history();
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        key: _key,
        drawer: NavDrawer(),
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
                'Payment History',
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
        body: FutureBuilder<void>(
            future: payment_history(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: paymentsHistory['data'].length > 0
                          ? ListView.builder(
                              itemCount: paymentsHistory['data'].length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Quotes_Card(
                                    orderNumber: paymentsHistory['data'][index]
                                        ['order_number'],
                                    payAmount: paymentsHistory['data'][index]
                                        ['pay_amount'],
                                    paymentDate: paymentsHistory['data'][index]
                                        ['payment_date'],
                                    txnId: paymentsHistory['data'][index]
                                        ['txnid'],
                                    paymentStatus: paymentsHistory['data']
                                        [index]['payment_status']);
                              })
                          : Container(
                              height: res_height * 0.8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'No Payment History Yet.',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                  // Image.asset(
                                  //   'assets/slicing/no-data-found.png',
                                  //   fit: BoxFit.cover,
                                  //   height: 300,
                                  // ),
                                ],
                              )),
                    ),
                  ),
                );
              } else {
                return spinkit;
              }
              ;
            }),
      ),
    );
  }
}

class Quotes_Card extends StatelessWidget {
  // var MODEL, location, description;
  var orderNumber, payAmount, paymentDate, txnId, paymentStatus;

  Quotes_Card(
      {Key? key,
      this.orderNumber,
      this.payAmount,
      this.paymentDate,
      this.txnId,
      this.paymentStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // Get.to(quotes_details());
          },
          child: Center(
            child: Container(
              width: res_width * 0.90,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
                ),
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
                          Row(
                            children: [
                              Text(
                                "Order Number: ",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$orderNumber",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: res_height * 0.006,
                          ),
                          Row(
                            children: [
                              Text(
                                "Pay Amount: ",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$payAmount",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: res_height * 0.006,
                          ),
                          Row(
                            children: [
                              Text(
                                "Payment Date: ",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$paymentDate",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: res_height * 0.006,
                          ),
                          Row(
                            children: [
                              Text(
                                "TxnId: ",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$txnId",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: res_height * 0.006,
                          ),
                          Row(
                            children: [
                              Text(
                                "Payment Status: ",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$paymentStatus",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: res_height * 0.0075,
        ),
      ],
    );
  }
}
