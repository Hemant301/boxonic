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

  final BehaviorSubject<CategoryItemModal> _livecategoryItems =
      BehaviorSubject<CategoryItemModal>();
  BehaviorSubject<CategoryItemModal> get getCategoryitems => _livecategoryItems;
  fetchcatItems(String id) async {
    // _livecategoryItems.addError("Loading");
    try {
      CategoryItemModal homeSlider = await _homeRepo.fetchcatItems(id);
      // print(homeSlider.imgs!.length);

      _livecategoryItems.add(homeSlider);
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

  final BehaviorSubject<Myordermodal> _liveSubsdetail =
      BehaviorSubject<Myordermodal>();
  BehaviorSubject<Myordermodal> get getSubsdetail => _liveSubsdetail;
  fetchSubsdetails(String id) async {
    // _liveSubsdetail.addError("Loading");
    try {
      Myordermodal homeSlider = await _homeRepo.fetchSubsdetails(id);
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

  final BehaviorSubject<UserdetailModal> _liveuserdetails =
      BehaviorSubject<UserdetailModal>();
  BehaviorSubject<UserdetailModal> get getuserdetails => _liveuserdetails;
  fetchuserDetails() async {
    // _liveuserdetails.addError("Loading");
    try {
      UserdetailModal homeSlider = await _homeRepo.fetchuserDetails();
      // print(homeSlider.imgs!.length);

      _liveuserdetails.add(homeSlider);
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
