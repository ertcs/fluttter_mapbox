

import 'package:flutter/material.dart';

class MultipleOptionsList extends StatefulWidget {
  @override
  _MultipleOptionsListState createState() => _MultipleOptionsListState();
}

class _MultipleOptionsListState extends State<MultipleOptionsList> {
  List<bool> multiOptionList = [false,false,false,false,false,false,];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 600,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Text('Select Multiple options',style: TextStyle(fontSize: 26),textAlign: TextAlign.center,),
          CheckboxListTile(
            title: Text("Option 1"), //    <-- label
            value: multiOptionList[0],
            onChanged: (newValue) {
              setState(() {
                multiOptionList[0] =newValue;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Option 2"), //    <-- label
            value: multiOptionList[1],
            onChanged: (newValue) {
              setState(() {
                multiOptionList[1] =newValue;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Option 3"), //    <-- label
            value: multiOptionList[2],
            onChanged: (newValue) {
              setState(() {
                multiOptionList[2] =newValue;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Option 4"), //    <-- label
            value: multiOptionList[3],
            onChanged: (newValue) {
              setState(() {
                multiOptionList[3] =newValue;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Option 5"), //    <-- label
            value: multiOptionList[4],
            onChanged: (newValue) {
              setState(() {
                multiOptionList[4] =newValue;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Option 6"), //    <-- label
            value: multiOptionList[5],
            onChanged: (newValue) {
              setState(() {
                multiOptionList[5] =newValue;
              });
            },
          ),
          SizedBox(height: 50,),
          RaisedButton(onPressed: (){
            Navigator.of(context).pop();
          },child: Text('Close',style: TextStyle(color: Colors.white),),color: Colors.black,)
        ],
      ),
    );
  }
}