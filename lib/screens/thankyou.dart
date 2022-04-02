import 'package:flutter/material.dart';

class Thankyou extends StatelessWidget {
  const Thankyou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Image.asset('assets/ss2.png'),
          Positioned(
              top: 40,
              left: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back),
              )),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'assets/ss3.png',
                  height: 250,
                ),
                Text(
                  'Ah! You’re Awesome \n That’s what we love to see',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Your Order is Placed Successfully. \nORDER ID IS #BXNQ1254785',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, letterSpacing: 1.5),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 280,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Color(0xff30AC1B),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Countinue Shopping',
                        style: TextStyle(
                            fontSize: 13,
                            letterSpacing: 1.5,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 280,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            offset: Offset(
                              0.5,
                              0.5,
                            ))
                      ],
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'See Booking',
                        style: TextStyle(
                            fontSize: 13,
                            letterSpacing: 1.5,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/ss.png',
                height: 350,
              ))
        ],
      ),
    );
  }
}
