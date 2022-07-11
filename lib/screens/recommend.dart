import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../shimmer/shimmer.dart';

class Recommend extends StatefulWidget {
  const Recommend({Key? key}) : super(key: key);

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  List<String> filterId = [];
  List<String> filtersubCatId = [];
  int colorInd = 0;
  int activeIndex = 5;
  String id = "";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;

    // print('${rcvdData['index']} index');
    setState(() {
      // activeIndex = int.parse(rcvdData['index']);
      // id = rcvdData['id'];
    });
  }

  @override
  void initState() {
    super.initState();
    // print('onsetstate');
    checkamount();
  }

  checkamount() async {
    Map data = await homeApi.checkamount();
    // print(data);
    setState(() {
      totalamt = data['total_amount'].toString();
    });
  }

  String totalamt = "";
  String sort = '0';
  String sort_order = '0';
  String filter = '0';
  String filtertype = '0';
  String filterkey = '0';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    homebloc.checkamount();

    // print(userCred.getUserId());
    homebloc.fetchRecommendItems();
    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: lightWhite2,
        title: const Text(
          "Recommended products",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              // fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Center(
            child: StreamBuilder<CheckAmountModal>(
                stream: homebloc.getcheckAmount.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "₹ ${snapshot.data!.totalamount.toString()}",
                      style: const TextStyle(
                          letterSpacing: 1,
                          fontSize: 18,
                          color: grad2Color,
                          // fontFamily: font,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }),
          ),
        ],
      ),
      body: StreamBuilder<CategoryItemModal>(
          stream: homebloc.getRecommendeditems.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const CategoryShimmer();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(snapshot.data!.img!),
                                  backgroundColor:
                                      const Color(0xffD3C6F9).withOpacity(0.5),
                                  child: const Padding(
                                    padding: EdgeInsets.all(12.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data!.name!,
                                style: const TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 20,
                                    color: Colors.black,
                                    // fontFamily: font,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 120,
                                child: Text(
                                  snapshot.data!.description!,
                                  // maxLines: 4,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    letterSpacing: 1,

                                    fontSize: 10,
                                    color: Colors.black,
                                    // fontFamily: font,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //
                    Column(
                        children: List.generate(
                            snapshot.data!.product.length,
                            (index) => ProductsCard(
                                sort: sort,
                                sort_order: sort_order,
                                filter: filter,
                                filterkey: filterkey,
                                filtertype: filtertype,
                                appid: activeIndex.toString(),
                                data: snapshot.data!.product[index],
                                i: index)))
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: StreamBuilder<CategoryItemModal>(
          stream: homebloc.getCategoryitems.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Container(
                height: 10,
              );
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/previewBundal');
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: lightWhite2,
                  // border: Border.all(color: Colors.blue, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Row(
                        children: [
                          Text(
                            "Proceed to checkout",
                            style: TextStyle(
                                // letterSpacing: 1,
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

      // SizedBox(
      //   height: 100,
      // )
    );
  }
}

class ProductsCard extends StatefulWidget {
  ProductsCard(
      {Key? key,
      this.data,
      this.appid,
      this.i,
      this.filter,
      this.filterkey,
      this.filtertype,
      this.sort,
      this.sort_order})
      : super(key: key);
  ProductListModal? data;
  String? appid;
  int colorIndex = 0;
  String attrIdForApi = "";
  int? i;
  String? sort;
  String? sort_order;
  String? filter;
  String? filtertype;
  String? filterkey;

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  int count = 1;
  String attrId = "";
  @override
  void initState() {
    super.initState();
    // print('init v chal rha');
    idArr.clear();
    check();
  }

  List<String> idArr = [];

  check() async {
    Map data = await homeApi.fetchRecommendedItemsinIt();
    // print('${data['product'][0]['attribute'][0]['id']} ');
    if (widget.attrIdForApi == "") {
      widget.attrIdForApi = data['product'][widget.i]['attribute'][0]['id'];
    } else if (widget.attrIdForApi !=
        data['product'][widget.i]['attribute'][0]['id']) {
      // print('true');
      return;
    } else {
      widget.attrIdForApi = data['product'][widget.i]['attribute'][0]['id'];
      // print('false');
      // print(widget.attrIdForApi);
      // print('${data['product'][0]['attribute'][0]['id']} ');
    }
    // print('$widget.attrIdForApi ------attrid');
    // print(widget.appid);
  }

  @override
  Widget build(BuildContext context) {
    check();
    // print('build bna bhai');

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/productditels", arguments: {
              'id': widget.data!.id,
              'image': widget.data!.img,
              'title': widget.data!.title,
              'attr': widget.data!.attr
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              // border: Border.all(color: Colors.blue, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: widget.data!.is_stock != 1 ? 0.5 : 1,
                          child: Container(
                            height: 120,
                            width: 100,
                            child: Image.network(
                              widget.data!.img!,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.network(
                                      'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-536.jpg?t=st=1648458079~exp=1648458679~hmac=22225d104f55882eeda53ca4bba904e4d687db4db62051a53fc670b06d89a94f&w=740'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // widget.data!.is_stock == 1
                        //     ? Container()
                        //     : Container(
                        //         height: 120,
                        //         width: 100,
                        //         color: Colors.grey.withOpacity(0.3),
                        //       ),
                        widget.data!.is_stock == 1
                            ? Container()
                            : Positioned(
                                bottom: 5,
                                child: Text(
                                  'Out of Stock',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.data!.title!,
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 16,
                          color: Colors.black,
                          // fontFamily: font,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: Text(
                        widget.data!.desc!,
                        maxLines: 4,
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 10,
                          color: Colors.black,
                          // fontFamily: font,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '₹ ${widget.data!.attr[widget.colorIndex].price!}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '₹ ${widget.data!.attr[widget.colorIndex].mrp!}',
                          style: TextStyle(
                            decorationThickness: 2,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff53900F)),
                          child: Text(
                            '${widget.data!.attr[widget.colorIndex].discount!}% off',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 + 30,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              widget.data!.attr.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colorIndex = index;
                                          attrId = widget.data!.attr[index].id
                                              .toString();
                                          widget.attrIdForApi = widget
                                              .data!.attr[index].id
                                              .toString();
                                        });
                                      },
                                      child: Chip(
                                          backgroundColor:
                                              widget.colorIndex == index
                                                  ? lightWhite3
                                                  : Colors.grey[300],
                                          label: Text(
                                            widget.data!.attr[index].name!,
                                            style: TextStyle(fontSize: 10),
                                          )),
                                    ),
                                  )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (count == 1) {
                                    return;
                                  } else {
                                    setState(() {
                                      count--;
                                    });
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: const Text(
                                    '--',
                                    style: TextStyle(letterSpacing: -1),
                                  ),
                                ),
                              ),
                              Text('$count'),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: const Text('+'),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            if (widget.data!.is_stock != 1) {
                              Fluttertoast.showToast(msg: 'Out Of Stock');
                              return;
                            }
                            if (widget.attrIdForApi == "") {
                              Fluttertoast.showToast(
                                  msg: 'Please select Attribute');
                              return;
                            }
                            HomeApi _api = HomeApi();
                            Map data = await _api.addToCart(
                                p_id: widget.data!.id!,
                                attr_id: widget.attrIdForApi,
                                qty: count.toString(),
                                userid: userCred.getUserId());
                            // print(data);

                            if (data['response'] == "1") {
                              homebloc.checkamount();
                              setState(() {
                                widget.colorIndex = 0;
                                widget.attrIdForApi = "";
                              });
                              idArr.add('${widget.data!.id!}');

                              Fluttertoast.showToast(
                                  msg: 'Successfully added',
                                  backgroundColor: Colors.green);
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Something went wrong');
                            }
                          },
                          child: idArr.contains('${widget.data!.id!}')
                              ? Container(
                                  width: 100,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff53900F),
                                    // border: Border.all(color: Colors.blue, width: 1),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Added to Box",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 10,
                                          color: Colors.white,
                                          // fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 100,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: const Color(0xff53900F),
                                    ),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    // border: Border.all(color: Colors.blue, width: 1),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Add to Box",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 10,
                                          color: Color(0xff53900F),
                                          // fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
