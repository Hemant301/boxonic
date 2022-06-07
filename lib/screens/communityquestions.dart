// import 'package:flutter/material.dart';

// class Communityquestions extends StatelessWidget {
//   const Communityquestions({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'package:boxoniq/modal/blogmodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';

class Communityquestions extends StatefulWidget {
  const Communityquestions({Key? key}) : super(key: key);

  @override
  State<Communityquestions> createState() => _CommunityquestionsState();
}

class _CommunityquestionsState extends State<Communityquestions> {
  @override
  Widget build(BuildContext context) {
    homebloc.fetchcommunityall();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite2,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'All questions',
          style: TextStyle(color: Colors.black),
        ),
        actions: [],
      ),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
            ),
            StreamBuilder<Questionmodal>(
                stream: homebloc.getCommunityAll.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: 8.4 / 11,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                        snapshot.data!.ques.length,
                        (index) => InkWell(
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
                              child: communitysearchbtn(
                                img: snapshot.data!.ques[index].img,
                                text: snapshot.data!.ques[index].question,
                                number: snapshot.data!.ques[index].anser_count
                                    .toString(),
                              ),
                            )),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class communitysearchbtn extends StatelessWidget {
  communitysearchbtn({Key? key, this.text, this.img, this.number})
      : super(key: key);
  String? text;
  String? img;
  String? number;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          top: 30,
          bottom: 30,
          right: 18.0,
        ),
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
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
                  'Q. $text',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.message),
                    SizedBox(
                      width: 5,
                    ),
                    Text('$number')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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
              ],
            )),
          ),
          Positioned(
            top: -25,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(img!),
              ),
            ),
          )
        ]));
  }
}
