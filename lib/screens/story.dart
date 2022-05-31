import 'package:boxoniq/modal/blogmodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

bool swipe = true;

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    homebloc.fetchStories();
    return Scaffold(
      body: StreamBuilder<StoryModal>(
          stream: homebloc.getSories.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return PageView(
              scrollDirection: Axis.vertical,
              onPageChanged: (s) {
                setState(() {
                  swipe = false;
                });
              },
              children: List.generate(
                snapshot.data!.stories.length,
                (i) => PageView(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (i) {},
                    children: List.generate(
                        snapshot.data!.stories[i].image.length,
                        (index) => FeedSlider(
                              num: snapshot.data!.stories[i].image.length,
                              indeX: index,
                              is_swipe: swipe,
                              title: snapshot.data!.stories[i].title,
                              onTap: () {
                                Fluttertoast.showToast(msg: 'Wait');
                              },
                              desc: snapshot.data!.stories[i].story,
                              image:
                                  snapshot.data!.stories[i].image[index].image,
                            ))),
              ),
            );
          }),
    );
  }
}

class FeedSlider extends StatefulWidget {
  FeedSlider(
      {Key? key,
      this.desc,
      this.image,
      this.onTap,
      this.title,
      this.indeX,
      this.num,
      this.is_swipe = true})
      : super(key: key);
  String? image;
  String? title;
  String? desc;
  Function()? onTap;
  bool? is_swipe;
  int? indeX;
  int? num;

  @override
  State<FeedSlider> createState() => _FeedSliderState();
}

class _FeedSliderState extends State<FeedSlider> {
  bool is_like = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          // onDoubleTap: () {
          //   setState(() {
          //     is_like = true;
          //   });
          //   Future.delayed(Duration(seconds: 1), () {
          //     setState(() {
          //       is_like = false;
          //     });
          //   });
          // },
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                '${widget.image}',
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          bottom: 200,
          left: 0,
          right: 0,
          child: Container(
            color: Color.fromARGB(0, 167, 125, 125),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    widget.num!,
                    (index) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: index == (widget.indeX) ? 6 : 5,
                            width: index == widget.indeX ? 6 : 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == widget.indeX
                                    ? Colors.white
                                    : Color.fromARGB(255, 184, 184, 184)),
                          ),
                        )),
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          // left: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: MediaQuery.of(context).size.width - 16,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 223, 223, 223)),
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Container(
                        // width: 100,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Stories',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                    Container(
                      width: 10,
                    )
                  ],
                )),
          ),
        ),
        is_like == true
            ? Center(child: Lottie.asset('assets/like.json', height: 150))
            : Container(),
        widget.is_swipe == true
            ? Center(child: Lottie.asset('assets/swipe.json', height: 250))
            : Container(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(233, 0, 0, 0),
                Color.fromARGB(172, 0, 0, 0),
                Color.fromARGB(160, 0, 0, 0),
                Color.fromARGB(108, 0, 0, 0),
                Color.fromARGB(51, 0, 0, 0),
                Color.fromARGB(6, 0, 0, 0),
              ],
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.title}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                Text(
                  '${widget.desc}',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: widget.onTap,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            //background color of box
                            BoxShadow(
                              color: Color.fromARGB(255, 152, 152, 152),
                              blurRadius: 2.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                0.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Read More',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
