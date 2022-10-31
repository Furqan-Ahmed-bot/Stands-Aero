import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:stande_aero/screens/payment/paymentrecieved.dart';
import 'dart:developer';

import '../controller/usercontroller.dart';
import '../controller//ProductController.dart';
import '../helper/ProductModel.dart';
import '../helper/global.dart';
import '../helper/loader.dart';
import '../helper/model.dart';
import '../screens/auth/mainlogin.dart';
import '../screens/mainhome.dart';

// String apiGlobal = "http://localhost:3000/api/v1";
String apiGlobal = "https://standsaero.jumppace.com";
// String apiGlobal = "https://standsaeroapi.jumppace.com";

class ApiService {
  register(data) async {
    final uri = Uri.parse('${apiGlobal}/api/user/registration');
    String jsonBody = json.encode(data);
    final headers = {'Content-Type': 'application/json'};
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    var res_data = json.decode(response.body.toString());
    print(uri);

    print(response.statusCode);

    print(response.body);

    print(res_data);
    if (res_data["status"] == true) {
      final userController = Get.put(UserController());
      userController.addUser(
        UserModel(
          id: res_data['data']['id'],
          fullName: res_data['data']['full_name'],
          phone: res_data['data']['phone'],
          email: res_data['data']['email'],
          propic: res_data['data']['propic'],
          city: res_data['data']['city'],
          country: res_data['data']['country'],
          description: res_data['data']['description'],
        ),
      );

      globaltoken = res_data["data"]["token"];
      userid = res_data['data']['user']['id'].toString();

      Get.to(() => MainScreen());
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  login(data) async {
    final uri = Uri.parse('${apiGlobal}/api/user/login');

    print(uri);
    String jsonBody = json.encode(data);
    final headers = {'Content-Type': 'application/json'};
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    print(response.statusCode);
    print(response.body);
    var res_data = json.decode(response.body.toString());

    print(res_data);
    if (res_data["status"] == true) {
      UserController userController = Get.put(UserController());
      userController.addUser(
        UserModel(
          id: res_data['data']['user']['id'],
          fullName: res_data['data']['user']['full_name'],
          phone: res_data['data']['user']['phone'],
          email: res_data['data']['user']['email'],
          propic: res_data['data']['user']['propic'],
          city: res_data['data']['user']['city'],
          country: res_data['data']['user']['country'],
          description: res_data['data']['user']['description'],
        ),
      );

      globaltoken = res_data["data"]["token"];
      userid = res_data['data']['user']['id'].toString();
      // userid = res_data['data']['user']['id'].toString();
      print("USER MODEL" + userController.user.id.toString());
      print("nameee :  " + userController.user.propic.toString());
      Get.to(() => MainScreen());
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  homeApi() async {
    final uri = Uri.parse('${apiGlobal}/api/front/products');
    // ProductController productController = Get.put(ProductController());
    print(uri);

    // var jsonBody = json.encode(sendData);

    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'bearer ${globaltoken}',
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    print(response.statusCode);

    // log("home API" + response.body.toString());

    var res_data = json.decode(response.body);

    print(res_data);

    if (res_data["status"] == true) {
      print(res_data['data'].length);
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  quotation_list() async {
    final uri = Uri.parse('${apiGlobal}/api/user/quotations-list');
    // ProductController productController = Get.put(ProductController());
    print(uri);

    // var jsonBody = json.encode(sendData);

    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'bearer ${globaltoken}',
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    var res_data = json.decode(response.body);

    // print(res_data);

    if (res_data["status"] == true) {
      print(res_data['data'].length);
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  single_quotation_data(quoteId) async {
    final uri =
        Uri.parse('${apiGlobal}/api/user/quotation-response/${quoteId}');
    // ProductController productController = Get.put(ProductController());
    print(uri);

    // var jsonBody = json.encode(sendData);

    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'bearer ${globaltoken}',
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    var res_data = json.decode(response.body);
    if (res_data["status"] == true) {
      print(res_data['data'].length);
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  prof() async {
    final uri = Uri.parse('${apiGlobal}/api/user/details');

    print(uri);

    // var jsonBody = json.encode(sendData);

    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${globaltoken}',
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    print(response.statusCode);

    log(response.body);

    var res_data = json.decode(response.body);

    print(res_data);
    if (res_data["status"] == true) {
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  updateProfile(context, data) async {
    final usercontroller = Get.put(UserController());
    data["id"] = usercontroller.user.id;
    print(data);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    //print('${apiGlobal}/auth/register');
    final uri = Uri.parse('${apiGlobal}/api/user/profile/update');
    print(uri);

    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = data['name'].toString();
    request.fields['email'] = data['email'].toString();
    request.fields['phone'] = data['phone'].toString();
    request.fields['country'] = data['country'].toString();
    request.fields['city'] = data['city'].toString();
    request.fields['description'] = data['description'].toString();
    log("image value coming from frontend" + data['photo'].toString());
    var headers = {'Authorization': "Bearer " + globaltoken};
// Add Check propic
    if (data['photo'] != null) {
      print(data['photo'].toString());
      print(data['photo'].path.toString());
      var multipartFile = await http.MultipartFile.fromPath(
          'photo', data['photo']!.path,
          filename: data['photo'].path.split('/').last,
          contentType: MediaType("image", "jpg"));
      request.files.add(multipartFile);
    }
    String jsonBody = json.encode(request.fields);
    log("Request " + jsonBody.toString());
    request.headers.addAll(headers);
    log("request" + request.toString());
    var response = await request.send();

    final res = await http.Response.fromStream(response);

    log("res print" + res.body.toString());

    var res_data = json.decode(res.body.toString());
    if (res_data['status'] == true) {
      UserController userController = UserController();
      userController.addUser(
        UserModel(
          id: res_data['id'],
          fullName: res_data['full_name'],
          phone: res_data['phone'],
          email: res_data['email'],
          propic: res_data['photo'],
          city: res_data['city'],
          country: res_data['country'],
          description: res_data['description'],
        ),
      );
    }

    return res_data;
  }

  order_history() async {
    final uri = await Uri.parse('${apiGlobal}/api/user/orders');
    print(uri);
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${globaltoken}',
    };
    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    log("response status code ${response.body}");
    var res_data = json.decode(response.body);
    print(res_data);
    if (res_data["status"] == true) {
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  TaxCertificates_list() async {
    final uri = Uri.parse('${apiGlobal}/api/user/tax-certs');
    print(uri);
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${globaltoken}',
    };
    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    print(response.statusCode);
    var res_data = json.decode(response.body);
    print(res_data);
    if (res_data["status"] == true) {
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  payment_history() async {
    final uri = Uri.parse('${apiGlobal}/api/user/payments');
    print(uri);
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${globaltoken}',
    };
    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    print(response.statusCode);
    var res_data = json.decode(response.body);
    print(res_data);
    if (res_data["status"] == true) {
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  logout() async {
    final uri = Uri.parse('${apiGlobal}/api/user/logout');

    print(uri);

    final headers = {'Authorization': 'Bearer ${globaltoken}'};

    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    print(response.statusCode);

    // print(response.body);
    // try {
    //   var res_data = json.decode(response.body);
    // } catch (e) {
    //   log('$e');
    // }
    var res_data = json.decode(response.body);

    print(res_data);
    if (res_data["status"] == true) {
      Get.to(() => MainLoginScreen());
    } else
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );

    return res_data;
  }

  singleProductDetails(productId) async {
    final uri =
        Uri.parse('${apiGlobal}/api/front/product/${productId}/details');

    print(uri);

    final headers = {'Authorization': 'bearer ${globaltoken}'};

    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    print(response.statusCode);
    var res_data = json.decode(response.body);

    // print(res_data);
    // if (res_data["status"] == true) {
    //   Get.to(() => MainLoginScreen());
    // } else
    //   Get.snackbar(
    //     'Error',
    //     'Wrong Credentials',
    //     animationDuration: Duration(seconds: 2),
    //     snackPosition: SnackPosition.BOTTOM,
    //   );

    return res_data;
  }

  getQuoteRequest(context, requestProductId, sendData) async {
    final uri = Uri.parse('${apiGlobal}/api/user/getaquote/${requestProductId}');

    print("getQuoteRequest" + uri.toString());

    final headers = {
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer ${globaltoken}',
    };

    // var abc = {
    //   'product_id': '1',
    //   'location': 'Ny',
    //   'date_from': '2023-09-23',
    //   'date_to': '2023-09-26',
    //   'kyc_client_id': '29',
    //   'kyc_company_name': 'StandsCompany',
    //   'kyc_company_type': 'IT',
    //   'kyc_company_state_country': 'sindh',
    //   'kyc_company_address': '--',
    //   'kyc_number': '656456456456456',
    //   'kyc_fax': '4565',
    //   'kyc_contact_person': 'taimoor',
    //   'kyc_email': 'taimoorhussain@gmail.com',
    //   'kyc_company_website': 'StandsCompany.com',
    //   'kyc_company_additional_members': 'mohsin, bilal',
    //   'kyc_company_prmy_bsns': 'Design services',
    //   'kyc_fund_src': 'Pakistan',
    //   'kyc_company_countrylist': 'Pakistan, UAE, USA',
    //   'kyc_company2_name': 'company test 2',
    //   'kyc_by': 'ssdasd',
    //   'kyc_title': 'asdasdasd',
    //   'kyc_date': '2022-02-02',
    //   'crd_client_id': '29',
    //   'crd_company_name': 'test company',
    //   'crd_company_address': 'abc address',
    //   'crd_city': 'california',
    //   'crd_contact_name': 'george',
    //   'crd_phone': '+1321654987',
    //   'crd_sole_proprietorship': 'test sole proprietorship',
    //   'crd_corporation': 'block box',
    //   'crd_other': 'other details',
    //   'crd_date_business_stared': '2022-06-06',
    //   'crd_federal_id': '56456',
    //   'crd_state': 'las vegas',
    //   'crd_fax': '3234234',
    //   'crd_zip': '022985',
    //   'crd_email': 'saasd@qwqw.com',
    //   'crd_partnership': 'asdsd',
    //   'crd_type_of_business': 'dasd',
    //   'crd_d_and_b': 'asdasd',
    //   'crd_bank_name': 'sdasd',
    //   'crd_bank_address': 'asdas',
    //   'crd_bank_city': 'as',
    //   'crd_bank_contact_name': 'asdasd',
    //   'crd_bank_state': 'asds',
    //   'crd_bank_zip': '32154',
    //   'crd_bank_phone': 'asdadasdsa',
    //   'crd_bsns_trde_company_name': 'asasd',
    //   'crd_bsns_trde_company_address': 'asdsda',
    //   'crd_bsns_trde_city': 'assdasd',
    //   'crd_bsns_trde_state': 'asdas',
    //   'crd_bsns_trde_zip': '2565',
    //   'crd_bsns_trde_phone': 'asdasd',
    //   'crd_bsns_trde_fax': 'asdasd',
    //   'crd_bsns_trde_email': 'asdsad',
    //   'crd_sig_name_title': 'asdasd',
    //   'crd_sig_date': '2022-05-05'
    // };

    // var jsonBodya = jsonEncode(abc);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: sendData,
    );

    var res_data = json.decode(response.body.toString());

    print(response.body);

    print(res_data);
    if (res_data["status"] == true) {
      Get.to(PaymentRecieved());
      Get.snackbar(
        'Success',
        'Your Request has been sent',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    return res_data;
  }

  // quoteRequest(context,sendData,id) {

  //   final uri = Uri.parse('${apiGlobal}/api/user/product/${id}/quotation-request');
  //   print(uri);

  // }

}
