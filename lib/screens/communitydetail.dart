import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Communitydetail extends StatefulWidget {
  const Communitydetail({Key? key}) : super(key: key);

  @override
  State<Communitydetail> createState() => _CommunitydetailState();
}

class _CommunitydetailState extends State<Communitydetail> {
  TextEditingController answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    homebloc.fetchanswerDetails(rcvdData['id']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite2,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          rcvdData['ques'],
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              // fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
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
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  decoration: BoxDecoration(
                      boxShadow: [
                        //background color of box
                        BoxShadow(
                          color: Color.fromARGB(255, 148, 148, 148),
                          blurRadius: 15.0, // soften the shadow
                          spreadRadius: 1.0, //extend the shadow
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
                        rcvdData['name'],
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        rcvdData['ques'],
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
                                  height:
                                      MediaQuery.of(context).size.height - 50,
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
                                              topRight: Radius.circular(10.0))),
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
                                              "Answer",
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
                                              controller: answerController,
                                              maxLines: 10,
                                              hinttext:
                                                  "Write your answer here..",

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
                                                    await _authapi.addAnswer(
                                                  answer: answerController.text,
                                                  ques_id: rcvdData['id'],
                                                );
                                                print(data["response"]
                                                    .runtimeType);

                                                if (data['response'] == '1') {
                                                  setState(() {
                                                    answerController.text = "";
                                                  });
                                                  Navigator.pop(context);
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
                              'Reply',
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
                      backgroundImage: NetworkImage(rcvdData['image']),
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 40,
              ),
              Text(
                'Answers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<AnswerModal>(
                  stream: homebloc.getanswerdetail.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return Column(
                      children: List.generate(
                        snapshot.data!.answer.length,
                        (index) => CommunityComments(
                          name: snapshot.data!.answer[index].user_name!,
                          image: snapshot.data!.answer[index].img!,
                          comment: snapshot.data!.answer[index].answer!,
                          time: snapshot.data!.answer[index].created_on!,
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

class CommunityComments extends StatelessWidget {
  CommunityComments({Key? key, this.name, this.image, this.comment, this.time})
      : super(key: key);
  String? name;
  String? image;
  String? time;
  String? comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              //background color of box
              BoxShadow(
                color: Color.fromARGB(255, 148, 148, 148),
                blurRadius: 15.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  1.0, // Move to right 10  horizontally
                  1.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            color: Colors.green,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      '$image',
                      errorBuilder: (context, error, stackTrace) =>
                          Image.network(
                        'https://cdn3.iconfinder.com/data/icons/bold-blue-glyphs/32/User_Avatar_Human_Profile_Face_Circle-512.png',
                        height: 50,
                      ),
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        '$time',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '$comment',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
