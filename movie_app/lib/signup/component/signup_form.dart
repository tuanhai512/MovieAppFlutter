import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiver/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../signin/signinpage.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var username = TextEditingController();
  final password = TextEditingController();
  final conform = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();
  funcSaveInfo(String _username, String _password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _username);
    prefs.setString('password', _password);
    return Navigator.of(context).pushNamed(Signin.routeName);
    //flutter run --no-sound-null-safety
  }

  funcRegister() {
    final strUserName = username.text;
    final strPassword = password.text;
    if (strUserName != '' && strPassword != '') {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Info'),
              content: Text('Register successfull.'),
              actions: [
                TextButton(
                  onPressed: () {
                    funcSaveInfo(strUserName, strPassword);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          });
    }
    // else {
    //   return showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: Text('Warning'),
    //           content: Text('Please fill all information.'),
    //           actions: [
    //             TextButton(
    //               onPressed: () {
    //                 return Navigator.of(context).pop();
    //               },
    //               child: Text('OK'),
    //             ),
    //           ],
    //         );
    //       });
    //   // het Dialog
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextFormField(
                controller: username,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your email ",
                    // If  you are using latest version of flutter then lable text and hint text shown like this
                    // if you r using flutter less then 1.20.* then maybe this is not working properly
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.email_outlined)),
                validator: (conformPassword) {
                  var pass = _passKey.currentState.value;
                  // return conformPassword(conformPassword, pass);
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextFormField(
                  key: _passKey,
                  controller: password,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your password",
                      // If  you are using latest version of flutter then lable text and hint text shown like this
                      // if you r using flutter less then 1.20.* then maybe this is not working properly
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(Icons.lock_outline)),
                  validator: (passwordKey) {
                    return validatePassword(passwordKey);
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextFormField(
                controller: conform,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Re-enter your password",
                    // If  you are using latest version of flutter then lable text and hint text shown like this
                    // if you r using flutter less then 1.20.* then maybe this is not working properly
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.lock_outline)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  funcRegister();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.lightBlue,
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/google-icon.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/twitter.svg"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Password should be more than 8 characters ';
    }
  }

  static String conformPassword(String value, String value2) {
    if (!equalsIgnoreCase(value, value2)) return "Conform password invalid";
  }
  //
  // TextFormField emailTextFormField() {
  //   return TextFormField(
  //     controller: username,
  //     keyboardType: TextInputType.emailAddress,
  //     decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         hintText: "Enter your email ",
  //         // If  you are using latest version of flutter then lable text and hint text shown like this
  //         // if you r using flutter less then 1.20.* then maybe this is not working properly
  //         floatingLabelBehavior: FloatingLabelBehavior.always,
  //         suffixIcon: Icon(Icons.email_outlined)
  //     ),
  //     // validator: Utilities.validateEmail,
  //     onSaved:(value){
  //       setState(() {
  //         username.text = value!;
  //       });
  //     },
  //   );
  // }
  //
  //
  //
  // TextFormField passwordTextFormField() {
  //   return TextFormField(
  //       key: _passKey,
  //       controller: password,
  //       obscureText: true,
  //       keyboardType: TextInputType.number,
  //       decoration: InputDecoration(
  //           border: OutlineInputBorder(),
  //           hintText: "Enter your password",
  //           // If  you are using latest version of flutter then lable text and hint text shown like this
  //           // if you r using flutter less then 1.20.* then maybe this is not working properly
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           suffixIcon: Icon(Icons.lock_outline)
  //       ),
  //       validator: (passwordKey){
  //         return Utilities.validatePassword(passwordKey!);
  //       }
  //   );
  // }
  //
  // TextFormField conformTextFormField() {
  //   return TextFormField(
  //     controller: conform,
  //     obscureText: true,
  //     keyboardType: TextInputType.number,
  //     decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         hintText: "Re-enter your password",
  //         // If  you are using latest version of flutter then lable text and hint text shown like this
  //         // if you r using flutter less then 1.20.* then maybe this is not working properly
  //         floatingLabelBehavior: FloatingLabelBehavior.always,
  //         suffixIcon: Icon(Icons.lock_outline)
  //     ),
  //     validator:  (conformPassword) {
  //       var pass = _passKey.currentState!.value;
  //       return Utilities.conformPassword(conformPassword!, pass);
  //     },
  //     // onSaved: (value){
  //     //   setState(() {
  //     //     conform.text = value!;
  //     //   });
  //     //
  //     // },
  //
  //   );
  // }
}
