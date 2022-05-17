import 'dart:ui' as ui;
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/screens/drower.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/slider.dart';
import 'package:flutter/material.dart';

class HomeScrren extends StatefulWidget {
  const HomeScrren({Key? key}) : super(key: key);

  @override
  State<HomeScrren> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  GlobalKey previewContainer = new GlobalKey();
  // Future<void> shareScreenshot() async {
  //   Directory? directory;
  //   if (Platform.isAndroid) {
  //     directory = await getExternalStorageDirectory();
  //   } else {
  //     directory = await getApplicationDocumentsDirectory();
  //   }
  //   final String localPath =
  //       '${directory!.path}/${DateTime.now().toIso8601String()}.png';

  //   await screenshotController.captureAndSave(localPath);

  //   await Future.delayed(Duration(seconds: 1));

  //   await FlutterShare.shareFile(
  //       title: 'Compartilhar comprovante',
  //       filePath: localPath,
  //       fileType: 'image/png');
  // }
  // Future<void> shareFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null || result.files.isEmpty) return null;

  //   await FlutterShare.shareFile(
  //     title: 'Example share',
  //     text: 'Example share text',
  //     filePath: result.files[0] as String,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    homebloc.fetchHomebrand();
    homebloc.fetchHomebrand2();
    homebloc.fetchHomecategory();
    print(userCred.getUserId());
    return RepaintBoundary(
      key: previewContainer,
      child: Scaffold(
        key: scaffoldkey,
        drawer: Container(
          width: MediaQuery.of(context).size.width * 1,
          child: DrawersPage(),
        ),
        backgroundColor: grad1Color,
        appBar: AppBar(
          backgroundColor: lightWhite2,
          leading: InkWell(
            onTap: () {
              scaffoldkey.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/list.png",
                height: 20,
                width: 20,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/128/1177/1177568.png",
                  ),
                ),
              ),
            ),
          ],
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // shareScreenshot();
                  // _captureSocialPng();
                },
                child: Text(
                  "Boxoniq",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      color: grad2Color,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Let's begin to continue",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 10,
                    color: grad2Color,
                    fontFamily: font,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(child: MyCorosule()),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      // height: 220,
                      width: MediaQuery.of(context).size.width - 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: primaryLight,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HOW IT WORKS",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Mainbox(
                                  image: "assets/package (1) 1.png",
                                  title: "Create Box ",
                                ),
                                Container(
                                  width: 40,
                                  height: 1,
                                  color: Color(0xffDDDDDD),
                                ),
                                Mainbox(
                                    image: "assets/wallet (2) 1.png",
                                    title: "Subscribe"),
                                Container(
                                  width: 40,
                                  height: 1,
                                  color: Color(0xffDDDDDD),
                                ),
                                Mainbox(
                                    image: "assets/sync 1.png",
                                    title: "Delivery \n every month"),
                              ]),
                          SizedBox(
                            height: 35,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/bundlecreatorPage",
                                    arguments: {'id': '1', 'index': '1'});
                              },
                              child: Container(
                                // padding: EdgeInsets.all(20),
                                height: 35,
                                width: MediaQuery.of(context).size.width - 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff09A42B),
                                ),
                                child: Center(
                                  child: Text(
                                    "Create Your Bundle",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Bundle and Subscription Benefits",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: font,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              startBox(
                                image: 'assets/c3.png',
                                title: 'Bundle Discount',
                                desc:
                                    'Get additional bundle discount by adding minimum one product from each category',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              startBox(
                                  image: 'assets/c1.png',
                                  title: 'Subscribe and Save',
                                  desc:
                                      "Subscription comes with additional benefits throughout your subscription journey"),
                              SizedBox(
                                height: 10,
                              ),
                              startBox(
                                  image: 'assets/c4.png',
                                  title:
                                      'Modify , Skip or Cancel Subscription anytime',
                                  desc:
                                      'Modify, your bundle anytime. Skip or Cancel subscription anytime.'),
                            ],
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 300,
                                width: 88,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/pexels-daniel-reche-1556706 1 (2).png"),
                                        fit: BoxFit.fill),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30))),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "SHOP BY CATEGORY",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: font,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                StreamBuilder<HomeCategoryModal>(
                    stream: homebloc.getHomeCategory.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              snapshot.data!.category.length,
                              (index) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/bundlecreatorPage',
                                      arguments: {
                                        'id': snapshot.data!.category[index].seq
                                            .toString(),
                                        'index': (index + 1).toString()
                                      });
                                },
                                child: babyItem(
                                    image: snapshot.data!.category[index].image,
                                    name: snapshot.data!.category[index].name!),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "BRANDS",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: font,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                StreamBuilder<BrandModal>(
                    stream: homebloc.getHomebrand.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              snapshot.data!.brand.length,
                              (index) => Brand(
                                images: snapshot.data!.brand[index].brand,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                StreamBuilder<BrandModal>(
                    stream: homebloc.getHomebrand2.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              snapshot.data!.brand.length,
                              (index) => Brand(
                                images: snapshot.data!.brand[index].brand,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "WHY CHOOSE BOXONIQ?",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: font,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WhyChoose(
                        image: 'assets/image 1.png',
                        name: 'Making life easier for today’s parents',
                      ),
                      WhyChoose(
                        image: 'assets/123.png',
                        name:
                            'Subscription comes with remarkable discounts and offers to add some cherry on the top of it',
                      ),
                      WhyChoose(
                        image: 'assets/image 1.png',
                        name:
                            'Conveniently delivered to your doorstep every month.',
                      ),
                      WhyChoose(
                        image: 'assets/123.png',
                        name:
                            'Get a space in our platform to publish your story of your subscription journey',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Container(
                    // padding: EdgeInsets.all(20),
                    // height: 160,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff09A42B),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lets Stay in Touch",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Get access to latest updates from boxoniq \nand special offers",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 11,
                              color: Colors.white,
                              // fontFamily: font,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                // padding: EdgeInsets.all(20),
                                // height: 160,
                                width: MediaQuery.of(context).size.width - 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
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
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Enter your email address",
                                      hintStyle: TextStyle(fontSize: 12),
                                      prefixIcon: Icon(Icons.email),
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                // padding: EdgeInsets.all(20),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
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
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  // Future<void> _captureSocialPng() {
  //   List<String> imagePaths = [];
  //   final RenderBox box = context.findRenderObject() as RenderBox;
  //   return new Future.delayed(const Duration(milliseconds: 20), () async {
  //     RenderRepaintBoundary? boundary = previewContainer.currentContext!
  //         .findRenderObject() as RenderRepaintBoundary?;
  //     ui.Image image = await boundary!.toImage();
  //     final directory = (await getApplicationDocumentsDirectory()).path;
  //     ByteData? byteData =
  //         await image.toByteData(format: ui.ImageByteFormat.png);
  //     Uint8List pngBytes = byteData!.buffer.asUint8List();
  //     File imgFile = new File('$directory/screenshot.png');
  //     imagePaths.add(imgFile.path);
  //     imgFile.writeAsBytes(pngBytes).then((value) async {
  //       await Share.shareFiles(imagePaths,
  //           subject: 'Share',
  //           text: 'Check this Out!',
  //           sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  //     }).catchError((onError) {
  //       print(onError);
  //     });
  //   });
  // }
}

class WhyChoose extends StatelessWidget {
  WhyChoose({Key? key, this.image, this.name}) : super(key: key);
  String? image;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Container(
          // padding: EdgeInsets.all(20),
          height: 170,
          width: 165,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                  height: 100,
                  width: 165,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image!), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    name!,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 10,
                      color: Colors.black,
                      fontFamily: font,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class babyItem extends StatelessWidget {
  babyItem({Key? key, this.image, this.name}) : super(key: key);
  String? image;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(image!),
            backgroundColor: Color(0xffD3C6F9).withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              // child: Image.asset(
              //   "assets/1 9.png",
              //   fit: BoxFit.contain,
              // ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name!,
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 10,
              color: Colors.black,
              fontFamily: font,
              // fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}

class Brand extends StatelessWidget {
  Brand({Key? key, this.images}) : super(key: key);
  String? images;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 60,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.network(
            "$images",
            fit: BoxFit.cover,
          ),
        ),
        decoration: BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage(
          //       "$images",

          //     ),
          //     fit: BoxFit.cover,),
          borderRadius: BorderRadius.circular(10),
          color: primaryLight,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}

class startBox extends StatelessWidget {
  startBox({Key? key, this.image, this.desc, this.title}) : super(key: key);
  String? image;
  String? title;
  String? desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 220,
            // ),
            Padding(
              padding: const EdgeInsets.only(
                left: 22,
                top: 10,
                bottom: 5,
              ),
              child: Container(
                // padding: EdgeInsets.all(10),
                height: 100,
                width: MediaQuery.of(context).size.width - 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryLight,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 140,
                        child: Text(
                          "$title",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 140,
                        child: Text(
                          "$desc",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 8,
                              color: Color(0xff484848),
                              fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 0,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffD3C6F9),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(image!),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Mainbox extends StatelessWidget {
  Mainbox({Key? key, this.image, this.title}) : super(key: key);
  String? image;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: grad1Color,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset("$image"
                // "https://cdn-icons-png.flaticon.com/128/685/685388.png"
                ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$title",
          // "Create Box",
          textAlign: ui.TextAlign.center,
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 12,
            color: grad2Color,
            fontFamily: font,
            // fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}

// class HomeOne extends StatefulWidget { const HomeOne({Key? key}) : super(key: key);

// @override State createState() =>HomeOneState(); }

// var scaffoldKey = GlobalKey();

// class HomeOneState extends State { @override Widget build(BuildContext context) { var theme = Theme.of(context); return Directionality( textDirection: TextDirection.rtl, child: Scaffold( key: scaffoldKey, drawerEnableOpenDragGesture: true,  drawerScrimColor: Colors.red, appBar: AppBar( leading: IconButton( onPressed: () => scaffoldKey.currentState?.openDrawer(), icon: const Icon( Icons.add, color: Colors.red, )), ),