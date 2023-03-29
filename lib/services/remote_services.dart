import 'dart:convert';
import 'dart:developer';

import 'package:StandsAero/screens/auth/emaillogin.dart';
import 'package:StandsAero/screens/auth/otp.dart';
import 'package:StandsAero/screens/credit_Form/credit_form.dart';
import 'package:StandsAero/screens/kyc_Form/kyc_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../bottomcontroller.dart';
import '../controller/usercontroller.dart';
import '../helper/data_storage.dart';
import '../helper/global.dart';
import '../helper/loader.dart';
import '../helper/model.dart';
import '../screens/List Quotes/quoteRecieved.dart';
import '../screens/auth/forgotpasswordwithotp.dart';
import '../screens/auth/mainlogin.dart';
import '../screens/mainhome.dart';

// String apiGlobal = "http://localhost:3000/api/v1";
// String apiGlobal = "https://standsaero.jumppace.com";
String apiGlobal = "https://standsaero-merger.jumppace.com/nsa";

// String apiGlobal = "https://standsaero-dev.jumppace.com";
final bottomctrl = Get.put(BottomController());
// String apiGlobal = "https://standsaeroapi.jumppace.com";

class ApiService {
  register(context, data) async {
    final uri = Uri.parse('${apiGlobal}/api/user/registration');
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
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
      if (res_data['data']['user']['email_verified'] == 'No') {
        Get.snackbar(
          'Error',
          'Please verify your account',
          animationDuration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
        );
        Navigator.pop(context);

        globaltoken = res_data["data"]["token"];
        log('GLOBAL TOKEN: $globaltoken');

        Get.to(OTPScreen(
            userId: res_data['data']['user']['id'],
            email: res_data['data']['user']['email'],
            page: 'signup'));
      } else {


        final userController = Get.put(UserController());
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
            isKycFilled: res_data['data']['user']['is_kyc'],
            isCreditFormFilled: res_data['data']['user']['is_creditappform'],
          ),
        );

        globaltoken = res_data["data"]["token"];
        userid = res_data['data']['user']['id'].toString();

        // Get.to(kyc_form(
        //   clientId: res_data['data']['user']['id'],
        // ));
        Get.offAll(() => MainScreen());
        Get.snackbar(
          'Congratulations',
          'Account Registered Successfully',
          animationDuration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
        );
        // print("bottomctrl.navigationBarIndexValue" +
        //     bottomctrl.navigationBarIndexValue.toString());
        // Navigator.pop(context);
        // if (bottomctrl.navigationBarIndexValue != 3) {
        //   bottomctrl.navBarChange(3);
        // } else {
        //   // Navigator.pop(context);
        //   bottomctrl.navBarChange(0);
      }
    } else {
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
      Navigator.pop(context);
    }

    return res_data;
  }

  login(context, data) async {
    final uri = Uri.parse('${apiGlobal}/api/user/login');
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

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
      if (res_data['data']['user']['email_verified'] == 'No') {
        Get.snackbar(
          'Error',
          'Account Not Verified',
          animationDuration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
        );
        Navigator.pop(context);

        globaltoken = res_data["data"]["token"];
        log('GLOBAL TOKEN: $globaltoken');

        Get.to(OTPScreen(
            userId: res_data['data']['user']['id'],
            email: res_data['data']['user']['email'],
            page: 'login'));
      } else {
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
            isKycFilled: res_data['data']['user']['is_kyc'],
            isCreditFormFilled: res_data['data']['user']['is_creditappform'],
          ),
        );

        globaltoken = res_data["data"]["token"];
        log('GLOBAL TOKEN: $globaltoken');

        userid = res_data['data']['user']['id'].toString();
        // userid = res_data['data']['user']['id'].toString();
        log("USER MODEL" + userController.toString());
        print("nameee :  " + userController.user.propic.toString());

        Navigator.pop(context);

        await DataStorage.getInstance.setSession();
        // if (res_data['data']['user']['is_kyc'] == 0) {
        //   Get.to(kyc_form(
        //     clientId: res_data['data']['user']['id'],
        //   ));
        // } else if (res_data['data']['user']['is_creditappform'] == 0) {
        //   Get.to(credit_form(
        //     clientId: res_data['data']['user']['id'],
        //   ));
        // } else {
          Get.offAll(() => MainScreen());
        // }
      }
    } else {
      Get.snackbar(
        'Error',
        'Wrong Credentials',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
      Navigator.pop(context);
    }

    return res_data;
  }

  homeApi() async {
    final uri = Uri.parse('${apiGlobal}/api/front/products-groupbyname');
    print(uri);

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
    var res_data = json.decode(response.body);
    // log("front products"+ res_data.toString());
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

    try {
      log("res print" + res.body.toString());
      // var res_data = json.decode(res.body);
      Map<String, dynamic> res_data = jsonDecode(res.body);

      log("res print2 ${res_data}");
      log("res print1 ${res_data['data']}");

      if (res_data['status'] == true) {
        UserController userController = Get.put(UserController());

        userController.addUser(
          UserModel(
            id: res_data['id'],
            fullName: res_data['data']['full_name'],
            phone: res_data['data']['phone'],
            email: res_data['data']['email'],
            propic: res_data['data']['propic'],
            city: res_data['data']['city'],
            country: res_data['data']['country'],
            description: res_data['data']['description'],
          ),
        );

        Get.snackbar(
          'Success',
          'Profile updated successfully',
          animationDuration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
        );
        Navigator.pop(context);
        Get.to(() => MainScreen());
      }
      return res_data;
    } catch (e) {
      log("UPDATEPROFILE Exception Caught: $e");
      Get.snackbar(
        'Failed',
        'Profile updation failed',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
      Navigator.pop(context);
      return true;
    }
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

  TaxCertificates_listSyncPDF(context, id) async {
    final uri = Uri.parse('${apiGlobal}/api/user/tax-cert-details/${id}');
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

  logout(context) async {
    final uri = Uri.parse('${apiGlobal}/api/user/logout');

    print(uri);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
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

  singleProductDetails(context, productId) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
    final uri =
        Uri.parse('${apiGlobal}/api/front/products/${productId}');

    log("SINGLE PRODUCT DETAILS: ${uri.toString()}");

    final headers = {'Authorization': 'bearer ${globaltoken}'};

    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    log("SINGLE PRODUCT DETAILS STATUS CODE: ${response.statusCode}");
    var res_data = json.decode(response.body);

    log("SINGLE PRODUCT DETAILS RES DATA: $res_data");

    // print(res_data);
    if (res_data["status"] == true) {
      Navigator.pop(context);
    }
    // } else
    //   Get.snackbar(
    //     'Error',
    //     'Wrong Credentials',
    //     animationDuration: Duration(seconds: 2),
    //     snackPosition: SnackPosition.BOTTOM,
    //   );

    return res_data;
  }

  creditFormApi(context, sendData) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    var jsonBody = jsonEncode(sendData);

    log('CREDIT API : $jsonBody');
    final uri = Uri.parse('${apiGlobal}/api/user/credit-application-submit');

    log("GLOBALTOKEN: " + globaltoken.toString());

    // var jsonBodya = jsonEncode(sendData);
    // log("sendData data value " + jsonBodya.toString());
    http.Response response = await http.post(
      uri,
      headers: globalHeaders1,
      body: sendData,
    );

    var res_data = json.decode(response.body);

    log("response.body res_data" + response.body.toString());

    log(res_data.toString());

    if (res_data["status"] == true) {
      Get.offAll(() => MainScreen());
      Get.snackbar(
        'Success',
        'Your credit form submitted successfully',
        animationDuration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      try {
        log('${res_data['error']}');
        Get.snackbar(
          'Failed',
          res_data['error'],
          animationDuration: Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
        );
      } on Exception catch (e) {
        log('Credit Form Api caught exception: $e');
      }
    }

    return res_data;
  }

  getQuoteRequest(context, sendData) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    var jsonBody = json.encode(sendData);

    var getId = sendData['product_id'];

    final uri =
        Uri.parse('${apiGlobal}/api/user/product/${getId}/quotation-request');

    print("GET QUOTE REQUEST $uri $jsonBody");
    log("GET QUOTE REQUEST GLOBAL TOKEN: " + globaltoken.toString());

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${globaltoken}',
    };

    http.Response response = await http.post(
      uri,
      headers: globalHeaders1,
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
    } else {
      try {
        log('GET QUOTE REQUEST Failed: ${res_data['error'].toString()}');
        Get.snackbar(
          'Failed',
          res_data['error'].toString(),
          animationDuration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
        );
        Navigator.pop(context);
      } on Exception catch (e) {
        log('GET QUOTE REQUEST Exception caught: $e');
      }
    }
  }

  setNewPassword(context, data) async {
    print(data);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    //print('${apiGlobal}/auth/register');
    final uri = Uri.parse('${apiGlobal}/api/user/forgot');
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    //print(response.statusCode);

    var res_data = json.decode(response.body.toString());
    print("email " + res_data.toString());
    if (res_data['status'] == true) {
      Get.snackbar(
        'Success',
        "Check Email for OTP Code",
        snackPosition: SnackPosition.TOP,
      );

      Get.to(() => ForgotPasswordScreen(
            userId: res_data['data']['user_id'],
            email: data["email"],
            otp: res_data['data']['reset_token'],
          ));
    } else {
      Get.back();

      Get.snackbar(
        'Error',
        "Invalid Email Address",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
    }
  }

  setNewForgotPassword(context, data) async {
    print(data);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    //print('${apiGlobal}/auth/register');
    final uri = Uri.parse('${apiGlobal}/api/user/forgot/submit');
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    //print(response.statusCode);

    var res_data = json.decode(response.body.toString());
    print("email " + res_data.toString());
    if (res_data['status'] == true) {
      Get.snackbar(
        'Success',
        "Password Changed Successfully",
        snackPosition: SnackPosition.TOP,
      );

      Get.to(() => EmailLoginScreen());
    } else {
      Get.back();

      Get.snackbar(
        'Error',
        "Invalid Email Address",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
    }
  }

  placeOrder(context, sendData) async {
    // var jsonBody = jsonEncode(sendData);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
    // log("place order jsonbody" + jsonBody.toString());
    var getId = sendData['quote_id'];
    log("place order get quote id ${getId}");
    var currentFileType = sendData['fileType'];
    var attachmentType = '';
    final uri = Uri.parse('${apiGlobal}/api/user/order-lease/${getId}');
    var request = http.MultipartRequest('POST', uri);

    var headers = {'Authorization': "bearer " + globaltoken};

    if (sendData['tax_file'] != null) {
      print(sendData['tax_file'].toString());
      // print(sendData['tax_file'].path.toString());
      // 'jpg', 'pdf', 'doc','docx','png'
      if (currentFileType == 'jpg' || currentFileType == 'png') {
        attachmentType = 'image';
      } else {
        attachmentType = 'application';
      }
      var multipartFile = await http.MultipartFile.fromPath(
          'tax_file', sendData['tax_file'],
          filename: sendData['tax_file'].split('/').last,
          contentType: MediaType(attachmentType, currentFileType));
      request.files.add(multipartFile);
    }

    request.fields.addAll({
      'day': sendData['day'],
      'month': sendData['month'],
      'customer_name': sendData['customer_name'],
      'customer_location': sendData['customer_location'],
      'stand_manufacturer': sendData['stand_manufacturer'],
      'stand_color': sendData['stand_color'],
      'stand_type': sendData['stand_type'],
      'stand_serial_number': sendData['stand_serial_number'],
      'stand_quantity': sendData['stand_quantity'],
      'delivery_location': sendData['delivery_location'],
      'delivery_date': sendData['delivery_date'],
      'daily_rent': sendData['daily_rent'],
      'replacement_value': sendData['replacement_value'],
      'security_deposit': sendData['security_deposit'],
      'guarantor': sendData['guarantor'],
      'registered_agent': sendData['registered_agent'],
      'signature_1': sendData['signature_1'],
      'signature_2': sendData['signature_2']
    });
    String jsonBody = json.encode(request.fields);
    log("Request " + jsonBody.toString());
    request.headers.addAll(headers);
    log("request" + request.toString());
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    log("res print" + res.body.toString());
    var res_data = json.decode(res.body.toString());

    return res_data;
  }

  previewPDF(context, id) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/api/user/tax-cert-details/${id}');

    print(uri);
    final headers = {
      'Authorization': 'Bearer ${globaltoken}',
    };
    http.Response response = await http.get(
      uri,
      headers: headers,
    );

    print("response.body" + json.decode(response.body).toString());

    var res_data = json.decode(response.body);
    return res_data;
  }

  deleteAccount() async {
    final uri = Uri.parse('${apiGlobal}/api/user/delete');
    print(uri);

    final headers = {
      'Authorization': 'bearer ${globaltoken}',
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
    );

    print(response.statusCode);
    var res_data = json.decode(response.body);
    print(res_data);
    if (res_data["status"] == true) {
      print(res_data['data'].length);
      Get.back();
      Get.snackbar(
        'Success',
        'Account Deleted Successfully',
        animationDuration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
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

  wireTransfer(context, data) async {
    print(data);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    //print('${apiGlobal}/auth/register');
    final uri =
        Uri.parse('${apiGlobal}/api/user/pay-wire/${placeOrderData_quote_id}');
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    //print(response.statusCode);

    var res_data = json.decode(response.body.toString());
    print("email " + res_data.toString());
    return res_data;
  }

  orderDetails(orderID) async {
    final uri = Uri.parse('${apiGlobal}/api/user/order/${orderID}/details');
    print(uri);

    final headers = {
      'Authorization': 'bearer ${globaltoken}',
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
    );

    print(response.statusCode);
    var res_data = json.decode(response.body);
    print(res_data);

    return res_data;
  }

  get_messages(context) async {
    final uri = await Uri.parse(
        'https://standsaero-dev.jumppace.com/chatify/api/fetchMessages');

    print(uri);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer ${globaltoken}',
    };
    String jsonBody = json.encode({'id': 1});
    // print("jsonbody" + jsonBody);
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    // log("response status code ${response.body}");
    var res_data = json.decode(response.body);
    print(res_data);
    // if (res_data["status"] == true) {
    // } else
    //   Get.snackbar(
    //     'Error',
    //     'Wrong Credentials',
    //     animationDuration: Duration(seconds: 2),
    //     snackPosition: SnackPosition.BOTTOM,
    //   );

    return res_data;
  }

  send_messages(context, data) async {
    final uri = await Uri.parse(
        'https://standsaero-dev.jumppace.com/chatify/api/sendMessage');

    String jsonBody = json.encode(data);
    print("jsonBody" + jsonBody);
    final headers = {
      'Authorization': 'Bearer ${globaltoken}',
    };
    var request = http.MultipartRequest('POST', uri);
    request.fields['id'] = data['id'].toString();
    request.fields['type'] = data['type'].toString();
    request.fields['message'] = data['message'].toString();
    request.fields['temporaryMsgId'] = data['temporaryMsgId'].toString();

    log("Request " + jsonBody.toString());
    request.headers.addAll(headers);
    log("request" + request.toString());
    var response = await request.send();

    final res = await http.Response.fromStream(response);

    print("send messages print" + res.body.toString());
    // https://standsaero-dev.jumppace.com/chatify/api/sendMessage
  }

  getnotifications() async {
    final uri = Uri.parse('${apiGlobal}/api/user/getnotifications');
    print(uri);
    final headers = {
      'Authorization': 'Bearer ${globaltoken}',
    };
    http.Response response = await http.get(
      uri,
      headers: headers,
      // body: jsonBody,
    );

    print(response.statusCode);
    var res_data = json.decode(response.body);
    // print("notifications response" + res_data.toString());
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

  void otpVerification(BuildContext context, data) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/api/user/verify');
    print(uri);
    var request = http.MultipartRequest('POST', uri);
    request.fields['otp'] = data['otp'].toString();
    var headers = {'Authorization': "Bearer " + globaltoken};

    request.headers.addAll(headers);
    log("request" + request.toString());
    String jsonBody = json.encode(request.fields);
    var response = await request.send();

    final res = await http.Response.fromStream(response);
    print(res);

    Map<String, dynamic> res_data = jsonDecode(res.body);
    log("res print1 ${res_data['data']}");

    if (res_data['status'] == true) {
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
          isKycFilled: res_data['data']['user']['is_kyc'],
          isCreditFormFilled: res_data['data']['user']['is_creditappform'],
        ),
      );

      // globaltoken = res_data["data"]["token"];
      log('GLOBAL TOKEN: ${globaltoken}');

      userid = res_data['data']['user']['id'].toString();
      // userid = res_data['data']['user']['id'].toString();
      log("USER MODEL" + userController.toString());
      print("nameee :  " + userController.user.propic.toString());

      Navigator.pop(context);

      await DataStorage.getInstance.setSession();
      // if (res_data['data']['user']['is_kyc'] == 0) {
      //   Get.to(kyc_form(
      //     clientId: res_data['data']['user']['id'],
      //   ));
      // } else if (res_data['data']['user']['is_creditappform'] == 0) {
      //   Get.to(credit_form(
      //     clientId: res_data['data']['user']['id'],
      //   ));
      // } else {
      Get.offAll(() => MainScreen());
      // }

      // Navigator.pop(context);
    }
  }


  resendOTP(context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });


    final uri = Uri.parse('${apiGlobal}/api/user/resend');

    print(uri);
    final headers = {
      'Authorization': 'Bearer ${globaltoken}',
    };
    print(headers);
    http.Response response = await http.get(
      uri,
      headers: headers,
    );

    print("response.body" + json.decode(response.body).toString());
    Navigator.pop(context);
    var res_data = json.decode(response.body);
    print("res_data" + res_data.toString());
    return res_data;
  }
}
