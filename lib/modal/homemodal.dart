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
  dynamic? discount;
  AttribueListModal(js) {
    id = js['id'] ?? "";
    name = js['name'] ?? "";
    price = js['price'] ?? "";
    mrp = js['mrp'] ?? "";
    discount = js['discount'] ?? "";
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
    img = js['image'] ?? "";
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
  dynamic? bundle_disc;
  int? coupon_discount;
  dynamic? total;
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

class MyOrderModal {
  List<OrderdetailModal> data = [];
  MyOrderModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(OrderdetailModal(js[i]));
    }
  }
}

class OrderdetailModal {
  String? response;
  String? orderid;
  String? date;
  String? amount;
  String? img;
  String? status;
  OrderdetailModal(js) {
    response = js['response'] ?? "";
    orderid = js['order_id'] ?? "";
    date = js['date'] ?? "";
    img = js['img'] ?? "";
    amount = js['amount'] ?? "";
    status = js['status'] ?? "";
  }
}

class Myorderdetailmodal {
  List<Itemsdetailmodal> items = [];
  TotalModal? total;
  Myorderdetailmodal(js) {
    for (var i = 0; i < js['items'].length; i++) {
      items.add(Itemsdetailmodal(js['items'][i]));
    }
    total = TotalModal(js['total']);
  }
}

class Itemsdetailmodal {
  String? response;
  String? item_id;
  // String? cart_id;
  // String? item_attr;
  String? img;
  String? item_name;
  dynamic? item_price;
  // dynamic? attr_price;
  String? quantity;
  dynamic? amount;
  String? status;
  Itemsdetailmodal(js) {
    response = js['response'] ?? "";
    item_id = js['item_id'] ?? "";
    // cart_id = js['cart_id'] ?? "";
    // item_attr = js['item_attr'] ?? "";
    img = js['img'] ?? "";
    item_name = js['item_name'] ?? "";
    item_price = js['item_price'] ?? "";
    // attr_price = js['attr_price'] ?? "";
    quantity = js['quantity'] ?? "";
    amount = js['amount'] ?? "";
    status = js['status'] ?? "";
  }
}

class Myordermodal {
  List<Itemsmodal> items = [];
  TotalModal? total;
  String? subs_month;
  dynamic delivered;
  String? nextdate;
  String? status;
  int? cancel;
  Myordermodal(js) {
    for (var i = 0; i < js['items'].length; i++) {
      items.add(Itemsmodal(js['items'][i]));
    }
    total = TotalModal(js['total']);
    subs_month = js['subs_month'] ?? "";
    delivered = js['delivered'] ?? "";
    nextdate = js['nextdate'] ?? "";
    status = js['status'] ?? "";
    cancel = js['cancel'] ?? "";
  }
}

class Itemsmodal {
  String? response;
  String? item_id;
  String? cart_id;
  String? item_attr;
  List<attributeModal> attribute = [];
  String? img;
  String? item_name;
  dynamic? item_price;
  dynamic? attr_price;
  String? quantity;
  dynamic? amount;
  String? status;
  Itemsmodal(js) {
    for (var i = 0; i < js['attribute'].length; i++) {
      attribute.add(attributeModal(js['attribute'][i]));
    }
    response = js['response'] ?? "";
    item_id = js['item_id'] ?? "";
    cart_id = js['cart_id'] ?? "";
    item_attr = js['item_attr'] ?? "";
    img = js['img'] ?? "";
    item_name = js['item_name'] ?? "";
    item_price = js['item_price'] ?? "";
    attr_price = js['attr_price'] ?? "";
    quantity = js['quantity'] ?? "";
    amount = js['amount'] ?? "";
    status = js['status'] ?? "";
  }
}

class attributeModal {
  String? attr_name;
  String? attr_id;
  dynamic price;
  attributeModal(js) {
    attr_name = js['attr_name'] ?? "";
    attr_id = js['attr_id'] ?? "";
    price = js['attr_price'] ?? "";
  }
}

class TotalModal {
  dynamic? subtotal;
  dynamic? discount;
  dynamic? total;
  TotalModal(js) {
    subtotal = js['subtotal'] ?? "";
    discount = js['discount'] ?? "";
    total = js['total'] ?? "";
  }
}

class SubsListModal {
  List<SubsModal> data = [];
  SubsListModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(SubsModal(js[i]));
    }
  }
}

class SubsModal {
  String? response;
  String? order_id;
  String? img;
  String? amount;
  String? date;
  String? status;
  SubsModal(js) {
    response = js['response'] ?? "";
    order_id = js['order_id'] ?? "";
    img = js['img'] ?? "";
    amount = js['amount'] ?? "";
    date = js['date'] ?? "";
    status = js['status'] ?? "";
  }
}

class UserdetailModal {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? pincode;
  String? landmark;
  String? baby_name;
  String? baby_dob;
  UserdetailModal(js) {
    name = js['name'] ?? "";
    email = js['email'] ?? "";
    phone = js['phone'] ?? "";
    address = js['address'] ?? "";
    pincode = js['pincode'] ?? "";
    landmark = js['landmark'] ?? "";
    baby_name = js['baby_name'] ?? "";
    baby_dob = js['baby_dob'] ?? "";
  }
}

class SearchModal {
  List<SearchProductModal> data = [];
  SearchModal(js) {
    for (var i = 0; i < js['product'].length; i++) {
      data.add(SearchProductModal(js['product'][i]));
    }
  }
}

class SearchProductModal {
  String? id;
  String? img;
  String? title;
  String? desc;
  List<AttribueListModal> attr = [];
  SearchProductModal(js) {
    id = js['id'] ?? "";
    img = js['image'] ?? "";
    title = js['title'] ?? "";
    desc = js['desc'] ?? "";
    for (var i = 0; i < js['attribute'].length; i++) {
      attr.add(AttribueListModal(js['attribute'][i]));
    }
  }
}

class AddressListModal {
  List<AddressdetailModal> data = [];
  AddressListModal(js) {
    for (var i = 0; i < js['address'].length; i++) {
      data.add(AddressdetailModal(js['address'][i]));
    }
  }
}

class AddressdetailModal {
  String? fulladdress;
  String? id;
  String? landmark;
  String? pincode;

  AddressdetailModal(js) {
    id = js['id'] ?? "";
    fulladdress = js['full_address'] ?? "";
    landmark = js['landmark'] ?? "";
    pincode = js['pincode'] ?? "";
  }
}

class CouponModal {
  List<CouponListModal> coupons = [];
  CouponModal(js) {
    for (var i = 0; i < js.length; i++) {
      coupons.add(CouponListModal(js[i]));
    }
  }
}

class CouponListModal {
  String? response;
  String? coupon;
  String? msg;
  CouponListModal(js) {
    response = js['response'] ?? "";
    coupon = js['coupon'] ?? "";
    msg = js['msg'] ?? "";
  }
}

class WhyBoxoniqModal {
  List<BoxoniqdetailModal> data = [];
  WhyBoxoniqModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(BoxoniqdetailModal(js[i]));
    }
  }
}

class BoxoniqdetailModal {
  String? image;
  String? why_desc;
  BoxoniqdetailModal(js) {
    image = js['image'] ?? "";
    why_desc = js['why_desc'] ?? "Description";
  }
}
