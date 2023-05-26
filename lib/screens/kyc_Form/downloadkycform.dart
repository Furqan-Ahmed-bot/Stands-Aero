import 'dart:typed_data';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> downloadkycform(mydata) async {
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
              child: Text('KYC FORM',
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
            // ListView.builder(

            //   itemBuilder: ((context, index) {
            //   return Table(
            //        border: TableBorder.all(),
            //        children: [
            //          TableRow(
            //       children: [
            //         Text(index.toString()),
            //         Text(
            //           mydata[index]['${index}'],
            //         ),
            //       ],
            //     ),
            //        ]

            //   );

            // }), itemCount: mydata.length ,),

            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Text('Client Id'),
                    Text(
                      mydata['client_id'],
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Name',
                    ),
                    Text(
                      mydata['company_name'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Address',
                    ),
                    Text(
                      mydata['company_address'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Type',
                    ),
                    Text(
                      mydata['company_type'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company State Country',
                    ),
                    Text(
                      mydata['company_state_country'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Phone',
                    ),
                    Text(
                      mydata['number'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Contact Person',
                    ),
                    Text(
                      mydata['contact_person'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Website',
                    ),
                    Text(
                      mydata['company_website'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Email',
                    ),
                    Text(
                      mydata['email'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Website',
                    ),
                    Text(
                      mydata['company_website'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Primary Business	',
                    ),
                    Text(
                      mydata['company_prmy_bsns'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Fund Source	',
                    ),
                    Text(
                      mydata['fund_src'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company Country List	',
                    ),
                    Text(
                      mydata['company_countrylist'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Company 2 Name	',
                    ),
                    Text(
                      mydata['company2_name'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'By',
                    ),
                    Text(
                      mydata['_by'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Title',
                    ),
                    Text(
                      mydata['title'],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'Date',
                    ),
                    Text(
                      mydata['date'],
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
