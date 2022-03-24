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
}
