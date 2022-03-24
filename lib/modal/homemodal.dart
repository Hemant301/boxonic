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
  HomeCategorydetailModal(js) {
    id = js['id'] ?? "";
    image = js['image'] ?? "";
    name = js['name'] ?? "";
  }
}
