import 'package:boxoniq/modal/blogmodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homebloc.fetchBlogList();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: lightWhite2,
        title: Text(
          "Blogs",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              // // fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<BlogModal>(
                stream: homebloc.getBlogList.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 9.5 / 12,
                        crossAxisCount: 2,
                        children: List.generate(
                          snapshot.data!.blogs.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/blogdetail',
                                    arguments: {
                                      'id': snapshot.data!.blogs[index].id,
                                      'image':
                                          snapshot.data!.blogs[index].image,
                                    });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Stack(children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      // border:
                                      //     Border.all(color: Colors.black, width: 1.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 176, 176, 176),
                                          blurRadius: 5.0, // soften the shadow
                                          spreadRadius: 2.0, //extend the shadow
                                          offset: Offset(
                                            0.0, // Move to right 10  horizontally
                                            0.0, // Move to bottom 10 Vertically
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 220,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        snapshot.data!.blogs[index].image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 220,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        stops: [0.1, 0.28, 0.6, 0.8],
                                        colors: [
                                          Color.fromARGB(136, 0, 0, 0)
                                              .withOpacity(0.78),
                                          Color.fromARGB(95, 0, 0, 0)
                                              .withOpacity(0.75),
                                          Color.fromARGB(0, 0, 0, 0),
                                          Color.fromARGB(0, 255, 244, 40),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // top: 140,
                                    left: 0,
                                    right: 0,
                                    bottom: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data!.blogs[index].title!,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
