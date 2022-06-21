import 'dart:convert';

import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/blogmodal.dart';
import 'package:boxoniq/modal/homemodal.dart';

class HomeRepo {
  HomeApi homeApi = HomeApi();
  Future<HomeSlider> fetchHomeSlider() async {
    final response = await homeApi.fetchHomeSlider();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return HomeSlider(jsonResponse);
  }

  Future<HomebenefitsModal> fetchHomeBenefits() async {
    final response = await homeApi.fetchHomeBenefits();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return HomebenefitsModal(jsonResponse);
  }

  Future<SubsbenefitsModal> fetchSubsBenefit() async {
    final response = await homeApi.fetchSubsBenefit();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return SubsbenefitsModal(jsonResponse);
  }

  Future<MyOrderModal> fetchMyOrder() async {
    final response = await homeApi.fetchMyOrder();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return MyOrderModal(jsonResponse);
  }

  Future<MyOrderModal> fetchsubsHistory() async {
    final response = await homeApi.fetchsubsHistory();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return MyOrderModal(jsonResponse);
  }

  Future<MyOrderModal> fetchsubscancelHistory() async {
    final response = await homeApi.fetchsubscancelHistory();
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

  Future<NumberModal> fetchnumbers() async {
    final response = await homeApi.fetchnumbers();
    var jsonResponse = jsonDecode(response.body) as Map;
    return NumberModal(jsonResponse);
  }

  Future<FilterModal> fetchFilterList(id) async {
    final response = await homeApi.fetchFilterList(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return FilterModal(jsonResponse);
  }

  Future<CategoryItemModal> fetchcatItems(
      String id,
      String sort,
      String sort_order,
      String filter,
      String filtertype,
      List filterkey,
      List subkey) async {
    final response = await homeApi.fetchcatItems(
        id, sort, sort_order, filter, filtertype, filterkey, subkey);
    var jsonResponse = jsonDecode(response.body) as Map;
    return CategoryItemModal(jsonResponse);
  }

  Future<ProductModal> fetchProduct(String id) async {
    final response = await homeApi.fetchProduct(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return ProductModal(jsonResponse);
  }

  Future<CommmentModal> fetchComments(String id) async {
    final response = await homeApi.fetchComments(id);
    var jsonResponse = jsonDecode(response.body) as List;
    return CommmentModal(jsonResponse);
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

  Future<BlogdetailsModal> fetchBlogdetails(id) async {
    final response = await homeApi.fetchBlogdetails(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return BlogdetailsModal(jsonResponse);
  }

  Future<Questionmodal> fetchquestions(s) async {
    final response = await homeApi.fetchquestions(s);
    var jsonResponse = jsonDecode(response.body) as List;
    return Questionmodal(jsonResponse);
  }

  Future<BlogModal> fetchBlogList() async {
    final response = await homeApi.fetchBlogList();
    var jsonResponse = jsonDecode(response.body) as List;
    return BlogModal(jsonResponse);
  }

  Future<StoryModal> fetchStories(s) async {
    final response = await homeApi.fetchStories(s);
    var jsonResponse = jsonDecode(response.body) as List;
    return StoryModal(jsonResponse);
  }

  Future<TrackModal> trackOrder(s) async {
    final response = await homeApi.trackOrder(s);
    var jsonResponse = jsonDecode(response.body) as List;
    return TrackModal(jsonResponse);
  }

  Future<Questionmodal> fetchcommunitySearch(s) async {
    final response = await homeApi.fetchcommunitySearch(s);
    var jsonResponse = jsonDecode(response.body) as List;
    return Questionmodal(jsonResponse);
  }

  Future<Questionmodal> fetchcommunityall() async {
    final response = await homeApi.fetchcommunityall();
    var jsonResponse = jsonDecode(response.body) as List;
    return Questionmodal(jsonResponse);
  }

  // Future<CouponModal> fetchCoupons(
  //     {String total = "", String coupon = ""}) async {
  //   final response = await homeApi.fetchCoupons(total: total, coupon: coupon);
  //   var jsonResponse = jsonDecode(response.body) as Map;
  //   return CouponModal(jsonResponse);
  // }

  Future<BundleitemModal> fetchbundleItems(String id) async {
    final response = await homeApi.fetchbundleItems(id);
    var jsonResponse = jsonDecode(response.body) as List;
    return BundleitemModal(jsonResponse);
  }

  Future<CouponModal> fetchGetCoupons() async {
    final response = await homeApi.fetchGetCoupons();
    var jsonResponse = jsonDecode(response.body) as List;
    return CouponModal(jsonResponse);
  }

  Future<Myorderdetailmodal> fetchOrderdetails(String id) async {
    final response = await homeApi.fetchOrderdetails(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return Myorderdetailmodal(jsonResponse);
  }

  Future<Myorderdetailmodal> fetchsubsdetails(String id) async {
    final response = await homeApi.fetchsubsdetails(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return Myorderdetailmodal(jsonResponse);
  }

  Future<AddressListModal> fetchAddress() async {
    final response = await homeApi.fetchAddress();
    var jsonResponse = jsonDecode(response.body) as Map;
    return AddressListModal(jsonResponse);
  }

  Future<StateModal> fetchState() async {
    final response = await homeApi.fetchState();
    var jsonResponse = jsonDecode(response.body) as List;
    return StateModal(jsonResponse);
  }

  Future<MySubdetailmodal> fetchSubsdetails(String id) async {
    final response = await homeApi.fetchSubsdetails(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return MySubdetailmodal(jsonResponse);
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

  Future<AnswerModal> fetchanswerDetails(id) async {
    final response = await homeApi.fetchanswerDetails(id);
    var jsonResponse = jsonDecode(response.body) as List;
    return AnswerModal(jsonResponse);
  }

  Future<CalAmountModal> fetchcalAmount() async {
    final response = await homeApi.fetchcalAmount();
    var jsonResponse = jsonDecode(response.body) as List;
    return CalAmountModal(jsonResponse);
  }

  Future<WhyBoxoniqModal> fetchWhyBoxonic() async {
    final response = await homeApi.fetchWhyBoxonic();
    var jsonResponse = jsonDecode(response.body) as List;
    return WhyBoxoniqModal(jsonResponse);
  }

  Future<FaqModal> fetchFaq() async {
    final response = await homeApi.fetchFaq();
    var jsonResponse = jsonDecode(response.body) as List;
    return FaqModal(jsonResponse);
  }

  Future<SearchModal> fetchSerach(s) async {
    final response = await homeApi.fetchSerach(s);
    var jsonResponse = jsonDecode(response.body) as Map;
    return SearchModal(jsonResponse);
  }

  Future<CheckAmountModal> checkamount() async {
    final response = await homeApi.checkamount();
    var jsonResponse = jsonDecode(response.body) as Map;
    return CheckAmountModal(jsonResponse);
  }
}
