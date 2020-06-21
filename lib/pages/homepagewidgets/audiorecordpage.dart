import 'package:flutter/material.dart';

class AudioRecordWidget extends StatefulWidget {
  @override
  _AudioRecordWidgetState createState() => _AudioRecordWidgetState();
}

class _AudioRecordWidgetState extends State<AudioRecordWidget> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Positioned(
          top: 70,
          left: 10,
          right: 10,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Start Recording',
                  style: TextStyle(fontSize: 31),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '00:00:00',
                  style: TextStyle(fontSize: 61),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              FloatingActionButton(
                heroTag: 'fab1',
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    isRecording =! isRecording;
                  });
                },
                child: Center(
                  child: isRecording
                      ? Icon(
                    Icons.pause,
                    color: Colors.black,
                    size: 30,
                  )
                      : Icon(
                    Icons.fiber_manual_record,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }


}
