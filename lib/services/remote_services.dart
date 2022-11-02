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
import '../screens/List Quotes/quoteRecieved.dart';
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

  getQuoteRequest(context, sendData) async {
    var jsonBody = jsonEncode(sendData);
    
    // log("jsonBody['product_id']" + jsonBody.toString());
    var getId= sendData['product_id'];
    // log("received id "+ getId.toString());
    final uriget = Uri.parse('${apiGlobal}/api/user/getaquote/${getId}');

    // print("getQuoteRequest " + uri.toString());
    // log("globaltoken " + globaltoken.toString());
    final headers = {
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer ${globaltoken}',
    };

    // var jsonBodya = jsonEncode(sendData);
    // log("sendData data value " + jsonBodya.toString());
    http.Response response = await http.post(
      uriget,
      headers: headers,
      body: sendData,
    );

    var res_data = json.decode(response.body);

    print("response.body res_data" + response.body.toString());

    print(res_data);
    if (res_data["status"] == true) {
      Get.to(QuoteRecieved());
      Get.snackbar(
        'Success',
        'Your Request has been sent',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    return res_data;
  }

}
