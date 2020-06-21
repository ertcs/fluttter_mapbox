
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  bool mapSwitch = false;
  bool recordSwitch=false;
  bool sendLocationSwitch=false;
  bool notificationSwitch=false;
  int mapResIndex =1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text('Setting',style: TextStyle(color: Colors.black,fontSize: 26),),
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Change account details'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.w500),),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Text('Map Setting',style: TextStyle(fontSize: 26),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Fetch Map for offline use',style: TextStyle(fontSize: 21),),
                    ),
                    MainPageSwitch(isFanOn: mapSwitch,switchFan: (){
                      setState(() {
                        mapSwitch =!mapSwitch;
                      });
                    },)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Map Resolution',style: TextStyle(fontSize: 21),),

                    ),
                    FanSpeedControl(fanSpeed: mapResIndex,changeFanSpeed: (value){
                      setState(() {
                        mapResIndex = value;
                      });
                    },)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Record and display trip data',style: TextStyle(fontSize: 21),),
                    ),
                    MainPageSwitch(isFanOn: recordSwitch,switchFan: (){
                      setState(() {
                        recordSwitch =!recordSwitch;
                      });
                    },)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Send location data when connected',style: TextStyle(fontSize: 21),),
                    ),
                    MainPageSwitch(isFanOn: sendLocationSwitch,switchFan: (){
                      setState(() {
                        sendLocationSwitch =!sendLocationSwitch;
                      });
                    },)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Text('Notification',style: TextStyle(fontSize: 26),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Receive Notification',style: TextStyle(fontSize: 21),),
                    ),
                    MainPageSwitch(isFanOn: notificationSwitch,switchFan: (){
                      setState(() {
                        notificationSwitch =!notificationSwitch;
                      });
                    },)
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: (){},
                  child: Text('Sign Out'.toUpperCase(),style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 21),)),
            ),
          ),
          SizedBox(height: 100,)

        ],
      ),
    );
  }
}

class MainPageSwitch extends StatelessWidget {
  final bool isFanOn;
  final Function switchFan;

  MainPageSwitch({this.isFanOn,this.switchFan});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: GestureDetector(
        onTap: switchFan,
        child: Container(
          height: 25,width: 50,
          decoration: BoxDecoration(
              color: isFanOn?Colors.blueAccent:Colors.grey[300],
              borderRadius: BorderRadius.circular(30)
          ),
          child: Padding(
              padding: EdgeInsets.all(3),
              child: Align(
                alignment: isFanOn?Alignment.centerRight:Alignment.centerLeft,
                child: Material(
                  elevation: 4,
                  shape: CircleBorder(),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}

class FanSpeedControl extends StatelessWidget {

  final int fanSpeed;
  final Function changeFanSpeed;

  FanSpeedControl({this.fanSpeed,this.changeFanSpeed});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 35,
      width: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: ()=>changeFanSpeed(1),
            child: Container(
              width: 30,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  color: fanSpeed>=1?Colors.blueAccent:Colors.grey[200]
              ),
              child: Center(child: Text('Low',style: TextStyle(color:fanSpeed>=1?Colors.white:Colors.black ),)),
            ),
          ),
          GestureDetector(
            onTap: ()=>changeFanSpeed(2),
            child: Container(
              width: 50,
              height: 35,
              color: fanSpeed>=2?Colors.blueAccent:Colors.grey[200],
                child: Center(child: Text('Medium',style: TextStyle(color:fanSpeed>=2?Colors.white:Colors.black ),)),
            ),
          ),
          GestureDetector(
            onTap: ()=>changeFanSpeed(3),
            child: Container(
              width: 70,
              height: 35,
              color: fanSpeed>=3?Colors.blueAccent:Colors.grey[200],
              child: Center(child: Text('High',style: TextStyle(color:fanSpeed>=3?Colors.white:Colors.black ),)),

            ),
          ),
          GestureDetector(
            onTap: ()=>changeFanSpeed(4),
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                color: fanSpeed==4?Colors.blueAccent:Colors.grey[200],
              ),
              child: Center(child: Text('Highest',style: TextStyle(color:fanSpeed>=4?Colors.white:Colors.black ),)),
            ),
          ),

        ],
      ),

    );
  }
}