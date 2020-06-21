
import 'package:flutter/material.dart';

class SurveyInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 600,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              Text('Survey Instructions',style: TextStyle(fontSize: 26),textAlign: TextAlign.center,),
              IconButton(icon: Icon(Icons.close,color: Colors.deepOrangeAccent,),
                onPressed: (){
                Navigator.of(context).pop();
                },
              )
            ],
          ),
          Expanded(child: Center(child: Text('Detail Survey instructions here',style: TextStyle(fontSize: 18),textAlign: TextAlign.center,))),

        ],
      ),
    );
  }
}
