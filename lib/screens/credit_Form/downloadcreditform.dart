import 'dart:typed_data';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> makePdf(mydata) async {
  final pdf = Document();
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/slicing/Untitled-4.png'))
          .buffer
          .asUint8List());
  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('KYC FORM')
                // Column(
                //   children: [
                //     Text(mydata[0]['order_date']),
                //     Text(mydata[0]['order_status']),
                //     Text(mydata[0]['payment_status'])
                //   ],
                //   crossAxisAlignment: CrossAxisAlignment.start,
                // ),
                // SizedBox(
                //   height: 150,
                //   width: 150,
                //   child: Image(imageLogo),
                // )
              ],
            ),
            Container(height: 10),
            // Table(
            //   border: TableBorder.all(),
            //   children: [
            //     // TableRow(
            //     //   children: [
            //     //     Padding(
            //     //       child: Text(
            //     //         'INVOICE FOR PAYMENT',
            //     //         style: Theme.of(context).header4,
            //     //         textAlign: TextAlign.center,
            //     //       ),
            //     //       padding: const EdgeInsets.all(20),
            //     //     ),
            //     //   ],
            //     // ),
            //     // ...invoice.items.map(
            //     //   (e) => TableRow(
            //     //     children: [
            //     //       Expanded(
            //     //         child: PaddedText(e.description),
            //     //         flex: 2,
            //     //       ),
            //     //       Expanded(
            //     //         child: PaddedText("\$${e.cost}"),
            //     //         flex: 1,
            //     //       )``
            //     //     ],
            //     //   ),
            //     // ),
            //     TableRow(
            //       children: [
            //         Text(
            //           'TAX',
            //         ),
            //         Text('Faiz'),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Text(
            //           'TOTAL',
            //         ),
            //         Text('Furqan')
            //       ],
            //     )
            //   ],
            // ),
            // Padding(
            //   child: Text(
            //     "THANK YOU FOR YOUR CUSTOM!",
            //     style: Theme.of(context).header2,
            //   ),
            //   padding: const EdgeInsets.all(20),
            // ),
            // Text(
            //     "Please forward the below slip to your accounts payable department."),
            // Divider(
            //   height: 1,
            //   borderStyle: BorderStyle.dashed,
            // ),
            Container(height: 50),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Text('Account Number'),
                    Text(
                      '1234 1234',
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Account Name',
                    ),
                    Text(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Total Amount to be Paid',
                    ),
                    Text('Furqan')
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                'Please ensure all cheques are payable to the ADAM FAMILY TRUST.',
                style: Theme.of(context).header3.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
      },
    ),
  );
  return pdf.save();
}

// Widget PaddedText(
//   final String text, {
//   final TextAlign align = TextAlign.left,
// }) =>
//     Padding(
//       padding: const EdgeInsets.all(10),
//       child: Text(
//         text,
//         textAlign: align,
//       ),
//     );
