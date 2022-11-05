import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stande_aero/screens/mainhome.dart';
import 'package:stande_aero/screens/taxcertificate/pdfview.dart';
import 'package:stande_aero/services/remote_services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../helper/loader.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TexCertificateScreen extends StatefulWidget {
  const TexCertificateScreen({Key? key}) : super(key: key);

  @override
  State<TexCertificateScreen> createState() => _TexCertificateScreenState();
}

class _TexCertificateScreenState extends State<TexCertificateScreen> {
  dynamic taxCertificates;
  dynamic taxCertificatesPDF;
  String remotePDFpath = "";
  var url;
  bool _isLoading = true;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        taxCertificateList();
      });
    });

    super.initState();
    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      final url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<void> taxCertificateList() async {
    taxCertificates = await ApiService().TaxCertificates_list();

    log("taxCertificates" + taxCertificates['data'].toString());
    taxCertificateListPDF();
  }

  Future<void> taxCertificateListPDF() async {
    var getLength = taxCertificates['data'][0];
    print('getLength' + getLength.toString());
    taxCertificatesPDF = await ApiService()
        .TaxCertificates_listSyncPDF(context, taxCertificates['data']['id']);

    print("taxCertificates" + taxCertificates['data'].toString());
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
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
                'Tax Certificate',
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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder<void>(
              future: taxCertificateList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  log("taxCertificates['data'][0].length" +
                      taxCertificates['data'][0].length.toString());
                  return Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: taxCertificates['data'].length,
                                itemBuilder: (Context, snapshot) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: NotBox(
                                        taxCertificates['data'][snapshot]
                                                ['name']
                                            .toString(),
                                        taxCertificates['data'][snapshot]
                                                ['location']
                                            .toString(),
                                        taxCertificates['data'][snapshot]['id'],
                                        taxCertificates['data'][snapshot]
                                            ['cstm_tax_certificate']),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return spinkit;
                }
              }),
        ),
      ),
    );
  }

  Widget NotBox(MODEL, location, id, cstm_tax_certificate) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: res_width * 0.925,
      child: Card(
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
                  Text(
                    "$MODEL",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: res_height * 0.006,
                  ),
                  Row(
                    children: [
                      Text(
                        "Location: ",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$location",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: res_height * 0.006,
                  ),
                  Container(
                    width: res_width * 0.35,
                    child: Text(
                      "$cstm_tax_certificate",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: res_width * 0.05,
              // ),
              GestureDetector(
                onTap: () async {
                  var res_data = await ApiService().previewPDF(context, id);
                  // remotePDFpath= res_data['data']['path'].toString();
                  print("pdf preview" + res_data['data']['path'].toString());

                  url = res_data['data']['path'];
                  Get.to(() => PdfView(
                        path: url,
                      ));
                },
                child: Container(
                    width: res_width * 0.35,
                    height: res_height * 0.17,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Image.asset(
                      "assets/slicing/Untitled-68.png",
                      fit: BoxFit.cover,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PDFScreen extends StatefulWidget {
  final String? path;

  PDFScreen({Key? key, this.path}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.share),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          // if (snapshot.hasData) {
          //   return FloatingActionButton.extended(
          //     label: Text("Go to ${pages! ~/ 2}"),
          //     onPressed: () async {
          //       await snapshot.data!.setPage(pages! ~/ 2);
          //     },
          //   );
          // }

          return Container();
        },
      ),
    );
  }
}
