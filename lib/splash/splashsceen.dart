import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      if (userCred.isUserLogin()) {
        Navigator.of(context).pushReplacementNamed(
          '/StartScreen',
        );
      } else {
        Navigator.of(context).pushReplacementNamed(
          '/onbording',
        );
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 280,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/logo.png",
                height: 150,
                width: 150,
              ),
            ),
            // Center(
            //     child: Text(
            //   "Boxoniq",
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //     color: lightWhite3,
            //   ),
            // )),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: RichText(
                text: TextSpan(
                    text: "Crafted by\n",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                    children: [
                      TextSpan(
                        text: "TheCybertize",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
