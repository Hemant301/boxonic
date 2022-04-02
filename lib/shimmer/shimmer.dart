import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Shimmer.fromColors(
            baseColor: Color.fromARGB(255, 192, 192, 192),
            highlightColor: Color.fromARGB(255, 235, 235, 235),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      5,
                      (index) => Container(
                            width: MediaQuery.of(context).size.width / (5 + 1),
                            height: 4,
                            color: Colors.grey,
                          )),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 6,
                            width: 150,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 6,
                            width: 150,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 500,
                  height: 150,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 500,
                  height: 150,
                  color: Colors.black,
                ),
              ],
            )),
      ),
    );
  }
}
