import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController babynameController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homebloc.fetchuserDetails();
    getMydata();
  }

  getMydata() {
    Future.delayed(Duration(seconds: 0), () {
      homebloc.liveuserdetails.listen((value) {
        nameController.text = value.name!;
        phoneController.text = value.phone!;
        emailController.text = value.email!;
        babynameController.text = value.baby_name!;
        dobController.text = value.baby_dob!;
      });
    });
  }

  bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightWhite2,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          // leadingWidth: 0,
          // leading: Container(),
          title: Text(
            'Edit Profile',
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              FormTTextFild(
                hinttext: 'Name',
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Mobile Number ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              FormTTextFild(
                hinttext: 'Mobile Number ',
                controller: phoneController,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              FormTTextFild(
                hinttext: 'Email',
                controller: emailController,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Baby Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              FormTTextFild(
                hinttext: 'Baby Name',
                controller: babynameController,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Baby dob',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              FormTTextFild(
                hinttext: 'Baby dob',
                controller: dobController,
              ),
              SizedBox(
                height: 50,
              ),
              isLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
              Center(
                child: InkWell(
                  onTap: () async {
                    if (nameController.text == "" ||
                        nameController.text == "") {
                      Fluttertoast.showToast(
                          msg: "Invalid Name!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      return;
                    } else if (emailController.text == " " ||
                        emailController.text == "") {
                      Fluttertoast.showToast(
                          msg: "Invalid Email!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      return;
                    } else if ((phoneController.text).length <= 9) {
                      Fluttertoast.showToast(
                          msg: "Invalid Phone No!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      return;
                    }
                    setState(() {
                      isLoading = true;
                    });

                    AuthApi _authapi = AuthApi();
                    try {
                      Map data = await _authapi.editProfile(
                          email: "${emailController.text}",
                          phone: "${phoneController.text}",
                          babydob: "${dobController.text}",
                          babyname: "${babynameController.text}",
                          name: "${nameController.text}");
                      print(data);

                      if (data['response'] == '1') {
                        setState(() {
                          isLoading = false;
                        });
                        Future.delayed(Duration(seconds: 0), () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/profile', ModalRoute.withName('/StartScreen'));
                          print(data);
                        });
                        Fluttertoast.showToast(
                            msg: data['msg'],
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
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } catch (e) {}
                    // Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 90,
                    decoration: BoxDecoration(
                        color: lightWhite3,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Sign Up ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              // Text(
              //   'Mobile Number ',
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
