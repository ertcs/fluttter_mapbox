import 'package:flutter/material.dart';
import 'package:maptrailflutter/pages/homepagewidgets/homepagemain.dart';
import 'package:maptrailflutter/pages/singuppage/singuppagewidget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscureText1 = false;
  TextEditingController _passController;

  @override
  void initState() {
    _passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text('Login'.toUpperCase(), style: TextStyle(fontSize: 55, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Container(
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Account',
                              labelStyle: TextStyle(color: Colors.black45,fontSize: 16,),
                              prefixIcon: Icon(Icons.person)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autovalidate: true,
                              controller: _passController,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 21),
                              obscureText: isObscureText1,
                              onChanged: (value) {
                                if (value.length > 1) {
                                  setState(() {
                                    isObscureText1 = true;
                                  });
                                } else {
                                  isObscureText1 = false;
                                }
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Key',
                                  labelStyle: TextStyle(color: Colors.black45,fontSize: 16,),
                                  prefixIcon: Icon(Icons.vpn_key)),
                            ),
                          ),
                        ),
                        isObscureText1
                            ? Positioned(
                                right: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscureText1 = !isObscureText1;
                                    });
                                  },
                                  child: Text(
                                    'SHOW',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    color: Colors.deepOrange,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => HomePageMain()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignUpPage()),
                          );
                        },
                        child: Text(
                          ' CREATE ACCOUNT',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
