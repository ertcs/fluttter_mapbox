
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
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
                Text('SIGN-UP'.toUpperCase(), style: TextStyle(fontSize: 55, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  EditTextField(title: 'First Name',),
                  EditTextField(title: 'Last Name',),
                  EditTextField(title: 'Email Name',),
                  EditTextField(title: 'Confirm Email',),
                  EditTextField(title: 'Account Name',),
                  SizedBox(height: 50,),
                  RaisedButton(
                    color: Colors.deepOrange,
                    onPressed: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('SIGN-UP',style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
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

class EditTextField extends StatelessWidget {
  final String title;
  EditTextField({this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            decoration: InputDecoration(border: InputBorder.none, labelText: title, labelStyle: TextStyle(color: Colors.black45,fontSize: 16,),),

          ),
        ),

      ),
    );
  }
}
