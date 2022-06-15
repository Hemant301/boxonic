import 'package:boxoniq/modal/blogmodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Trackorder extends StatefulWidget {
  const Trackorder({Key? key}) : super(key: key);

  @override
  State<Trackorder> createState() => _TrackorderState();
}

class _TrackorderState extends State<Trackorder> {
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['track_id']);
    homebloc.trackOrder(rcvdData['track_id']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite2,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Track details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<TrackModal>(
            stream: homebloc.getTrackorder.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                        snapshot.data!.track.length,
                        (index) => TimelineTile(
                          indicatorStyle: const IndicatorStyle(
                              color:
                                  // snapshot.data!.track[index].status == 1
                                  //     ?
                                  Colors.green
                              // : Color.fromARGB(255, 204, 204, 204)
                              ),
                          alignment: TimelineAlign.start,
                          beforeLineStyle: const LineStyle(
                              color:
                                  // snapshot.data!.track[index].status == 1
                                  // ?
                                  Colors.green,
                              //     : Color.fromARGB(255, 204, 204, 204),
                              thickness: 1.5),
                          afterLineStyle: const LineStyle(
                              color:
                                  // snapshot.data!.track[index].status == 1
                                  //     ?
                                  Colors.green
                              // : Color.fromARGB(255, 204, 204, 204)
                              ,
                              thickness: 1.5),
                          endChild: Container(
                            padding: EdgeInsets.only(left: 10, top: 15),
                            constraints: const BoxConstraints(
                              minHeight: 80,
                            ),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.track[0].status[index]
                                          .pickrr_status!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      snapshot.data!.track[index].status[0]
                                          .status_body!,
                                    ),
                                    Text(
                                      snapshot.data!.track[index].status[0]
                                          .status_time!,
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
