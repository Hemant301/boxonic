import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmer_home extends StatelessWidget {
  const Shimmer_home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),

      baseColor: Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
      highlightColor: Colors.grey.shade100.withOpacity(0.5),

      // child: SizedBox(
      //   width: 200.0,
      //   height: 100.0,
      //   child: Shimmer.fromColors(
      //     baseColor: Colors.red,
      //     highlightColor: Colors.yellow,
      //     child: Text(
      //       'Shimmer',
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //         fontSize: 40.0,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
    ));
  }
}

class Shimmer_blog extends StatelessWidget {
  const Shimmer_blog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 120,
                  width: MediaQuery.of(context).size.width - 24,
                ),
              ),
            ),
          ),
        ),
      ),
      baseColor: Colors.grey.shade300.withOpacity(1),
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
    ));
  }
}
