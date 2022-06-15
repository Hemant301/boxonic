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

class Shimmer_wallet extends StatelessWidget {
  const Shimmer_wallet({
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
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),

              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 80,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white,
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white,
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Container(
              //     width: 80,
              //     height: 8,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Container(
              //     width: 50,
              //     height: 8,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Container(
              //     width: 40,
              //     height: 8,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white,
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 100,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      baseColor: Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
    ));
  }
}

class Trasaction_shimmer extends StatelessWidget {
  const Trasaction_shimmer({
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
            children: List.generate(
              5,
              (index) => Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      baseColor: Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
    ));
  }
}

class subsbenifit_shimmer extends StatelessWidget {
  const subsbenifit_shimmer({
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
            children: List.generate(
              3,
              (index) => Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 + 20,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      baseColor: Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
    ));
  }
}

class Supercategory_shimmer extends StatelessWidget {
  const Supercategory_shimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Row(
            children: List.generate(
              4,
              (index) => Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      baseColor: Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
    ));
  }
}

class Subcategory_shimmer extends StatelessWidget {
  const Subcategory_shimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      baseColor: Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
    ));
  }
}

class Bannercategory_shimmer extends StatelessWidget {
  const Bannercategory_shimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                1,
                (index) => Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      baseColor: Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
    ));
  }
}

class Billing_shimmer extends StatelessWidget {
  Billing_shimmer({Key? key, required this.number, required this.width})
      : super(key: key);
  int number;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: List.generate(
                number,
                (index) => Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: width,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      baseColor: Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
    ));
  }
}
