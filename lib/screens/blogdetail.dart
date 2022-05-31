import 'package:boxoniq/modal/blogmodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:flutter/material.dart';

class Blogdetail extends StatelessWidget {
  const Blogdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    homebloc.fetchBlogdetails(rcvdData['id']);
    return Scaffold(
      body: StreamBuilder<BlogdetailsModal>(
          stream: homebloc.getBlogDetails.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.network(
                    snapshot.data!.image!,
                    fit: BoxFit.cover,
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(),
                //   // height: MediaQuery.of(context).size.height,
                //   child: Image.network(
                //       'https://images.unsplash.com/photo-1652352530301-dc807f7113a4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80'),
                // ),
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.1, 0.28, 0.7, 0.9],
                      colors: [
                        Colors.black.withOpacity(0.78),
                        Colors.black.withOpacity(0.75),
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.arrow_back)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 240,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.title!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: Colors.white,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                snapshot.data!.time!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              // height: 200,

                              child: Text(
                                snapshot.data!.desc!,
                                style: TextStyle(letterSpacing: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
