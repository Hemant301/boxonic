import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Cummunityonboard extends StatefulWidget {
  const Cummunityonboard({Key? key}) : super(key: key);

  @override
  State<Cummunityonboard> createState() => _CummunityonboardState();
}

class _CummunityonboardState extends State<Cummunityonboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightWhite2,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            "Community",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                color: grad2Color,
                // fontFamily: font,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: 30,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find the answer on\njust on Tap !',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet consectetur\nadipisicing elit. adipisicing elitadipisicing\nelit  adipisicing elitadipisicing',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 1,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/community');
                              },
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    'Get started',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Back to home',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Lottie.asset('assets/community.json', height: 230),
              SizedBox(
                height: 20,
              ),
              Text(
                'Features',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 88.0),
                child: Divider(
                  thickness: 2,
                  // height: 200,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                    boxShadow: [
                      //background color of box
                      BoxShadow(
                        color: Color.fromARGB(255, 175, 175, 175),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          1.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    color: Color.fromARGB(255, 255, 195, 195),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur\nadipisicing elit. adipisicing elitadipisicing\nelit  adipisicing elitadipisicing',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 1,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
