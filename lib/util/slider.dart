import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class MyCorosule extends StatefulWidget {
  MyCorosule({
    Key? key,
  }) : super(key: key);
  // List<SliderimgModal>? data;
  @override
  _MyCorosuleState createState() => _MyCorosuleState();
}

class _MyCorosuleState extends State<MyCorosule> {
  int ci = 0;

  @override
  Widget build(BuildContext context) {
    homebloc.fetchSlider();
    // List<String> image = [
    //   "assets/b1.png",
    //   "assets/b1.png",
    //   "assets/b1.png",
    // ];
    return StreamBuilder<HomeSlider>(
        stream: homebloc.getHomeSlider.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  // height: 180,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ], borderRadius: BorderRadius.circular(20)),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (int i, G) {
                        setState(() {
                          ci = i;
                        });
                      },
                      //onPageChanged: (int index) {},
                      //height: size.width / 2,
                      aspectRatio: 4.5 / 2,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      //onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: List.generate(
                      snapshot.data!.imgs.length,
                      (index) => InkWell(
                        // onTap: () {
                        //   Navigator.pushNamed(context, '/categorylist',
                        //       arguments: {'id': (widget.data![index].cat).toString()});
                        // },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            snapshot.data!.imgs[index].slide!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  )));
        });
  }
}
