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

  Future<MyOrderModal> fetchMyOrder() async {
    final response = await homeApi.fetchMyOrder();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return MyOrderModal(jsonResponse);
  }

  Future<BrandModal> fetchHomebrand() async {
    final response = await homeApi.fetchHomebrand();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return BrandModal(jsonResponse);
  }

  Future<MonthsModal> getMonths() async {
    final response = await homeApi.getMonths();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return MonthsModal(jsonResponse);
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

  Future<AddressModal> fetchaddess() async {
    final response = await homeApi.fetchaddess();
    var jsonResponse = jsonDecode(response.body) as Map;
    return AddressModal(jsonResponse);
  }

  Future<WalletModal> fetchWalletbalance() async {
    final response = await homeApi.fetchWalletbalance();
    var jsonResponse = jsonDecode(response.body) as List;
    return WalletModal(jsonResponse);
  }

  Future<WallettransModal> fetchWalletTransaction() async {
    final response = await homeApi.fetchWalletTransaction();
    var jsonResponse = jsonDecode(response.body) as Map;
    return WallettransModal(jsonResponse);
  }

  Future<BundleitemModal> fetchbundleItems(String id) async {
    final response = await homeApi.fetchbundleItems(id);
    var jsonResponse = jsonDecode(response.body) as List;
    return BundleitemModal(jsonResponse);
  }

  Future<Myordermodal> fetchOrderdetails(String id) async {
    final response = await homeApi.fetchOrderdetails(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return Myordermodal(jsonResponse);
  }

  Future<Myordermodal> fetchSubsdetails(String id) async {
    final response = await homeApi.fetchSubsdetails(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return Myordermodal(jsonResponse);
  }

  Future<SubsListModal> fetchSublist() async {
    final response = await homeApi.fetchSublist();
    var jsonResponse = jsonDecode(response.body) as List;
    return SubsListModal(jsonResponse);
  }

  Future<UserdetailModal> fetchuserDetails() async {
    final response = await homeApi.fetchuserDetails();
    var jsonResponse = jsonDecode(response.body) as Map;
    return UserdetailModal(jsonResponse);
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
