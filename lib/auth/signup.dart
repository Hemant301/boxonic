import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _pwdController = TextEditingController();
TextEditingController _dobController = TextEditingController();
TextEditingController _babynameController = TextEditingController();
TextEditingController _refController = TextEditingController();

class Creatuser extends StatefulWidget {
  const Creatuser({Key? key}) : super(key: key);

  @override
  State<Creatuser> createState() => _CreatuserState();
}

class _CreatuserState extends State<Creatuser> {
  bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                color: lightWhite3,
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(50),
                //     bottomRight: Radius.circular(50))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, left: 30),
                    child: Text(
                      "Create User ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   left: 200,
            //   child: CircleAvatar(
            //     backgroundColor: Colors.transparent.withOpacity(0.1),
            //     radius: 70,
            //   ),
            // ),
            // Positioned(
            //   left: 260,
            //   top: 40,
            //   child: CircleAvatar(
            //     backgroundColor: Colors.transparent.withOpacity(0.1),
            //     radius: 70,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 40,
                    // ),
                    Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Color(0xff000e29),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTTextFild(
                      controller: _nameController,
                      hinttext: "Enter name",
                      keyboardType: TextInputType.name,
                      // icon: (Icons.email),
                    ),
                    // Text(
                    //   "Slecte User Type",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     letterSpacing: 1,
                    //     color: Colors.grey[800],
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   height: 45,
                    //   width: MediaQuery.of(context).size.width,
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey[100],
                    //       borderRadius: BorderRadius.circular(15)),
                    //   child: DropDown(
                    //     items: [
                    //       "Retailer",
                    //       "Wholesaler",
                    //       "Vendor",
                    //     ],
                    //     hint: Text(
                    //       "CHOOSE YOUR CATOGARY                                  ",
                    //       style: TextStyle(
                    //           color: Colors.red,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 12),
                    //     ),
                    //     icon: Icon(
                    //       Icons.expand_more,
                    //       color: Colors.red,
                    //     ),
                    //     onChanged: print,
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Mobile Number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTTextFild(
                      num: 10,
                      controller: _phoneController,
                      hinttext: "Enter Mobile Number",
                      keyboardType: TextInputType.number,
                      // icon: (Icons.email),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Baby Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTTextFild(
                      // num: 10,
                      controller: _babynameController,
                      hinttext: "Enter Baby Name",
                      // keyboardType: TextInputType.number,
                      // icon: (Icons.email),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Baby Date of birth",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DateTimePicker(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Date of birth',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        controller: _dobController,
                        type: DateTimePickerType.date,
                        // initialValue: '16/12/2001',
                        firstDate: DateTime(1947),
                        lastDate: DateTime(2200),
                        dateLabelText: 'Date of birth',
                        dateHintText: 'Date of birth',

                        style: TextStyle(fontSize: 16),
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextFormField(
                          validator: (value) =>
                              EmailValidator.validate(_emailController.text)
                                  ? null
                                  : "Please enter a valid email",
                          controller: _emailController,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              filled: true,
                              fillColor: Colors.grey[100],
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    // FormTTextFild(

                    //   controller: _emailController,
                    //   hinttext: "Enter Shop Email",
                    //   // icon: (Icons.email),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTTextFild(
                      controller: _pwdController,
                      hinttext: "Enter Password",
                      // icon: (Icons.email),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Referral code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTTextFild(
                      controller: _refController,
                      hinttext: "Enter Referral code",
                      // icon: (Icons.email),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    isLoading == true
                        ? Center(child: CircularProgressIndicator())
                        : Container(),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          if (_nameController.text == "" ||
                              _nameController.text == "") {
                            Fluttertoast.showToast(
                                msg: "Invalid Name!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return;
                          } else if (_emailController.text == " " ||
                              _emailController.text == "") {
                            Fluttertoast.showToast(
                                msg: "Invalid Email!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return;
                          } else if ((_phoneController.text).length <= 9) {
                            Fluttertoast.showToast(
                                msg: "Invalid Phone No!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return;
                          } else if (_pwdController.text == " " ||
                              _pwdController.text == "") {
                            Fluttertoast.showToast(
                                msg: "Invalid Password!",
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
                            Map data = await _authapi.doSugnup(
                                shopowneremail: "${_emailController.text}",
                                pwd: "${_pwdController.text}",
                                shopownerphone: "${_phoneController.text}",
                                babydob: "${_dobController.text}",
                                babyname: "${_babynameController.text}",
                                referral: "${_refController.text}",
                                shopownername: "${_nameController.text}");
                            print(data);

                            if (data['response'] == '1') {
                              setState(() {
                                isLoading = false;
                              });
                              Future.delayed(Duration(seconds: 0), () {
                                Navigator.of(context).pushNamed(
                                    '/otpverification',
                                    arguments: {'ACCId': data['accountId']});
                                print(data);
                              });
                              Fluttertoast.showToast(
                                  msg: "Verify OTP!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              Fluttertoast.showToast(
                                  msg: " ${data['message']}! ",
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
                    SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
