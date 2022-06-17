import 'package:boxoniq/api/homeapi.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  check() async {
    Map data = await homeApi.getNumberofquestion();
    print(data);
    setState(() {
      numberQues = data['quesion_count'];
    });
  }

  String numberQues = "0";
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
                          'Building network for the\nsmartest Parents',
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
                          'Get in touch with parents across india with best tips. Share thoughts, concerns, ask questions & get answers of anything related to baby, baby care, parenting or even baby products ',
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
                              '$numberQues Questions Asked',
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
        const      SizedBox(
                height: 20,
              ),
           const   Text(
                'Features',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
           const   Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Text(
                  'Boxoniq community keeps you on top of everything happening in your community ',
                  textAlign: TextAlign.center,
                ),
              ),
          const    Padding(
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
                width: MediaQuery.of(context).size.width - 80,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/info.png',
                      height: 150,
                    ),
              const      Text(
                      'Get information ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                 const   SizedBox(
                      height: 5,
                    ),
               const     Text(
                      'Find the best solutions, recommended by your Community network ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
              ),
          const    SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/share.png',
                      height: 150,
                    ),
                const    Text(
                      'Share topics & events',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                const    SizedBox(
                      height: 5,
                    ),
              const      Text(
                      'Share common topics , babies events & news',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
              ),
           const   SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80,
                padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/community.png',
                      height: 150,
                    ),
                const    Text(
                      'Build community',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                const    SizedBox(
                      height: 5,
                    ),
                const    Text(
                      'Easy communication.Experience the power of community ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
              ),
         const     SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/community');
                },
                child: Container(
                    padding:const EdgeInsets.all(10),
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child:const Center(
                        child: Text(
                      'Get started',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ))),
              ),
          const    SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
