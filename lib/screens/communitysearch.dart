import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';

class Communitysearch extends StatelessWidget {
  const Communitysearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite2,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              // controller: _searchController,
              // onChanged: (s) {
              //   homebloc.fetchSerach(s);
              // },
              decoration: InputDecoration(
                  hintText: "Search for questions",
                  hintStyle: TextStyle(fontSize: 12),

                  // prefixIcon: Icon(Icons.email),
                  border: InputBorder.none),
            ),
          ],
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
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 8.4 / 11,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(
                  5,
                  (index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/communitydetail');
                        },
                        child: communitysearchbtn(
                          img: 'https://www.w3schools.com/howto/img_avatar.pn',
                          text: ' Why this kolaveri D ?',
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}

class communitysearchbtn extends StatelessWidget {
  communitysearchbtn({Key? key, this.text, this.img}) : super(key: key);
  String? text;
  String? img;

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
                  'Q. Why this kolaveri still a D? How can we find this D?',
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
                    Text('45')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/communitydetail');
                  },
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
                backgroundImage: NetworkImage(
                    'https://www.w3schools.com/howto/img_avatar.png'),
              ),
            ),
          )
        ]));
  }
}
