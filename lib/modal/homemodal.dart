class HomeSlider {
  List<HomeSlidermodal> imgs = [];
  HomeSlider(js) {
    imgs = [];
    for (int i = 0; i < js.length; i++) {
      imgs.add(HomeSlidermodal(js[i]));
    }
  }
}

class HomeSlidermodal {
  String? slide;
  // String? type;
  HomeSlidermodal(js) {
    slide = js['slide'] ?? "";
    // type = js['type'] ?? "";
  }
}

class BrandModal {
  List<BrandModaldetail> brand = [];
  BrandModal(js) {
    brand = [];
    for (int i = 0; i < js.length; i++) {
      brand.add(BrandModaldetail(js[i]));
    }
  }
}

class BrandModaldetail {
  String? brand;
  // String? type;
  BrandModaldetail(js) {
    brand = js['brand'] ?? "";
    // type = js['type'] ?? "";
  }
}

class HomeCategoryModal {
  List<HomeCategorydetailModal> category = [];
  HomeCategoryModal(js) {
    category = [];
    for (int i = 0; i < js.length; i++) {
      category.add(HomeCategorydetailModal(js[i]));
    }
  }
}

class HomeCategorydetailModal {
  String? id;
  String? image;
  String? name;
  String? seq;
  HomeCategorydetailModal(js) {
    id = js['id'] ?? "";
    image = js['image'] ?? "";
    name = js['name'] ?? "";
    seq = js['sequence'] ?? "";
  }
}

class CategoryItemModal {
  String? img;
  String? name;
  String? description;
  int? totalCount;
  List<ProductListModal> product = [];
  CategoryItemModal(js) {
    img = js['img'] ?? "";
    name = js['name'] ?? "";
    totalCount = js['count_super_cat'] ?? "";
    description = js['desc'] ?? "";
    for (var i = 0; i < js['product'].length; i++) {
      product.add(ProductListModal(js['product'][i]));
    }
  }
}

class ProductListModal {
  String? id;
  String? img;
  String? title;
  String? desc;
  List<AttribueListModal> attr = [];
  ProductListModal(js) {
    id = js['id'] ?? "";
    img = js['image'] ?? "";
    title = js['title'] ?? "";
    desc = js['desc'] ?? "";
    for (var i = 0; i < js['attribute'].length; i++) {
      attr.add(AttribueListModal(js['attribute'][i]));
    }
  }
}

class AttribueListModal {
  String? id;
  String? name;
  String? price;
  String? mrp;
  AttribueListModal(js) {
    id = js['id'] ?? "";
    name = js['name'] ?? "";
    price = js['price'] ?? "";
    mrp = js['mrp'] ?? "";
  }
}

class BundleitemModal {
  List<BundledetailModal> bundal = [];
  BundleitemModal(js) {
    for (var i = 0; i < js.length; i++) {
      bundal.add(BundledetailModal(js[i]));
    }
  }
}

class BundledetailModal {
  String? title;
  List<BundleProductdetailModal> product = [];
  BundledetailModal(js) {
    title = js['title'] ?? "";
    for (var i = 0; i < js['product'].length; i++) {
      product.add(BundleProductdetailModal(js['product'][i]));
    }
  }
}

class BundleProductdetailModal {
  String? id;
  String? img;
  String? Cart_id;
  String? title;
  String? price;
  String? desc;
  String? qty;
  String? total;
  String? attribute;
  BundleProductdetailModal(js) {
    id = js['item_id'] ?? "";
    img = js['img'] ?? "";
    Cart_id = js['id'] ?? "";
    title = js['item_name'] ?? "";
    price = js['item_price'] ?? "";
    desc = js['desc'] ?? "";
    qty = js['quantity'] ?? "";
    total = js['total_amount'] ?? "";
    attribute = js['attribute'] ?? "";
  }
}

class BundleAttrModal {
  String? name;
  BundleAttrModal(js) {
    name = js['name'];
  }
}

class CheckAmountModal {
  int? totalamount;
  CheckAmountModal(js) {
    totalamount = js['total_amount'] ?? "";
  }
}

class CalAmountModal {
  List<CalDetailModal> data = [];
  CalAmountModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(CalDetailModal(js[i]));
    }
  }
}

class CalDetailModal {
  String? userid;
  ResponseModal? response;
  CalDetailModal(js) {
    userid = js['user_id'] ?? "";
    response = ResponseModal(js['response']);
  }
}

class ResponseModal {
  int? sub_total;
  int? bundle_disc;
  int? coupon_discount;
  int? total;
  ResponseModal(js) {
    sub_total = js['sub total'] ?? "0";
    bundle_disc = js['bundal discount'] ?? "";
    coupon_discount = js['coupon discount'] ?? "";
    total = js['total'] ?? "";
  }
}

class AddressModal {
  String? addess;
  String? pincode;
  String? landmark;
  AddressModal(js) {
    addess = js['address'] ?? "";
    pincode = js['pincode'] ?? "";
    landmark = js['landmark'] ?? "";
  }
}

class WalletModal {
  List<WalletbalanceModal> balance = [];
  WalletModal(js) {
    for (var i = 0; i < js.length; i++) {
      balance.add(WalletbalanceModal(js[i]));
    }
  }
}

class WalletbalanceModal {
  String? response;
  String? amount;
  WalletbalanceModal(js) {
    response = js['response'] ?? "";
    amount = js['amount'] ?? "";
  }
}

class MonthsModal {
  List<MonthsdetailModal> data = [];
  MonthsModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(MonthsdetailModal(js[i]));
    }
  }
}

class MonthsdetailModal {
  String? id;
  String? months;
  MonthsdetailModal(js) {
    id = js['id'] ?? "";
    months = js['months'] ?? "";
  }
}


class WallettransModal {
  String? walletbalance;
  List<TransModalDetails> wallethistory = [];

  WallettransModal(js) {
    walletbalance = js['wallet_balance'] ?? "";
    for (var i = 0; i < js['wallet_history'].length; i++) {
      wallethistory.add(TransModalDetails(js['wallet_history'][i]));
    }
  }
}

class TransModalDetails {
  String? amount;
  String? tran_id;
  int? type;
  String? msg;
  String? created_on;

  TransModalDetails(js) {
    amount = js['amount'] ?? "";
    tran_id = js['tran_id'] ?? "";
    type = js['type'] ?? "";
    msg = js['msg'] ?? "";
    created_on = js['created_on'] ?? "";
  }
}
