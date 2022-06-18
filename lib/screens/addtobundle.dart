import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../shimmer/shimmer.dart';

class Addtobundle extends StatefulWidget {
  const Addtobundle({Key? key}) : super(key: key);

  @override
  State<Addtobundle> createState() => _AddtobundleState();
}

class _AddtobundleState extends State<Addtobundle> {
  int activeIndex = 5;
  String id = "";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;

    // print('${rcvdData['process']} process');
    // print('${rcvdData['index']} index');
    setState(() {
      activeIndex = int.parse(rcvdData['index']);
      id = rcvdData['id'];
      process = rcvdData['process'];
    });
  }

  String process = "";
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
  Future<bool> _onBack() {
    return check();
  }

  check() async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/mybundalSubscription', ModalRoute.withName('/StartScreen'),
        arguments: {'id': process});
  }

  @override
  Widget build(BuildContext context) {
    homebloc.checkamount();

    // print(userCred.getUserId());
    homebloc.fetchcatItems('$activeIndex', '0', '0', '0', '0', [], []);
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        backgroundColor: grad1Color,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: lightWhite2,
          title: const Text(
            "Bundle Creator",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                color: grad2Color,
                // fontFamily: font,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: StreamBuilder<CategoryItemModal>(
            stream: homebloc.getCategoryitems.stream,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            snapshot.data!.totalCount!,
                            (index) => Container(
                                  width: MediaQuery.of(context).size.width /
                                      (snapshot.data!.totalCount! + 1),
                                  height: 2,
                                  color: (activeIndex - 1) == index
                                      ? Colors.black
                                      : Colors.grey,
                                )),
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
                                    backgroundColor: const Color(0xffD3C6F9)
                                        .withOpacity(0.5),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      // child: Image.asset(
                                      //   "assets/1 9.png",
                                      //   fit: BoxFit.contain,
                                      // ),
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
                                      fontSize: 24,
                                      color: Colors.black,
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 180,
                                  child: Text(
                                    snapshot.data!.description!,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      letterSpacing: 1,

                                      fontSize: 15,
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
                                  process: process,
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
              if (!snapshot.hasData) return Container();
              return Container(
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
                    InkWell(
                      onTap: () {
                        if (activeIndex == 1) {
                          return;
                        } else {
                          setState(() {
                            activeIndex--;
                          });
                        }
                      },
                      child: Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green,
                          // border: Border.all(color: Colors.blue, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  1, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Prev",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 12,
                                  color: Colors.white,
                                  // fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/mybundalSubscription',
                            ModalRoute.withName('/StartScreen'),
                            arguments: {'id': process});
                      },
                      child: Container(
                        // width: 80,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  1, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Back to subscription",
                            style: TextStyle(
                                // letterSpacing: 1,
                                fontSize: 12,
                                color: Colors.green,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (activeIndex == snapshot.data!.totalCount) {
                          return;
                        } else {
                          setState(() {
                            activeIndex++;
                          });
                        }

                        // Navigator.pushNamed(context, "/previewBundal");
                      },
                      child: Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green,
                          // border: Border.all(color: Colors.blue, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  1, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Next",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 12,
                                  color: Colors.white,
                                  // fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class ProductsCard extends StatefulWidget {
  ProductsCard({Key? key, this.data, this.appid, this.i, this.process})
      : super(key: key);
  ProductListModal? data;
  String? appid;
  int colorIndex = 0;
  String attrIdForApi = "";
  String? process;
  int? i;

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  List<String> idArr = [];
  int count = 1;
  String attrId = "";
  @override
  void initState() {
    super.initState();
    idArr.clear();

    check();
  }

  check() async {
    Map data =
        await homeApi.fetchcatItemsinIt(widget.appid!, '0', '0', '0', '0', '0');
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
                  Container(
                    height: 120,
                    width: 100,
                    child: Image.network(
                      widget.data!.img!,
                      errorBuilder: (context, error, stackTrace) => Image.network(
                          'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-536.jpg?t=st=1648458079~exp=1648458679~hmac=22225d104f55882eeda53ca4bba904e4d687db4db62051a53fc670b06d89a94f&w=740'),
                      fit: BoxFit.contain,
                    ),
                  )
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
                    widget.data!.title!,
                    style: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Colors.black,
                        // fontFamily: font,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 180,
                    child: Text(
                      widget.data!.desc!,
                      maxLines: 4,
                      style: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 10,
                        color: Colors.black,
                        // fontFamily: font,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '₹ ${widget.data!.attr[widget.colorIndex].price!}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
                                          style: const TextStyle(fontSize: 10),
                                        )),
                                  ),
                                )),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)),
                                child: const Text('--'),
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
                          if (widget.attrIdForApi == "") {
                            Fluttertoast.showToast(
                                msg: 'Please select Attribute');
                            return;
                          }
                          HomeApi _api = HomeApi();
                          Map data = await _api.addTobundle(
                              process: widget.process!,
                              p_id: widget.data!.id!,
                              attr_id: widget.attrIdForApi,
                              qty: count.toString(),
                              userid: userCred.getUserId());
                          print(data);

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
                            Fluttertoast.showToast(msg: 'Something went wrong');
                          }
                        },
                        child: idArr.contains('${widget.data!.id!}')
                            ? Container(
                                width: 120,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xff53900F),
                                  // border: Border.all(color: Colors.blue, width: 1),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Added to Bundle",
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
                                width: 120,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: const Color(0xff53900F),
                                  ),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  // border: Border.all(color: Colors.blue, width: 1),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Add to Bundle",
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
    );
  }
}
