import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDitels extends StatefulWidget {
  const ProductDitels({Key? key}) : super(key: key);

  @override
  State<ProductDitels> createState() => _ProductDitelsState();
}

class _ProductDitelsState extends State<ProductDitels> {
  final TextEditingController _commentController = TextEditingController();
  double rate = 5.0;
  int count = 1;
  int pageIndex = 0;
  int colorIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Checkattr() async {
    Map data = await homeApi.fetchproductInit(id);
    print('from inti');
    print(data['product']['attribute'][0]['id']);
    attrid4api = data['product']['attribute'][0]['id'];
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final Map a = ModalRoute.of(context)!.settings.arguments as Map;
    print(a['id']);
    id = a['id'];
    Checkattr();
  }

  String id = "";
  String attrid4api = "";

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    // print(rcvdData['attr']);
    homebloc.fetchProduct('${rcvdData['id']}');
    homebloc.fetchComments(rcvdData['id']);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightWhite2,
          // leading: Container(),
          // leadingWidth: 0,
          // leading: Container(),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: InkWell(
            onTap: () {
              print(attrid4api);
            },
            child: Text(
              rcvdData['title'],
              style: TextStyle(color: Colors.black, fontFamily: font),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: StreamBuilder<ProductModal>(
              stream: homebloc.getProduct.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            // width: MediaQuery.of(context).size.width,
                            height: 400,
                            // height: 300,
                            child: PageView(
                              onPageChanged: (i) {
                                print(i);
                                setState(() {
                                  pageIndex = i;
                                });
                              },
                              children: List.generate(
                                snapshot.data!.product!.image.length,
                                (index) => Container(
                                  // height: 100,
                                  // width: 100,
                                  child: Image.network(
                                    snapshot.data!.product!.image[index].image!,
                                    fit: BoxFit.contain,

                                    // fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              snapshot.data!.product!.image.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: pageIndex == index
                                              ? Colors.black
                                              : Colors.grey),
                                    ),
                                  )),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            // border: Border.all(color: Colors.blue, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(1, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data!.product!.title!,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(children: [
                                    Container(
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Text('--'),
                                            ),
                                          ),
                                          Container(
                                            child: Text('$count'),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                count++;
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Text('+'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "MRP ₹ ${snapshot.data!.product!.attr[colorIndex].mrp}",
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontFamily: font,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${snapshot.data!.product!.attr[colorIndex].discount}% OFF",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 21, 113, 0),
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Price ₹ ${snapshot.data!.product!.attr[colorIndex].price}",
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontFamily: font,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              // border: Border.all(color: Colors.blue, width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      1, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Attributes",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    children: List.generate(
                                        snapshot.data!.product!.attr.length,
                                        (i) => Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    colorIndex = i;
                                                    attrid4api = snapshot.data!
                                                        .product!.attr[i].id!;
                                                  });
                                                },
                                                child: Chip(
                                                  label: Text(snapshot.data!
                                                      .product!.attr[i].name!),
                                                  backgroundColor:
                                                      colorIndex == i
                                                          ? Colors.amber
                                                          : Colors.grey[300],
                                                ),
                                              ),
                                            )),
                                  )
                                ]),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              // border: Border.all(color: Colors.blue, width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      1, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Product Discription",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data!.product!.desc!,
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontFamily: font,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ]),
                          )),
                      // Padding(
                      //     padding: const EdgeInsets.all(12.0),
                      //     child: Container(
                      //       padding: EdgeInsets.all(20),
                      //       width: MediaQuery.of(context).size.width - 20,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(5),
                      //         color: Colors.white,
                      //         // border: Border.all(color: Colors.blue, width: 1),
                      //         boxShadow: [
                      //           BoxShadow(
                      //             color: Colors.grey.withOpacity(0.4),
                      //             spreadRadius: 1,
                      //             blurRadius: 1,
                      //             offset: Offset(1, 3), // changes position of shadow
                      //           ),
                      //         ],
                      //       ),
                      //       child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "Key Features",
                      //               style: TextStyle(
                      //                   letterSpacing: 1,
                      //                   fontSize: 13,
                      //                   color: Colors.black,
                      //                   fontFamily: font,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //             SizedBox(
                      //               height: 10,
                      //             ),
                      //             Text(
                      //               "cream cream cream cream baby  cream cream cream cream",
                      //               style: TextStyle(
                      //                 letterSpacing: 1,
                      //                 fontSize: 13,
                      //                 color: Colors.black,
                      //                 fontFamily: font,
                      //                 // fontWeight: FontWeight.bold
                      //               ),
                      //             ),
                      //           ]),
                      //     )),
                      StreamBuilder<CommmentModal>(
                          stream: homebloc.getComments.stream,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Container();
                            return Column(
                              children: List.generate(
                                snapshot.data!.data!.length,
                                (index) => ProfileComments(
                                  name: snapshot.data!.data![index].name,
                                  image: snapshot.data!.data![index].image,
                                  comment: snapshot.data!.data![index].comment,
                                  rating: snapshot.data!.data![index].rating,
                                  time: snapshot.data!.data![index].trn_date,
                                ),
                              ),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            // border: Border.all(color: Colors.blue, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(1, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _commentController,
                                  maxLines: 6,
                                  decoration: const InputDecoration(
                                      hintText: 'Write your comment here'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RatingBar.builder(
                                  initialRating: 5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    rate = rating;
                                    print(rate.runtimeType);
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (_commentController.text == "") {
                                      Fluttertoast.showToast(
                                          msg: 'Enter Comment');
                                    }
                                    HomeApi api = HomeApi();
                                    Map data = await api.saveComments(
                                        rate: rate.toString(),
                                        p_id: rcvdData['id'],
                                        comment: _commentController.text);
                                    print(data);
                                    if (data['response'] == '1') {
                                      Fluttertoast.showToast(msg: data['msg']);
                                      setState(() {
                                        _commentController.text = "";
                                      });
                                    } else {
                                      Fluttertoast.showToast(msg: data['msg']);
                                    }
                                  },
                                  child: Container(
                                    height: 35,
                                    width:
                                        MediaQuery.of(context).size.width - 90,
                                    decoration: BoxDecoration(
                                        color: lightWhite3,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]);
              }),
        ),
        bottomNavigationBar: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade100,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/previewBundal');
              },
              child: Container(
                // padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 2,

                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromARGB(255, 206, 206, 206), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 3), // changes position of shadow
                      ),
                    ]),
                child: Center(
                  child: Text(
                    "Go to Bag",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Colors.red,
                        fontFamily: font,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                HomeApi _api = HomeApi();
                Map data = await _api.addToCart(
                    p_id: rcvdData['id'],
                    attr_id: attrid4api,
                    qty: count.toString(),
                    userid: userCred.getUserId());
                print(data);

                if (data['response'] == "1") {
                  homebloc.checkamount();

                  Fluttertoast.showToast(
                      msg: 'Successfully added', backgroundColor: Colors.green);
                } else {
                  Fluttertoast.showToast(msg: 'Something went wrong');
                }
              },
              child: Container(
                // padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 2,

                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(5),
                    color: lightWhite2,
                    // border: Border.all(color: Colors.blue, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 3), // changes position of shadow
                      ),
                    ]),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: font,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}

class ProfileComments extends StatelessWidget {
  ProfileComments(
      {Key? key, this.name, this.image, this.comment, this.time, this.rating})
      : super(key: key);
  String? name;
  String? image;
  String? time;
  String? comment;
  double? rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 249, 255, 132).withOpacity(0.6),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      '$image',
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        '$time',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RatingBar.builder(
                      initialRating: rating!,
                      minRating: 1,
                      itemSize: 20,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {
                        // rate = rating;
                        // print(rate.runtimeType);
                        print(rating);
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '$comment',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
