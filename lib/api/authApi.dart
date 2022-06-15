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
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        ////  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      ////  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> changeAddressapi({
    String processid = "",
    String addressid = "",
  }) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${base}update-subscription-add.php"),
              // headers: {"Content-Type": "application/json"},
              body: {"process_id": processid, "address_id": addressid});
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
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
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
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
      String referral = "",
      String shopownername = ""}) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${base}save-account-bo.php"),
              // headers: {"Content-Type": "application/json"},
              body: {
            "name": shopownername,
            "mobile": shopownerphone,
            "email": shopowneremail,
            "password": pwd,
            "baby_name": babyname,
            "baby_dob": babydob,
            "reerral": referral,
          });
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> editProfile(
      {String email = "",
      String phone = "",
      String babyname = "",
      String babydob = "",
      String name = ""}) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${base}update-profile-bo.php"), body: {
        'account_id': userCred.getUserId(),
        "name": name,
        "phone": phone,
        "email": email,
        "baby_name": babyname,
        "baby_dob": babydob,
      });
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
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
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> dologinvERIFY({String otp = "", String accid = ""}) async {
    var client = http.Client();
    try {
      // print(accid);
      // print(otp);
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/verify-otp.php"),
          body: {"account_id": accid, "otp": otp});
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> doSaveAddress(
      {String address = "",
      String name = "",
      String pincode = "",
      String landmark = "",
      String state = "",
      String phone = ""}) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/add-new-address.php"),
          body: {
            "user_id": userCred.getUserId(),
            "full_address": address,
            'pincode': pincode,
            'name': name,
            'landmark': landmark,
            'phone': phone,
            'state': state
          });
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> doEditAddress(
      {String address = "",
      String name = "",
      String pincode = "",
      String landmark = "",
      String state = "",
      String add_id = "",
      String phone = ""}) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/update-address-bo.php"),
          body: {
            "user_id": userCred.getUserId(),
            "full_address": address,
            'pincode': pincode,
            'landmark': landmark,
            'phone': phone,
            'state': state,
            'address_id': add_id,
            'name': name
          });
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> addQuestion({String question = ""}) async {
    var client = http.Client();
    try {
      final response = await client
          .post(Uri.parse("${base}add-community-question.php"), body: {
        "account_id": userCred.getUserId(),
        "question": question,
      });
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> deleteAddress({String addresssid = ""}) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${base}delete-address-bo.php"), body: {
        "account_id": userCred.getUserId(),
        "address_id": addresssid,
      });
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> contactForm(
      {String name = "",
      String phone = "",
      String email = "",
      String msg = ""}) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${base}add-enquiry-form.php"), body: {
        "account_id": userCred.getUserId(),
        "name": name,
        "email": email,
        "phone": phone,
        "msg": msg,
      });
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> addAnswer({
    String answer = "",
    String ques_id = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client
          .post(Uri.parse("${base}add-community-answer.php"), body: {
        "account_id": userCred.getUserId(),
        "question_id": ques_id,
        'answer': answer
      });
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }
}
