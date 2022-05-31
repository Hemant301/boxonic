import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grad1Color,
        appBar: AppBar(
          backgroundColor: lightWhite2,
          leading: Icon(Icons.arrow_back_ios),
          title: Text(
            "Address",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                color: grad2Color,
                // fontFamily: font,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              "Address Box",
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  color: Colors.black,
                  // fontFamily: font,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.all(5),
              child: FormTTextFild(
                // controller: _pwdController,
                hinttext: "Enter Your Address",
                // icon: (Icons.email),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                // border: Border.all(color: Colors.blue, width: 1),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Pincode",
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  color: Colors.black,
                  // fontFamily: font,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.all(5),
              child: FormTTextFild(
                // controller: _pwdController,
                hinttext: "Enter Your Pincode",
                // icon: (Icons.email),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                // border: Border.all(color: Colors.blue, width: 1),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "LandMark",
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  color: Colors.black,
                  // fontFamily: font,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.all(5),
              child: FormTTextFild(
                // controller: _pwdController,
                hinttext: "Enter Your LandMark",
                // icon: (Icons.email),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                // border: Border.all(color: Colors.blue, width: 1),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 90,
              decoration: BoxDecoration(
                  color: lightWhite3, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Next ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
