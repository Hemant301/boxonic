import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Editaddress extends StatefulWidget {
  const Editaddress({Key? key}) : super(key: key);

  @override
  State<Editaddress> createState() => _EditaddressState();
}

class _EditaddressState extends State<Editaddress> {
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String statename = "";

  @override
  Widget build(BuildContext context) {
    homebloc.fetchState();

    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['address']);
    setState(() {
      addressController.text = rcvdData['address'];
      pincodeController.text = rcvdData['pincode'];
      landmarkController.text = rcvdData['landmark'];
      phoneController.text = rcvdData['phone'];
      statename = rcvdData['state'];
      landmarkController.text = rcvdData['landmark'];
      nameController.text = rcvdData['name'];
    });
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
              // fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 16,
                    color: Colors.black,
                    // fontFamily: font,
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
                  controller: nameController,
                  // maxLines: 4,
                  hinttext: "Enter your Name",

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
                  "Address",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 16,
                    color: Colors.black,
                    // fontFamily: font,
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
                  "State",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 16,
                    color: Colors.black,
                    // fontFamily: font,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<StateModal>(
                  stream: homebloc.getstate.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return DropDown(
                      items: List.generate(snapshot.data!.data.length,
                          (index) => snapshot.data!.data[index].state!),
                      hint: Text(statename),
                      icon: Icon(
                        Icons.expand_more,
                        color: Colors.blue,
                      ),
                      onChanged: (s) {
                        statename = s.toString();
                        // setState(() {});
                      },
                    );
                  }),
              SizedBox(
                height: 15,
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
                    // fontFamily: font,
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
                    // fontFamily: font,
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
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Phone number",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 16,
                    color: Colors.black,
                    // fontFamily: font,
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
                  controller: phoneController,
                  hinttext: "Enter Your Pincode",
                  // icon: (Icons.email),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  // border: Border.all(color: Colors.blue, width: 1),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  AuthApi _authapi = AuthApi();
                  try {
                    Map data = await _authapi.doEditAddress(
                        name: nameController.text,
                        address: addressController.text,
                        landmark: landmarkController.text,
                        add_id: rcvdData['id'],
                        state: statename,
                        phone: phoneController.text,
                        pincode: pincodeController.text);
                    print(data["response"].runtimeType);

                    if (data['response'] == '1') {
                      setState(() {
                        homebloc.fetchListAddress();
                      });
                      Navigator.pop(context);
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
                      "Save",
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
    );
  }
}
