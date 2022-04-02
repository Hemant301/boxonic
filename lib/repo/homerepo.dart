import 'dart:convert';

import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';

class HomeRepo {
  HomeApi homeApi = HomeApi();
  Future<HomeSlider> fetchHomeSlider() async {
    final response = await homeApi.fetchHomeSlider();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return HomeSlider(jsonResponse);
  }

  Future<BrandModal> fetchHomebrand() async {
    final response = await homeApi.fetchHomebrand();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return BrandModal(jsonResponse);
  }

  Future<BrandModal> fetchHomebrand2() async {
    final response = await homeApi.fetchHomebrand2();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return BrandModal(jsonResponse);
  }

  Future<HomeCategoryModal> fetchHomecategory() async {
    final response = await homeApi.fetchHomecategory();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return HomeCategoryModal(jsonResponse);
  }

  Future<CategoryItemModal> fetchcatItems(String id) async {
    final response = await homeApi.fetchcatItems(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return CategoryItemModal(jsonResponse);
  }

  Future<BundleitemModal> fetchbundleItems(String id) async {
    final response = await homeApi.fetchbundleItems(id);
    var jsonResponse = jsonDecode(response.body) as List;
    return BundleitemModal(jsonResponse);
  }

  Future<CalAmountModal> fetchcalAmount() async {
    final response = await homeApi.fetchcalAmount();
    var jsonResponse = jsonDecode(response.body) as List;
    return CalAmountModal(jsonResponse);
  }

  Future<CheckAmountModal> checkamount() async {
    final response = await homeApi.checkamount();
    var jsonResponse = jsonDecode(response.body) as Map;
    return CheckAmountModal(jsonResponse);
  }
}
