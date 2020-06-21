
import 'package:flutter/material.dart';

class StepHeadingItem extends StatelessWidget {
  final bool isActive;
  final bool isCompleted;
  final String title;
  final int index;

  StepHeadingItem({this.isActive, this.isCompleted, this.title, this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              isCompleted
                  ? Icon(
                Icons.check_box,
                color: Colors.green,
              )
                  : CircleAvatar(
                backgroundColor: isActive ? Colors.deepOrangeAccent : Colors.grey.withOpacity(0.3),
                radius: 15,
                child: Text(
                  '$index',
                  style: TextStyle(color: isActive ? Colors.white : Colors.black),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}