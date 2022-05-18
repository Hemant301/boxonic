import 'dart:io';

import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/shearfunctions.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    homebloc.fetchuserDetails();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightWhite2,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          // leadingWidth: 0,
          // leading: Container(),
          title: Text(
            'My Profile',
            style: TextStyle(color: Colors.black),
          )),
      body: StreamBuilder<UserdetailModal>(
          stream: homebloc.getuserdetails.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          try {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              File file = File(result.files.single.path!);
                              print(file.path);
                              showProgressDialog(context);
                              HomeApi _api = HomeApi();
                              Map data = await _api.doUploadProfile(
                                  file, userCred.getUserId());
                              print(data);
                              if (data['response'] == 1) {
                                positiveToast(data['msg']);
                                setState(() {});

                                 homebloc.fetchuserDetails();

                              } else {
                                negetiveToast(data['msg']);
                              }
                              Navigator.pop(context);
                            } else {
                              negetiveToast("Something went wrong");
                              // User canceled the picker
                            }
                          } catch (e) {
                            negetiveToast(e.toString());
                          }
                        },
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.blue)),
                            child: ClipOval(
                              child: Stack(
                                children: [
                                  Image.network(
                                    snapshot.data!.image!,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        color: Colors.amber.withOpacity(1),
                                        height: 30,
                                        child: const Center(
                                          child: Text("Edit",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       border: Border.all(color: Colors.black)),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(10.0),
                      //     child: CircleAvatar(
                      //       radius: 45,
                      //       backgroundImage: NetworkImage(
                      //         "https://cdn-icons-png.flaticon.com/128/1177/1177568.png",
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data!.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(
                                1,
                                2,
                              ), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(
                                1,
                                2,
                              ), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/editprofile');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.edit),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Mobile Number ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Baby Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Baby Date of Birth',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data!.name!),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.phone!),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.email!),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.baby_name!),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.baby_dob!),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Container(
                                      //     width: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width /
                                      //             2 -
                                      //         20,
                                      //     child: Text(snapshot.data!.address!)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
