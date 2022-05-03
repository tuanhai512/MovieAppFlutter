import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/home/homepage.dart';
import 'package:movie_app/screen/landingPage.dart';
import 'package:movie_app/signup/signuppage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/component/fragment/home_frag/product_popular.dart';

class SigninForm extends StatefulWidget {
  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  var prefs;
  final username = TextEditingController();
  final password = TextEditingController();
   late FToast fToast;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _getData();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
    if(!prefs.getString('username').isEmpty){
      username.text = prefs.getString('username');
      password.text = prefs.getString('password');
      _value = prefs.getBool('check');
      //print(_value.toString());
    }
  }
  funcLogin() async {
    final strUserName = username.text;
    final strPassword = password.text;
    // get info from sharereference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? reUsername = prefs.getString('username');
    String? rePassword = prefs.getString('password');
    //
    if (strUserName == reUsername && strPassword == rePassword) {
      // Navigator.of(context).pushReplacementNamed(landingPage.routeName);

      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Warning'),
              content: Text('Username or password is not correct.'),
              actions: [
                TextButton(
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          });
    }
  }

  funcRegister() {
    return Navigator.of(context).pushNamed(SignupPage.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Food Now",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign in with your email and password  \nor continue with social media",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      onSaved: (_value) {
                        setState(() {
                          username.text = _value!;
                        });
                      },
                      controller: username,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Username",
                          prefixIcon: Icon(Icons.mail_outline)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline_rounded)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {
                          funcLogin();

                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.lightBlueAccent,
                        child: Text("Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                                'assets/icon/icons8-facebook.svg'),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                                'assets/icon/icons8-google.svg'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('Does not have account?'),
                              TextButton(
                                child: Text(
                                  ' Sign in',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                onPressed: () {
                                  funcRegister();
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// class _LoginPageState extends State<SigninForm> {
// TextEditingController username = new TextEditingController();
// TextEditingController password = new TextEditingController();
//
// bool checkValue = false;
// Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//
// @override
// void initState() {
//   super.initState();
//   getCredential();
// }
//
// @override
// Widget build(BuildContext context) {
//   return new Scaffold(
//     appBar: new AppBar(
//       elevation: 0.0,
//       backgroundColor: Colors.white12,
//     ),
//     body: new SingleChildScrollView(
//       child: _body(),
//       scrollDirection: Axis.vertical,
//     ),
//   );
// }
//
// Widget _body() {
//   return new Container(
//     padding: EdgeInsets.only(right: 20.0, left: 20.0),
//     child: new Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         new Container(
//           margin: EdgeInsets.all(30.0),
//           child: new Image.asset(
//             "assets/images/flutter_icon.png",
//             height: 100.0,
//           ),
//         ),
//         new TextField(
//           controller: username,
//           decoration: InputDecoration(
//               hintText: "username",
//               hintStyle: new TextStyle(color: Colors.grey.withOpacity(0.3))),
//         ),
//         new TextField(
//             controller: password,
//             obscureText: true,
//             decoration: InputDecoration(
//                 hintText: "password",
//                 hintStyle:
//                 new TextStyle(color: Colors.grey.withOpacity(0.3)))),
//         new CheckboxListTile(
//           value: checkValue,
//           onChanged: _save,
//           title: new Text("Remember me"),
//           controlAffinity: ListTileControlAffinity.leading,
//         ),
//         new Container(
//           decoration:
//           new BoxDecoration(border: Border.all(color: Colors.black)),
//           child: new ListTile(
//             title: new Text(
//               "Login",
//               textAlign: TextAlign.center,
//             ),
//             onTap: _navigator,
//           ),
//         )
//       ],
//     ),
//   );
// }
//
//  _save (value)  async{
//   // Future<void> _save (bool value)  async{
//   SharedPreferences prefs = await _prefs;
//   setState(() {
//     // checkValue = value;
//     // prefs.setBool("check", checkValue);
//     prefs.setString("username", username.text);
//     prefs.setString("password", password.text);
//     prefs.commit();
//
//     getCredential();
//   });
// }
// // _load() async{
// //
// //   SharedPreferences prefs = await _prefs;
// //   setState(() {
// //     _data = 'Result:  \nusername: ${prefs.getString('username')} \npassword: ${prefs.getString('password')} ';
// //      });
// // }
//
// getCredential() async {
//
//   SharedPreferences prefs = await _prefs;
//   setState(() {
//     checkValue = prefs.getBool("check");
//     if (checkValue != null) {
//       if (checkValue) {
//         username.text = prefs.getString("username");
//         password.text = prefs.getString("password");
//       } else {
//         username.clear();
//         password.clear();
//         prefs.clear();
//       }
//     } else {
//       checkValue = false;
//     }
//   });
// }
//
// _navigator() {
//   if (username.text.length != 0 || password.text.length != 0) {
//     Navigator.of(context).pushAndRemoveUntil(
//         new MaterialPageRoute(
//             builder: (BuildContext context) => new HomePage()),
//             (Route<dynamic> route) => false);
//   }
//
// }
// }
