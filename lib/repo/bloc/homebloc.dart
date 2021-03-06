import 'package:boxoniq/modal/blogmodal.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/homerepo.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  HomeRepo _homeRepo = HomeRepo();
  final BehaviorSubject<HomeSlider> _liveSlider = BehaviorSubject<HomeSlider>();
  BehaviorSubject<HomeSlider> get getHomeSlider => _liveSlider;
  fetchSlider() async {
    try {
      HomeSlider homeSlider = await _homeRepo.fetchHomeSlider();
      // print(homeSlider.imgs!.length);

      _liveSlider.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<HomebenefitsModal> _liveHomeBenefits =
      BehaviorSubject<HomebenefitsModal>();
  BehaviorSubject<HomebenefitsModal> get getHomeBenifits => _liveHomeBenefits;
  fetchHomeBenefits() async {
    try {
      HomebenefitsModal homeSlider = await _homeRepo.fetchHomeBenefits();
      // print(homeSlider.imgs!.length);

      _liveHomeBenefits.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SubsbenefitsModal> _liveSubsBenefits =
      BehaviorSubject<SubsbenefitsModal>();
  BehaviorSubject<SubsbenefitsModal> get getSubsBenifits => _liveSubsBenefits;
  fetchSubsBenefit() async {
    try {
      SubsbenefitsModal homeSlider = await _homeRepo.fetchSubsBenefit();
      // print(homeSlider.imgs!.length);

      _liveSubsBenefits.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<MyOrderModal> _liveMyOrder =
      BehaviorSubject<MyOrderModal>();
  BehaviorSubject<MyOrderModal> get getMyOrder => _liveMyOrder;
  fetchMyOrder() async {
    try {
      MyOrderModal homeSlider = await _homeRepo.fetchMyOrder();
      // print(homeSlider.imgs!.length);

      _liveMyOrder.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<MyOrderModal> _liveMysubHistory =
      BehaviorSubject<MyOrderModal>();
  BehaviorSubject<MyOrderModal> get getSubshistory => _liveMysubHistory;
  fetchsubsHistory() async {
    try {
      _liveMysubHistory.addError('error');
      MyOrderModal homeSlider = await _homeRepo.fetchsubsHistory();
      // print(homeSlider.imgs!.length);

      _liveMysubHistory.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<MyOrderModal> _liveMysucancelbHistory =
      BehaviorSubject<MyOrderModal>();
  BehaviorSubject<MyOrderModal> get getSubcancelshistory =>
      _liveMysucancelbHistory;
  fetchsubscancelHistory() async {
    try {
      _liveMysucancelbHistory.addError('error');
      MyOrderModal homeSlider = await _homeRepo.fetchsubscancelHistory();
      // print(homeSlider.imgs!.length);

      _liveMysucancelbHistory.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<BrandModal> _livebrand = BehaviorSubject<BrandModal>();
  BehaviorSubject<BrandModal> get getHomebrand => _livebrand;
  fetchHomebrand() async {
    try {
      BrandModal homeSlider = await _homeRepo.fetchHomebrand();
      // print(homeSlider.imgs!.length);

      _livebrand.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<MonthsModal> _liveMonths =
      BehaviorSubject<MonthsModal>();
  BehaviorSubject<MonthsModal> get getLiveMonths => _liveMonths;
  getMonths() async {
    try {
      MonthsModal homeSlider = await _homeRepo.getMonths();
      // print(homeSlider.imgs!.length);

      _liveMonths.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<BrandModal> _livebrand2 = BehaviorSubject<BrandModal>();
  BehaviorSubject<BrandModal> get getHomebrand2 => _livebrand2;
  fetchHomebrand2() async {
    try {
      BrandModal homeSlider = await _homeRepo.fetchHomebrand2();
      // print(homeSlider.imgs!.length);

      _livebrand2.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<HomeCategoryModal> _livecategory =
      BehaviorSubject<HomeCategoryModal>();
  BehaviorSubject<HomeCategoryModal> get getHomeCategory => _livecategory;
  fetchHomecategory() async {
    try {
      HomeCategoryModal homeSlider = await _homeRepo.fetchHomecategory();
      // print(homeSlider.imgs!.length);

      _livecategory.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<NumberModal> _livenumber =
      BehaviorSubject<NumberModal>();
  BehaviorSubject<NumberModal> get getnumber => _livenumber;
  fetchnumbers() async {
    try {
      NumberModal homeSlider = await _homeRepo.fetchnumbers();
      // print(homeSlider.imgs!.length);

      _livenumber.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<FilterModal> _liveFilterList =
      BehaviorSubject<FilterModal>();
  BehaviorSubject<FilterModal> get getFilterList => _liveFilterList;
  fetchFilterList(id) async {
    try {
      FilterModal homeSlider = await _homeRepo.fetchFilterList(id);
      // print(homeSlider.imgs!.length);

      _liveFilterList.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<CategoryItemModal> _livecategoryItems =
      BehaviorSubject<CategoryItemModal>();
  BehaviorSubject<CategoryItemModal> get getCategoryitems => _livecategoryItems;
  fetchcatItems(String id, String sort, String sort_order, String filter,
      String filtertype, List filterkey, List subkey) async {
    // _livecategoryItems.addError("Loading");
    try {
      CategoryItemModal homeSlider = await _homeRepo.fetchcatItems(
          id, sort, sort_order, filter, filtertype, filterkey, subkey);
      // print(homeSlider.imgs!.length);

      _livecategoryItems.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<CategoryItemModal> _liveRecommendedItems =
      BehaviorSubject<CategoryItemModal>();
  BehaviorSubject<CategoryItemModal> get getRecommendeditems =>
      _liveRecommendedItems;
  fetchRecommendItems() async {
    // _liveRecommendedItems.addError("Loading");
    try {
      CategoryItemModal homeSlider = await _homeRepo.fetchRecommendItems();
      // print(homeSlider.imgs!.length);

      _liveRecommendedItems.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<ProductModal> _liveProduct =
      BehaviorSubject<ProductModal>();
  BehaviorSubject<ProductModal> get getProduct => _liveProduct;
  fetchProduct(String id) async {
    // _liveProduct.addError("Loading");
    try {
      // _liveProduct.addError('err');
      ProductModal homeSlider = await _homeRepo.fetchProduct(id);
      // print(homeSlider.imgs!.length);

      _liveProduct.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<CommmentModal> _liveComments =
      BehaviorSubject<CommmentModal>();
  BehaviorSubject<CommmentModal> get getComments => _liveComments;
  fetchComments(String id) async {
    // _liveComments.addError("Loading");
    try {
      CommmentModal homeSlider = await _homeRepo.fetchComments(id);
      // print(homeSlider.imgs!.length);

      _liveComments.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<AddressModal> liveAddress =
      BehaviorSubject<AddressModal>();
  BehaviorSubject<AddressModal> get getaddress => liveAddress;
  fetchaddess() async {
    // _liveAddress.addError("Loading");
    try {
      AddressModal homeSlider = await _homeRepo.fetchaddess();
      // print(homeSlider.imgs!.length);

      liveAddress.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<WalletModal> liveWallet =
      BehaviorSubject<WalletModal>();
  BehaviorSubject<WalletModal> get getwallet => liveWallet;
  fetchWalletbalance() async {
    // _liveWallet.addError("Loading");
    try {
      WalletModal homeSlider = await _homeRepo.fetchWalletbalance();
      // print(homeSlider.imgs!.length);

      liveWallet.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<WallettransModal> liveWalletrans =
      BehaviorSubject<WallettransModal>();
  BehaviorSubject<WallettransModal> get getwallettrans => liveWalletrans;
  fetchWalletTransaction() async {
    // _liveWalletrans.addError("Loading");
    try {
      WallettransModal homeSlider = await _homeRepo.fetchWalletTransaction();
      // print(homeSlider.imgs!.length);

      liveWalletrans.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<BlogdetailsModal> liveBlogDetails =
      BehaviorSubject<BlogdetailsModal>();
  BehaviorSubject<BlogdetailsModal> get getBlogDetails => liveBlogDetails;
  fetchBlogdetails(id) async {
    // _liveBlogDetails.addError("Loading");
    try {
      BlogdetailsModal homeSlider = await _homeRepo.fetchBlogdetails(id);
      // print(homeSlider.imgs!.length);

      liveBlogDetails.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<Questionmodal> liveQestion =
      BehaviorSubject<Questionmodal>();
  BehaviorSubject<Questionmodal> get getQuestion => liveQestion;
  fetchquestions(s) async {
    // _liveQestion.addError("Loading");
    try {
      Questionmodal homeSlider = await _homeRepo.fetchquestions(s);
      // print(homeSlider.imgs!.length);

      liveQestion.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<BlogModal> liveBlogList = BehaviorSubject<BlogModal>();
  BehaviorSubject<BlogModal> get getBlogList => liveBlogList;
  fetchBlogList() async {
    // _liveBlogList.addError("Loading");
    try {
      BlogModal homeSlider = await _homeRepo.fetchBlogList();
      // print(homeSlider.imgs!.length);

      liveBlogList.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<StoryModal> liveStories = BehaviorSubject<StoryModal>();
  BehaviorSubject<StoryModal> get getSories => liveStories;
  fetchStories(s) async {
    // _liveStories.addError("Loading");
    try {
      StoryModal homeSlider = await _homeRepo.fetchStories(s);
      // print(homeSlider.imgs!.length);

      liveStories.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<TrackModal> liveTrackorder =
      BehaviorSubject<TrackModal>();
  BehaviorSubject<TrackModal> get getTrackorder => liveTrackorder;
  trackOrder(s) async {
    // _liveTrackorder.addError("Loading");
    try {
      liveTrackorder.addError('erroe');
      TrackModal homeSlider = await _homeRepo.trackOrder(s);
      // print(homeSlider.imgs!.length);

      liveTrackorder.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<Questionmodal> liveCommunitySearch =
      BehaviorSubject<Questionmodal>();
  BehaviorSubject<Questionmodal> get getCommunitySearch => liveCommunitySearch;
  fetchcommunitySearch(s) async {
    // _liveCommunitySearch.addError("Loading");
    try {
      Questionmodal homeSlider = await _homeRepo.fetchcommunitySearch(s);
      // print(homeSlider.imgs!.length);

      liveCommunitySearch.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<Questionmodal> liveCommunityAll =
      BehaviorSubject<Questionmodal>();
  BehaviorSubject<Questionmodal> get getCommunityAll => liveCommunityAll;
  fetchcommunityall(page) async {
    // _liveCommunityAll.addError("Loading");
    try {
      Questionmodal homeSlider = await _homeRepo.fetchcommunityall(page);
      if (liveCommunityAll.hasValue) {
        print('============');
        Questionmodal x = liveCommunityAll.stream.value;

        x.ques.addAll(homeSlider.ques);
        liveCommunityAll.add(x);
      } else {
        liveCommunityAll.add(homeSlider);
      }
      // print(homeSlider.imgs!.length);

    } catch (e) {
      print(e);
    }
  }

  // final BehaviorSubject<CouponModal> liveCoupons =
  //     BehaviorSubject<CouponModal>();
  // BehaviorSubject<CouponModal> get getCoupons => liveCoupons;
  // fetchCoupons({String total = "", String coupon = ""}) async {
  //   // _liveCoupons.addError("Loading");
  //   try {
  //     CouponModal homeSlider =
  //         await _homeRepo.fetchCoupons(total: total, coupon: coupon);
  //     // print(homeSlider.imgs!.length);

  //     liveCoupons.add(homeSlider);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  clear() {
    print('eeeee');
    liveCommunityAll.addError('error');
  }

  final BehaviorSubject<CouponModal> liveGetCoupons =
      BehaviorSubject<CouponModal>();
  BehaviorSubject<CouponModal> get getCouponscode => liveGetCoupons;
  fetchGetCoupons() async {
    // _liveGetCoupons.addError("Loading");
    try {
      CouponModal homeSlider = await _homeRepo.fetchGetCoupons();
      // print(homeSlider.imgs!.length);

      liveGetCoupons.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<BundleitemModal> _liveBundleItems =
      BehaviorSubject<BundleitemModal>();
  BehaviorSubject<BundleitemModal> get getBundleitems => _liveBundleItems;
  fetchbundleItems(String id) async {
    // _liveBundleItems.addError("Loading");
    try {
      BundleitemModal homeSlider = await _homeRepo.fetchbundleItems(id);
      // print(homeSlider.imgs!.length);

      _liveBundleItems.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<Myorderdetailmodal> _liveOrderdetails =
      BehaviorSubject<Myorderdetailmodal>();
  BehaviorSubject<Myorderdetailmodal> get getOrderdetails => _liveOrderdetails;
  fetchOrderdetails(String id) async {
    // _liveOrderdetails.addError("Loading");
    try {
      Myorderdetailmodal homeSlider = await _homeRepo.fetchOrderdetails(id);
      // print(homeSlider.imgs!.length);

      _liveOrderdetails.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<Myorderdetailmodal> _liveSubsdetails =
      BehaviorSubject<Myorderdetailmodal>();
  BehaviorSubject<Myorderdetailmodal> get getSubsdetailss => _liveSubsdetails;
  fetchsubsdetails(String id) async {
    try {
      _liveSubsdetails.addError("Loading");
      Myorderdetailmodal homeSlider = await _homeRepo.fetchsubsdetails(id);
      // print(homeSlider.imgs!.length);

      _liveSubsdetails.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<AddressListModal> _liveAddredd =
      BehaviorSubject<AddressListModal>();
  BehaviorSubject<AddressListModal> get getAddress => _liveAddredd;
  fetchListAddress() async {
    // _liveAddredd.addError("Loading");
    try {
      AddressListModal homeSlider = await _homeRepo.fetchAddress();
      // print(homeSlider.imgs!.length);

      _liveAddredd.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<StateModal> _livestate = BehaviorSubject<StateModal>();
  BehaviorSubject<StateModal> get getstate => _livestate;
  fetchState() async {
    // _livestate.addError("Loading");
    try {
      StateModal homeSlider = await _homeRepo.fetchState();
      // print(homeSlider.imgs!.length);

      _livestate.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<MySubdetailmodal> _liveSubsdetail =
      BehaviorSubject<MySubdetailmodal>();
  BehaviorSubject<MySubdetailmodal> get getSubsdetail => _liveSubsdetail;
  fetchSubsdetails(String id) async {
    // _liveSubsdetail.addError("Loading");
    try {
      // _liveSubsdetail.addError('error');
      MySubdetailmodal homeSlider = await _homeRepo.fetchSubsdetails(id);
      // print(homeSlider.imgs!.length);

      _liveSubsdetail.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SubsListModal> _livesubslist =
      BehaviorSubject<SubsListModal>();
  BehaviorSubject<SubsListModal> get getsubsList => _livesubslist;
  fetchSublist() async {
    // _livesubslist.addError("Loading");
    try {
      SubsListModal homeSlider = await _homeRepo.fetchSublist();
      // print(homeSlider.imgs!.length);

      _livesubslist.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<UserdetailModal> liveuserdetails =
      BehaviorSubject<UserdetailModal>();
  BehaviorSubject<UserdetailModal> get getuserdetails => liveuserdetails;
  fetchuserDetails() async {
    // liveuserdetails.addError("Loading");
    try {
      UserdetailModal homeSlider = await _homeRepo.fetchuserDetails();
      // print(homeSlider.imgs!.length);

      liveuserdetails.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<AnswerModal> liveanswerdetail =
      BehaviorSubject<AnswerModal>();
  BehaviorSubject<AnswerModal> get getanswerdetail => liveanswerdetail;
  fetchanswerDetails(id) async {
    // liveanswerdetail.addError("Loading");
    try {
      AnswerModal homeSlider = await _homeRepo.fetchanswerDetails(id);
      // print(homeSlider.imgs!.length);

      liveanswerdetail.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<CheckAmountModal> _livecheckAmount =
      BehaviorSubject<CheckAmountModal>();
  BehaviorSubject<CheckAmountModal> get getcheckAmount => _livecheckAmount;
  checkamount() async {
    // _livecheckAmount.addError("Loading");
    try {
      CheckAmountModal homeSlider = await _homeRepo.checkamount();
      // print(homeSlider.imgs!.length);

      _livecheckAmount.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<CalAmountModal> _liveCalAmount =
      BehaviorSubject<CalAmountModal>();
  BehaviorSubject<CalAmountModal> get getCalculatedAmount => _liveCalAmount;
  fetchcalAmount() async {
    // _liveCalAmount.addError("Loading");
    try {
      CalAmountModal homeSlider = await _homeRepo.fetchcalAmount();
      // print(homeSlider.imgs!.length);

      _liveCalAmount.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<WhyBoxoniqModal> _liveWhyboxonic =
      BehaviorSubject<WhyBoxoniqModal>();
  BehaviorSubject<WhyBoxoniqModal> get getWhyBoxonic => _liveWhyboxonic;
  fetchWhyBoxonic() async {
    // _liveWhyboxonic.addError("Loading");
    try {
      WhyBoxoniqModal homeSlider = await _homeRepo.fetchWhyBoxonic();
      // print(homeSlider.imgs!.length);

      _liveWhyboxonic.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<FaqModal> _liveFaq = BehaviorSubject<FaqModal>();
  BehaviorSubject<FaqModal> get getFaq => _liveFaq;
  fetchFaq() async {
    // _liveFaq.addError("Loading");
    try {
      FaqModal homeSlider = await _homeRepo.fetchFaq();
      // print(homeSlider.imgs!.length);

      _liveFaq.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SearchModal> _liveSearch =
      BehaviorSubject<SearchModal>();
  BehaviorSubject<SearchModal> get getSearch => _liveSearch;
  fetchSerach(s) async {
    // _liveSearch.addError("Loading");
    try {
      SearchModal homeSlider = await _homeRepo.fetchSerach(s);
      // print(homeSlider.imgs!.length);

      _liveSearch.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }
}

final homebloc = HomeBloc();
