import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/modal/blogmodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  TextEditingController questionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    homebloc.fetchquestions();
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
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/communitysearch');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
              ),
              Stack(clipBehavior: Clip.none, children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  decoration: BoxDecoration(
                      boxShadow: [
                        //background color of box
                        BoxShadow(
                          color: Color.fromARGB(255, 205, 205, 205),
                          blurRadius: 5.0, // soften the shadow
                          spreadRadius: 2.0, //extend the shadow
                          offset: Offset(
                            1.0, // Move to right 10  horizontally
                            1.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        'Ask & Discuss\neverything here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) {
                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  // height: 500,
                                  color: Colors
                                      .transparent, //could change this to Color(0xFF737373),
                                  //so you don't have to change MaterialApp canvasColor
                                  child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 226, 226, 226),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight:
                                                  const Radius.circular(10.0))),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                          Icons.arrow_back),
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(Icons.close))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Quesion",
                                              style: TextStyle(
                                                letterSpacing: 1,
                                                fontSize: 16,
                                                color: Colors.black,
                                                // fontFamily: font,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                25,
                                            // padding: EdgeInsets.all(5),
                                            child: FormTTextFild(
                                              controller: questionController,
                                              maxLines: 10,
                                              hinttext: "Ask your Quesion here",

                                              // icon: (Icons.email),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              // color: Colors.white,
                                              // border: Border.all(color: Colors.blue, width: 1),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              AuthApi _authapi = AuthApi();
                                              try {
                                                Map data =
                                                    await _authapi.addQuestion(
                                                  question:
                                                      questionController.text,
                                                );
                                                print(data["response"]
                                                    .runtimeType);

                                                if (data['response'] == '1') {
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg: " ${data['msg']}! ",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              } catch (e) {}
                                            },
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40,
                                              decoration: BoxDecoration(
                                                  color: lightWhite2,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Center(
                                                child: Text(
                                                  "Next ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              });
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              'Post',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                      )
                    ],
                  )),
                ),
                Positioned(
                  top: -45,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(userCred.getUserImage()),
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 40,
              ),
              Text(
                'Popular Questions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<Questionmodal>(
                  stream: homebloc.getQuestion.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: List.generate(
                            snapshot.data!.ques.length,
                            (index) => communitybtn(
                              onTap: () {
                                Navigator.pushNamed(context, '/communitydetail',
                                    arguments: {
                                      'id': snapshot
                                          .data!.ques[index].question_id,
                                      'ques':
                                          snapshot.data!.ques[index].question,
                                      'image': snapshot.data!.ques[index].img,
                                      'name':
                                          snapshot.data!.ques[index].user_name,
                                    });
                              },
                              img: snapshot.data!.ques[index].img,
                              text: snapshot.data!.ques[index].question,
                              answer:
                                  '${snapshot.data!.ques[index].anser_count}',
                              user: snapshot.data!.ques[index].user_name,
                              date: snapshot.data!.ques[index].created_on,
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class communitybtn extends StatelessWidget {
  communitybtn(
      {Key? key,
      this.text,
      this.img,
      this.answer,
      this.user,
      this.date,
      this.onTap})
      : super(key: key);
  String? text;
  String? img;
  String? answer;
  String? user;
  String? date;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
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
            child: Center(
                child: Column(
              children: [
                Text(
                  '$user',
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Q. ${text}',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.message),
                    SizedBox(
                      width: 5,
                    ),
                    Text('$answer')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: onTap,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'See Answers',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('$date')
              ],
            )),
          ),
          Positioned(
            top: -35,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage('$img'),
                onBackgroundImageError: ((_, __) => print('error')),
              ),
            ),
          )
        ]));
  }
}
