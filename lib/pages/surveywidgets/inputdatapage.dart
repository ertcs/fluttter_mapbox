
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:maptrailflutter/commons.dart';
import 'package:maptrailflutter/pages/surveywidgets/mutliplsoptionlist.dart';
import 'package:maptrailflutter/pages/surveywidgets/selectfromlistwidget.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smart_select/smart_select.dart';
import 'package:sticky_headers/sticky_headers.dart';


class InputDataWidget extends StatefulWidget {
  @override
  _InputDataWidgetState createState() => _InputDataWidgetState();
}

class _InputDataWidgetState extends State<InputDataWidget> {
  String pickUpdate = 'No Date Selected';
  var selectedRange = RangeValues(0.2,0.8);
  String dropdownValue = addList[0];



  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  hintText: 'Add Number',
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                maxLength: 5,
                maxLines: 4,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  hintText: 'Add Description',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Select date range',style: TextStyle(fontSize: 21),),
                  Center(child: Text(pickUpdate,style: TextStyle(fontSize: 16),)),
                  IconButton(icon: Icon(Icons.date_range,),onPressed: ()async{
                    final List<DateTime> picked = await DateRagePicker.showDatePicker(
                      firstDate: new DateTime(2019),
                      lastDate: new DateTime(2021),
                      context: context,
                      initialFirstDate: new DateTime.now(),
                      initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),

                    );
                    if (picked != null && picked.length == 2) {
                      setState(() {
                        pickUpdate = '${picked[0].day}-${picked[0].month}-${picked[0].year} TO ${picked[1].day}-${picked[1].month}-${picked[1].year}';
                      });
                      print(picked);
                    }
                  },)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Select range',style: TextStyle(fontSize: 21),),
                      Text('Start: ${selectedRange.start} : End: ${selectedRange.end} ',style: TextStyle(fontSize: 14),),
                      SizedBox(width: 10,)
                    ],
                  ),
                  RangeSlider(
                    values: selectedRange,
                    onChanged: (newValue){
                      setState(() {
                        selectedRange = newValue;
                      });
                    },
                    min: 0.0,
                    divisions: 10,
                    max: 2.0,
                    labels: RangeLabels('${selectedRange.start}','${selectedRange.end}'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Select Multiple options',style: TextStyle(fontSize: 21),),
                  Center(child: Text('',style: TextStyle(fontSize: 16),)),
                  IconButton(icon: Icon(Icons.list,),onPressed: (){
                    showMaterialModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context, scrollController) {
                          return MultipleOptionsList();
                        }
                    );
                  },)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Select from the list',style: TextStyle(fontSize: 21),),
                  Center(child: Text('',style: TextStyle(fontSize: 16),)),
                  IconButton(icon: Icon(Icons.list,),onPressed: (){
                    showMaterialModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context, scrollController) {
                          return SelectFromTheList();
                        }
                    );
                  },)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DropDown',style: TextStyle(fontSize: 21),),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: addList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}