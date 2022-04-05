import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMydata();
  }

  getMydata() {
    homebloc.liveAddress.listen((value) {
      addressController.text = value.addess!;
      pincodeController.text = value.pincode!;
      landmarkController.text = value.landmark!;
    });
  }

  @override
  Widget build(BuildContext context) {
    homebloc.fetchaddess();
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['activeIndex']);
    print(rcvdData['activeIndex'].runtimeType);
    print(rcvdData['total_amount']);

    return Scaffold(
        backgroundColor: grad1Color,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: lightWhite2,
          title: Text(
            "Address",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                color: grad2Color,
                fontFamily: font,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Address",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: font,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 25,
                    // padding: EdgeInsets.all(5),
                    child: FormTTextFild(
                      controller: addressController,
                      maxLines: 4,
                      hinttext: "Enter Your Address",

                      // icon: (Icons.email),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.white,
                      // border: Border.all(color: Colors.blue, width: 1),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Pincode",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: font,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    padding: EdgeInsets.all(5),
                    child: FormTTextFild(
                      controller: pincodeController,
                      hinttext: "Enter Your Pincode",
                      // icon: (Icons.email),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      // border: Border.all(color: Colors.blue, width: 1),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Landmark",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: font,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    padding: EdgeInsets.all(5),
                    child: FormTTextFild(
                      controller: landmarkController,
                      hinttext: "Enter Your LandMark",
                      // icon: (Icons.email),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.white,
                      // border: Border.all(color: Colors.blue, width: 1),

                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.4),
                      //     spreadRadius: 1,
                      //     blurRadius: 1,
                      //     offset: Offset(1, 3), // changes position of shadow
                      //   ),
                      // ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () async {
                      AuthApi _authapi = AuthApi();
                      try {
                        Map data = await _authapi.doSaveAddress(
                            address: addressController.text,
                            landmark: landmarkController.text,
                            pincode: pincodeController.text);
                        print(data["response"].runtimeType);

                        if (data['response'] == '1') {
                          Future.delayed(Duration(seconds: 0), () {
                            if (rcvdData['activeIndex'] == 0) {
                              Navigator.pushNamed(context, "/subscription",
                                  arguments: {
                                    'total_amount': rcvdData['total_amount']
                                  });
                            } else {
                              Navigator.pushNamed(context, "/checkwallet",
                                  arguments: {
                                    'total_amount': rcvdData['total_amount']
                                  });
                            }
                          });
                          Fluttertoast.showToast(
                              msg: "${data['msg']}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: " ${data['msg']}! ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      } catch (e) {}
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          color: lightWhite2,
                          borderRadius: BorderRadius.circular(20)),
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
