import 'dart:convert';

// import 'package:http/http.dart' show Client, Response;

import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/constance.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  Future<dynamic> doLogin({
    String pwd = "",
    String shopownerphone = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(Uri.parse("${base}make-login-bo.php"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              {"login_email": shopownerphone, "login_password": pwd}));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> doLoginotp({
    String phone = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/login-with-otp.php"),
          body: {
            "phone": phone,
          });
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> doSugnup(
      {String shopowneremail = "",
      String pwd = "",
      String shopownerphone = "",
      String babyname = "",
      String babydob = "",
      String shopownername = ""}) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${base}save-account-bo.php"),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "name": shopownername,
                "mobile": shopownerphone,
                "email": shopowneremail,
                "password": pwd,
                "baby_name": babyname,
                "baby_dob": babydob,
              }));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> doSugnupvERIFY({String otp = "", String accid = ""}) async {
    var client = http.Client();
    try {
      final response = await client.post(Uri.parse("${base}verify-otp-bo.php"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"user_id": accid, "otp": otp}));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> dologinvERIFY({String otp = "", String accid = ""}) async {
    var client = http.Client();
    try {
      print(accid);
      print(otp);
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/verify-otp.php"),
          body: {"account_id": accid, "otp": otp});
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> doSaveAddress(
      {String address = "", String pincode = "", String landmark = ""}) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/add-new-address.php"),
          body: {
            "user_id": userCred.getUserId(),
            "full_address": address,
            'pincode': pincode,
            'landmark': landmark
          });
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }
}
