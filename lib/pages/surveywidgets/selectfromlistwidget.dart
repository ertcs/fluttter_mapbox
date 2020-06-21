
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maptrailflutter/commons.dart';

class SelectFromTheList extends StatefulWidget {
  @override
  _SelectFromTheListState createState() => _SelectFromTheListState();
}

class _SelectFromTheListState extends State<SelectFromTheList> {
  TextEditingController textEditingController;
  List<String> addressList = [];
  int selectedIndex = 99;


  @override
  void initState() {
    textEditingController = TextEditingController();
    addressList = addList;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BackButton(color: Colors.black,),
                  Text('Select from list',style: TextStyle(fontSize: 26),textAlign: TextAlign.center,),
                  FlatButton(
                    child: Text('DONE',style: TextStyle(color: Colors.deepOrangeAccent),),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value){
                    setState(() {
                      addressList = addList.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
                    });
                  },
                  controller: textEditingController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: 'search',
                    prefixIcon: Icon(Icons.search)
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: addressList.length,
                  itemBuilder: (context,index){
                    return SearchListItem(
                      isSelected: index==selectedIndex,
                      onTap: (){
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      title: '${addressList[index]}',
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchListItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;
  SearchListItem({this.title,this.isSelected,this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 50,
          color: isSelected?Colors.grey:Colors.white,
          child: Center(
            child: Text(title,style: TextStyle(fontSize: 24),),
          ),
        ),
      ),
    );
  }
}
