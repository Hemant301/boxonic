import 'dart:convert';

// import 'package:http/http.dart' show Client, Response;

import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/constance.dart';
import 'package:http/http.dart' as http;

class Walletapi {
  Future<dynamic> doSuccessPayment({
    String amount = "",
    String txnid = "",
  }) async {
    var client = http.Client();
    try {
      print('this is nik api');

      final response = await client
          .post(Uri.parse("${base}add-amount-wallet.php"), body: {
        "user_id": userCred.getUserId(),
        "amount": amount,
        "tran_id": txnid
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

  Future<dynamic> initTokenCashfree(
      {String amount = "", String orderId = ""}) async {
    var client = http.Client();
    try {
      final response = await client.post(Uri.parse("${base}cash-free.php"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            // "user_id": userCred.getUserId(),
            "amount": amount,
            "order_id": orderId
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
}

final walletApi = Walletapi();
