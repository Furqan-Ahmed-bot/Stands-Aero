import 'dart:typed_data';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> downloadcreditapplicationform(creditapplicationdata) async {
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
            Center(
              child: Text('Credit Application Form',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                    Text('client_id'),
                    Text(
                      creditapplicationdata['client_id'],
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Name',
                    ),
                    Text(
                      creditapplicationdata['company_name'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Address',
                    ),
                    Text(
                      creditapplicationdata['company_address'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'City',
                    ),
                    Text(
                      creditapplicationdata['city'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Contact Name',
                    ),
                    Text(
                      creditapplicationdata['contact_name'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Phone',
                    ),
                    Text(
                      creditapplicationdata['phone'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Sole Proprietorship',
                    ),
                    Text(
                      creditapplicationdata['sole_proprietorship'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Corporation',
                    ),
                    Text(
                      creditapplicationdata['corporation'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Other',
                    ),
                    Text(
                      creditapplicationdata['other'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Date Business Started',
                    ),
                    Text(
                      creditapplicationdata['date_business_stared'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'State',
                    ),
                    Text(
                      creditapplicationdata['state'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Email',
                    ),
                    Text(
                      creditapplicationdata['email'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Partnership',
                    ),
                    Text(
                      creditapplicationdata['partnership'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Type Of Business',
                    ),
                    Text(
                      creditapplicationdata['type_of_business'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'd_and_b',
                    ),
                    Text(
                      creditapplicationdata['d_and_b'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Bank Name',
                    ),
                    Text(
                      creditapplicationdata['bank_name'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Bank Address',
                    ),
                    Text(
                      creditapplicationdata['bank_address'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Bank City',
                    ),
                    Text(
                      creditapplicationdata['bank_city'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Bank Contact Name',
                    ),
                    Text(
                      creditapplicationdata['bank_contact_name'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Bank State',
                    ),
                    Text(
                      creditapplicationdata['bank_state'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Bank Zip',
                    ),
                    Text(
                      creditapplicationdata['bank_zip'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Bank Phone',
                    ),
                    Text(
                      creditapplicationdata['bank_phone'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Business Trade Company Name',
                    ),
                    Text(
                      creditapplicationdata['bsns_trde_company_name'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Business Trade Company Address	',
                    ),
                    Text(
                      creditapplicationdata['bsns_trde_company_address'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Business Trade City',
                    ),
                    Text(
                      creditapplicationdata['bsns_trde_city'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Business Trade State',
                    ),
                    Text(
                      creditapplicationdata['bsns_trde_state'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Business Trade Zip',
                    ),
                    Text(
                      creditapplicationdata['bsns_trde_zip'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Business Trade Phone',
                    ),
                    Text(
                      creditapplicationdata['bsns_trde_phone'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Business Trade Fax',
                    ),
                    Text(
                      creditapplicationdata['bsns_trde_fax'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Business Trade Email',
                    ),
                    Text(
                      creditapplicationdata['bsns_trde_email'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Signature Name Title',
                    ),
                    Text(
                      creditapplicationdata['sig_name_title'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Signature Date',
                    ),
                    Text(
                      creditapplicationdata['sig_date'],
                    )
                  ],
                ),
              ],
            ),
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
