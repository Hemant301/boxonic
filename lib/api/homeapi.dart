import 'dart:convert';
import 'dart:io';

import 'package:boxoniq/screens/billing.dart';
import 'package:boxoniq/screens/subscription.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/constance.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  var client = http.Client();
  Future<dynamic> fetchHomeSlider() async {
    try {
      final response = await client.get(Uri.parse("${base}slider-bo.php"));
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchHomeBenefits() async {
    try {
      final response =
          await client.get(Uri.parse("${base}get-home-bundle-benefit-bo.php"));
      if (response.statusCode == 200) {
        // //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchSubsBenefit() async {
    try {
      final response =
          await client.get(Uri.parse("${base}get-subscription-benefit-bo.php"));
      if (response.statusCode == 200) {
        //   //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchMyOrder() async {
    try {
      final response = await client.post(Uri.parse("${base}get-order-bo.php"),
          body: {'account_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchsubsHistory() async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-subscription-order-bo.php"),
          body: {'account_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchsubscancelHistory() async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-cancel-subscription-order-bo.php"),
          body: {'account_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchHomebrand() async {
    try {
      final response = await client.get(Uri.parse("${base}brand1-bo.php"));
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> getMonths() async {
    try {
      final response = await client
          .get(Uri.parse("${newBase}boxoniq-crm/api/droid/get-months.php"));
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchHomebrand2() async {
    try {
      final response = await client.get(Uri.parse("${base}brand2-bo.php"));
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchHomecategory() async {
    try {
      final response = await client.get(Uri.parse("${base}super-cat-bo.php"));
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchnumbers() async {
    try {
      final response =
          await client.get(Uri.parse("${base}get-contact-detail.php"));
      if (response.statusCode == 200) {
        //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchFilterList(id) async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-brand-subcategory-bo.php"),
          body: {'sequence': id});
      if (response.statusCode == 200) {
        //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchcatItems(String id, String sort, String sort_order,
      String filter, String filtertype, List filterkey, List subkey) async {
    print('$filterkey');
    print('$subkey');
    try {
      final response = await client
          .post(Uri.parse("${base}product-super-cat-bo-filter.php"), body: {
        'sequence': id,
        'sort': sort,
        'sort_key': sort_order,
        'filter': filter,
        // 'filter_type': filtertype,
        'brand_key': filterkey.toString(),
        'sub_key': subkey.toString(),
      });
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchProduct(String id) async {
    try {
      final response = await client.post(
          Uri.parse("${base}product-detail-bo.php"),
          body: {'product_id': id});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchComments(String id) async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-rating-list.php"),
          body: {'product_id': id});
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchproductInit(id) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${base}product-detail-bo.php"),
          body: {'product_id': id});
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> saveComments(
      {String rate = "", String p_id = "", String comment = ""}) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${base}save-rating-bo.php"), body: {
        'account_id': userCred.getUserId(),
        'rating': rate,
        'product_id': p_id,
        'comment': comment
      });
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> fetchbundleItems(String id) async {
    try {
      final response = await client
          .post(Uri.parse("${base}get-cart-bo.php"), body: {'account-id': id});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchOrderdetails(String id) async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-order-details-bo.php"),
          body: {'process_id': id});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchsubsdetails(String id) async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-order-details-subscription-bo.php"),
          body: {'process_id': id});
      if (response.statusCode == 200) {
        //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchAddress() async {
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/get-all-address.php"),
          body: {'account_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchState() async {
    try {
      final response = await client.get(
        Uri.parse("${base}get-states-bo.php"),
      );
      if (response.statusCode == 200) {
        //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchSubsdetails(String id) async {
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/get-order-details-subscription-bo.php"),
          body: {'process_id': id});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchSublist() async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-order-subscription-bo.php"),
          body: {'account_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        //   print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchuserDetails() async {
    try {
      final response = await client.post(Uri.parse("${base}get-user-bo.php"),
          body: {'user_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchanswerDetails(id) async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-community-answers.php"),
          body: {'question_id': id});
      if (response.statusCode == 200) {
        //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchMydetails() async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${base}get-user-bo.php"), body: {
        'user_id': userCred.getUserId(),
      });
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> fetchcalAmount() async {
    try {
      final response = await client.post(
          Uri.parse(
              "${newBase}boxoniq-crm/api/droid/get-total-amount-with-discount.php"),
          body: {'account-id': userCred.getUserId()});
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchWhyBoxonic() async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-why-section.php"),
          body: {'account-id': userCred.getUserId()});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchFaq() async {
    try {
      final response = await client.get(
        Uri.parse("${base}get-faq-bo.php"),
      );
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);

    } finally {}
  }

  // Future<dynamic> fetchTotalAmount() async {
  //   try {
  //     final response = await client.post(
  //         Uri.parse(
  //             "${newBase}boxoniq-crm/api/droid/get-total-amount-with-discount.php"),
  //         body: {'account-id': userCred.getUserId()});
  //     if (response.statusCode == 200) {
  //       // // ////   print(response.body);
  //       return jsonDecode(response.body) as Map;
  //     } else {
  //       // //   print('Request failed with status: ${response.statusCode}.');
  //     }
  //   } catch (e) {
  //     // // print(e);
  //   } finally {}
  // }

  Future<dynamic> fetchTotalAmount() async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "${newBase}boxoniq-crm/api/droid/get-total-amount-with-discount.php"),
          body: {'account-id': userCred.getUserId()});

      if (response.statusCode == 200) {
        // ////   print(response.body);
        return jsonDecode(response.body) as List;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> fetchSerach(s) async {
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/search-super-cat-bo.php"),
          body: {'query': s});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> searchinit(s) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/search-super-cat-bo.php"),
          body: {
            'query': s,
          });
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> fetchaddess() async {
    try {
      final response = await client.post(
          Uri.parse("${base}fetch-saved-address-vue.php"),
          body: {'user_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchaddessHome() async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/get-all-address.php"),
          body: {'account_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> checkAlreadysubs() async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${base}/check_subscription.php"),
          body: {'user_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> fetchWalletbalance() async {
    try {
      final response = await client.post(
          Uri.parse("${newBase}boxoniq-crm/api/droid/get-user-wallet.php"),
          body: {'account-id': userCred.getUserId()});
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchWalletTransaction() async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-wallet-history.php"),
          body: {'user_id': userCred.getUserId()});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchBlogdetails(id) async {
    try {
      final response = await client
          .post(Uri.parse("${base}get-blog-detail.php"), body: {'blog_id': id});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchquestions(s) async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-community-questions.php"),
          body: {'is_limit': s});
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchBlogList() async {
    try {
      final response = await client.get(
        Uri.parse("${base}get-blogs-bo.php"),
      );
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchStories(s) async {
    try {
      final response = await client
          .post(Uri.parse("${base}get-stories-bo.php"), body: {'search': s});
      if (response.statusCode == 200) {
        //   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> trackOrder(s) async {
    try {
      final response = await client.post(
          Uri.parse("${base}picker_track_api_link.php"),
          body: {'track_id': s});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        //    print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchcommunitySearch(s) async {
    try {
      final response = await client.post(
          Uri.parse("${base}get-community-search-questions.php"),
          body: {'search': s});
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchcommunityall() async {
    try {
      final response = await client.get(
        Uri.parse("${base}get-community-questions.php"),
      );
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> applyCoupons({String total = "", String coupon = ""}) async {
    try {
      final response =
          await client.post(Uri.parse("${base}apply-coupon-bo.php"),
              // headers: {"Content-Type": "application/json"},
              body: {
            "account_id": userCred.getUserId(),
            // "total": total,
            'coupon': coupon
          });
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchGetCoupons() async {
    try {
      final response = await client.get(
        Uri.parse("${base}get-coupon-bo.php"),
      );
      if (response.statusCode == 200) {
        ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> fetchcatItemsinIt(String id, String sort, String sort_order,
      String filter, String filtertype, String filterkey) async {
    var client = http.Client();
    try {
      final response = await client
          .post(Uri.parse("${base}product-super-cat-bo-filter.php"), body: {
        'sequence': id,
        'sort': sort,
        'sort_key': sort_order,
        'filter': filter,
        'filter_type': filtertype,
        'filter_key': filterkey
      });
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> updateQuantity(
      {String qty = "",
      String cartid = "",
      String attr_price = "",
      String process = ""}) async {
    var client = http.Client();
    try {
      print(qty);
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/qty-update.php"),
          body: {
            'qty': qty,
            'cart_id': cartid,
            'attr_price': attr_price,
            'process_id': process
          });
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> updateAttr(
      {String attrid = "",
      String cartid = "",
      String item_id = "",
      String processid = "",
      String attrprice = "",
      String qty = ""}) async {
    var client = http.Client();
    try {
      print(attrid);
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/attr-update.php"),
          body: {
            'attr_id': attrid,
            'cart_id': cartid,
            'item_id': item_id,
            'attr_price': attrprice,
            'process_id': processid,
            'qty': qty
          });
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> deletecartItem(String p_id) async {
    print(p_id);
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/cart-remove-item-checkout.php"),
          body: {'cart-id': p_id});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> skipSubs(String p_id) async {
    print(p_id);
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/skip-subscription.php"),
          body: {'process_id': p_id});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> cancelSubs(String p_id) async {
    print(p_id);
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/cancel-item-sub.php"),
          body: {'process_id': p_id});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> deletesubsItem(String p_id, String process) async {
    print(p_id);
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${newBase}boxoniq-crm/api/droid/remove-cart-item.php"),
          body: {'cart_id': p_id, 'process_id': process});
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return jsonDecode(response.body) as List;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> addToCart({
    String p_id = "",
    String qty = "",
    String attr_id = "",
    String userid = "",
  }) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${base}add-to-cart-bo.php"), body: {
        'user_id': userid,
        'qty': qty,
        'attr_id': attr_id,
        'product_id': p_id,
      });
      if (response.statusCode == 200) {
        //   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> addTobundle({
    String p_id = "",
    String qty = "",
    String attr_id = "",
    String userid = "",
    String process = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse(
              "https://cms.cybertizeweb.com/boxoniq-crm/api/droid/add_items.php"),
          body: {
            'user_id': userid,
            'qty': qty,
            'attr_id': attr_id,
            'product_id': p_id,
            'process_id': process
          });
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> doPayment({
    String amount = "",
    String subs = "",
    String month = "",
    String addressid = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client
          .post(Uri.parse("${base}checkout-with-payment-wallet-bo.php"), body: {
        'account_id': userCred.getUserId(),
        'total_cart_value': amount,
        'subscription': subs,
        'address_id': addressid,
        'subscription_month': month,
        'is_coupon': is_coupon,
        'coupon_id': coupon_Id
      });
      if (response.statusCode == 200) {
        // ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> getProcessid() async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${droidBase}get-subscription-process-id.php"),
          body: {
            'account_id': userCred.getUserId(),
          });
      if (response.statusCode == 200) {
        ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> cancelMyorder(id) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${base}cancel-order-bo.php"),
          body: {'user_id': userCred.getUserId(), 'process_id': id});
      if (response.statusCode == 200) {
        //   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> stayinTouch(email) async {
    var client = http.Client();
    try {
      final response = await client.post(Uri.parse("${base}add-home-email.php"),
          body: {'user_id': userCred.getUserId(), 'email': email});
      if (response.statusCode == 200) {
        //   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> getNumberofquestion() async {
    var client = http.Client();
    try {
      final response = await client.get(
        Uri.parse("${base}get-community-question-count.php"),
      );
      if (response.statusCode == 200) {
        ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> doPaymentOnline({
    String amount = "",
    String subs = "",
    String month = "",
    String addressid = "",
    String paymentid = "",
    String is_wallet = "",
    String monthamount = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client
          .post(Uri.parse("${base}checkout-with-payment-bo.php"), body: {
        'account_id': userCred.getUserId(),
        'total_cart_value': amount,
        'subscription': subs,
        'address_id': addressid,
        'subscription_month': month,
        'cashfree_payment_id': paymentid,
        'month_amount_value': monthamount,
        'is_wallet': is_wallet,
        'is_coupon': is_coupon,
        'coupon_id': coupon_Id
      });
      if (response.statusCode == 200) {
        ////   print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      // print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> checkamount() async {
    try {
      final response = await client.post(
          Uri.parse("${newBase}boxoniq-crm/api/droid/get-total-attr-price.php"),
          body: {
            'account-id': userCred.getUserId(),
          });
      if (response.statusCode == 200) {
        // // ////   print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

  Future<dynamic> doUploadProfile(File file, String userid) async {
    var client = http.Client();
    try {
      var request = http.MultipartRequest(
          "POST", Uri.parse("${base}profile-thumbnail-uploader.php"));
      //add text fields Uri.parse("http://192.168.29.30:8000/ajaxFile.php")
      request.fields["user_id"] = userid;
      //create multipart using filepath, string or bytes
      var pic = await http.MultipartFile.fromPath("thumbnail", file.path);
      //add multipart to request
      request.files.add(pic);
      var response = await request.send();

      //Get the response from the server
      var responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);
      print(responseString);
      return jsonDecode(responseString) as Map;
    } catch (e) {
      // print(e);
      rethrow;
    } finally {
      client.close();
    }
  }
}

final homeApi = HomeApi();
