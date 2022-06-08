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
  dynamic? sub_total;
  dynamic? bundle_disc;
  dynamic walletBallance;
  // dynamic delivery;
  dynamic? coupon_discount;
  dynamic? total;
  ResponseModal(js) {
    sub_total = js['sub total'] ?? "0";
    bundle_disc = js['bundal discount'] ?? "";
    // delivery = js['delivery'] ?? 0;
    coupon_discount = js['coupon discount'] ?? "";
    total = js['total'] ?? "";
    walletBallance = js['balance'] ?? "0";
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
    // id = js['id'] ?? "";
    months = js['data'] ?? "";
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
  dynamic? amount;
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
  AddInOrderModal? address;

  TotalModal? total;
  Myorderdetailmodal(js) {
    for (var i = 0; i < js['items'].length; i++) {
      items.add(Itemsdetailmodal(js['items'][i]));
    }
    total = TotalModal(js['total']);
    address = AddInOrderModal(js['address']);
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
  AddInsubsModal? address;
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
    address = AddInsubsModal(js['address']);
  }
}

class AddInsubsModal {
  String? address;
  String? landmark;
  String? pincode;
  AddInsubsModal(js) {
    address = js['address'] ?? "";
    landmark = js['landmark'] ?? "";
    pincode = js['pincode'] ?? "";
  }
}

class Itemsmodal {
  String? response;
  String? item_id;
  String? cart_id;
  String? item_attr;
  List<attributeModal> attribute = [];
  String? img;
  String? super_cat_name;
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
    super_cat_name = js['super_cat_name'] ?? "";
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
  dynamic? coupon;
  dynamic? bundledissount;
  dynamic delivery;
  dynamic? discount;
  String? status;
  dynamic? total;
  dynamic? finaltotal;
  TotalModal(js) {
    subtotal = js['subtotal'] ?? "";
    coupon = js['coupon'] ?? "0";
    discount = js['discount'] ?? "";
    delivery = js['delivery'] ?? "";
    status = js['status'] ?? "";
    total = js['total'] ?? "";
    bundledissount = js['bundle_discount'] ?? "0";
    finaltotal = js['final_total'] ?? "";
  }
}

class AddInOrderModal {
  String? address;
  String? landmark;
  String? pincode;
  AddInOrderModal(js) {
    address = js['address'] ?? "";
    landmark = js['landmark'] ?? "";
    pincode = js['pincode'] ?? "";
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
  String? image;
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
    image =
        js['img'] ?? "https://cdn-icons-png.flaticon.com/128/1177/1177568.png";
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
  String? state;
  String? phone;

  AddressdetailModal(js) {
    id = js['id'] ?? "";
    fulladdress = js['full_address'] ?? "";
    landmark = js['landmark'] ?? "";
    pincode = js['pincode'] ?? "";
    state = js['state'] ?? "";
    phone = js['phone'] ?? "";
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
  String? couponId;
  String? msg;
  CouponListModal(js) {
    response = js['response'] ?? "";
    coupon = js['coupon'] ?? "";
    couponId = js['coupon_id'] ?? "";
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

class FaqModal {
  List<FaqanswerModal> faq = [];
  FaqModal(js) {
    for (var i = 0; i < js.length; i++) {
      faq.add(FaqanswerModal(js[i]));
    }
  }
}

class FaqanswerModal {
  String? question;
  String? answer;
  FaqanswerModal(js) {
    question = js['faq'] ?? "";
    answer = js['answer'] ?? "";
  }
}

class ProductModal {
  ProductdetailModal? product;
  ProductModal(js) {
    product = ProductdetailModal(js['product']);
  }
}

class ProductdetailModal {
  List<ProductImageModal> image = [];
  String? id;
  String? title;
  String? desc;
  List<ProductAttribueListModal> attr = [];
  ProductdetailModal(js) {
    for (var i = 0; i < js['image'].length; i++) {
      image.add(ProductImageModal(js['image'][i]));
    }
    id = js['id'] ?? "";
    title = js['title'] ?? "";
    desc = js['desc'] ?? "";
    for (var i = 0; i < js['attribute'].length; i++) {
      attr.add(ProductAttribueListModal(js['attribute'][i]));
    }
  }
}

class ProductImageModal {
  String? image;
  ProductImageModal(js) {
    image = js['img'] ?? "";
  }
}

class ProductAttribueListModal {
  String? id;
  String? name;
  String? price;
  String? mrp;
  dynamic? discount;
  ProductAttribueListModal(js) {
    id = js['id'] ?? "";
    name = js['name'] ?? "";
    price = js['price'] ?? "";
    mrp = js['mrp'] ?? "";
    discount = js['discount'] ?? "";
  }
}

class CommmentModal {
  List<CommmentData>? data;
  CommmentModal(js) {
    data = [];
    for (var i = 0; i < js.length; i++) {
      data!.add(CommmentData(js[i]));
    }
  }
}

class CommmentData {
  String? rating_id;
  String? comment;
  double? rating;
  String? name;
  String? image;
  String? trn_date;
  CommmentData(js) {
    rating_id = js['rating_id'] ?? '';
    comment = js['comment'] ?? '';
    rating = js['rating'].toDouble() ?? 0.0;
    name = js['name'] ?? '';
    image = js['image'] ?? '';
    trn_date = js['trn_date'] ?? '';
  }
}

class AnswerModal {
  List<AnswersDetailModal> answer = [];
  AnswerModal(js) {
    for (var i = 0; i < js.length; i++) {
      answer.add(AnswersDetailModal(js[i]));
    }
  }
}

class AnswersDetailModal {
  String? answer_id;
  String? answer;
  String? user_name;
  String? img;
  String? created_on;
  AnswersDetailModal(js) {
    answer_id = js['answer_id'] ?? "";
    answer = js['answer'] ?? "";
    user_name = js['user_name'] ?? "";
    img = js['img'] ?? "";
    created_on = js['created_on'] ?? "";
  }
}

class FilterModal {
  BrandlistModal? brand;
  SubcatlistModal? subcat;
  FilterModal(js) {
    brand = BrandlistModal(js['brand']);
    subcat = SubcatlistModal(js['subcat']);
  }
}

class BrandlistModal {
  List<FilterListModal> brand = [];
  BrandlistModal(js) {
    for (var i = 0; i < js.length; i++) {
      brand.add(FilterListModal(js[i]));
    }
  }
}

class SubcatlistModal {
  List<FilterListModal> subcat = [];
  SubcatlistModal(js) {
    for (var i = 0; i < js.length; i++) {
      subcat.add(FilterListModal(js[i]));
    }
  }
}

class FilterListModal {
  String? name;
  String? id;
  FilterListModal(js) {
    name = js['name'] ?? "";
    id = js['id'] ?? "";
  }
}

class NumberModal {
  String? mobile;
  String? phone;
  String? email;
  NumberModal(js) {
    mobile = js['mobile'];
    phone = js['phone'];
    email = js['email'];
  }
}

class StateModal {
  List<StatedetailModal> data = [];
  StateModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(StatedetailModal(js[i]));
    }
  }
}

class StatedetailModal {
  String? id;
  String? state;

  StatedetailModal(js) {
    id = js['id'] ?? "";
    state = js['name'] ?? "";
  }
}

class HomebenefitsModal {
  List<HomeBenefitdetailModal> data = [];
  HomebenefitsModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(HomeBenefitdetailModal(js[i]));
    }
  }
}

class HomeBenefitdetailModal {
  String? name;
  String? image;
  String? desc;

  HomeBenefitdetailModal(js) {
    name = js['name'] ?? "";
    image = js['image'] ?? "";
    desc = js['desc'] ?? "";
  }
}

class SubsbenefitsModal {
  List<SubsBenefitdetailModal> data = [];
  SubsbenefitsModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(SubsBenefitdetailModal(js[i]));
    }
  }
}

class SubsBenefitdetailModal {
  String? name;
  // String? image;
  // String? desc;

  SubsBenefitdetailModal(js) {
    name = js['name'] ?? "";
    // image = js['image'] ?? "";
    // desc = js['desc'] ?? "";
  }
}
