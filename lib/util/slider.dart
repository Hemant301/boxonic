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
    List<String> image = [
      "https://img.freepik.com/free-photo/mother-baby-girl-doctors-office_329181-9261.jpg?w=740",
      'https://img.freepik.com/free-vector/flat-design-stages-baby-boy_23-2148974790.jpg?w=740',
      'https://img.freepik.com/free-vector/flat-design-baby-shower-zoom-background_23-2149240976.jpg?w=740',
      'https://img.freepik.com/free-vector/flat-design-baby-shower-zoom-background_23-2149240974.jpg?w=740'
    ];
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
                aspectRatio: 4 / 2,
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
                image.length,
                (index) => InkWell(
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/categorylist',
                  //       arguments: {'id': (widget.data![index].cat).toString()});
                  // },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      image[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )));
  }
}
