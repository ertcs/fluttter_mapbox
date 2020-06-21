
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:maptrailflutter/pages/homepagewidgets/audiorecordpage.dart';
import 'package:maptrailflutter/pages/surveywidgets/inputdatapage.dart';
import 'package:maptrailflutter/pages/surveywidgets/locationselectionwidget.dart';
import 'package:maptrailflutter/pages/surveywidgets/pickimageswidget.dart';
import 'package:maptrailflutter/pages/surveywidgets/polygonwidget.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../surveywidgets/polylinewidget.dart';
import '../surveywidgets/stepsheading.dart';
import '../surveywidgets/surveyinfowidget.dart';

class SimpleWidget extends StatefulWidget {
  @override
  SimpleWidgetState createState() => new SimpleWidgetState();
}

class SimpleWidgetState extends State {
  int stepCounter = 0;
  double pageIndex = 0;
  bool isLastPage = false;
  ItemScrollController _scrollController = ItemScrollController();
  PageController _itemController = PageController(initialPage: 0);


  List<String> steps = [
    'Add input data',
    'Add images',
    'Add voice',
    'Select location on map',
    'Add polyline on map',
    'Add polygon on map'
  ];
  @override
  void initState() {
    super.initState();
  }

  onStepContinue() {
    setState(() {
      stepCounter < steps.length - 1 ? stepCounter += 1 : stepCounter=stepCounter;
      _scrollController.scrollTo(index: stepCounter, duration: Duration(seconds: 1));
      _itemController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
      isLastPage =stepCounter==steps.length-1;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Survey Demo',
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        actions: <Widget>[
          Center(
              child: Text(
            '${stepCounter + 1} / ${steps.length}  ',
            style: TextStyle(color: Colors.black, fontSize: 14),
          )),
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.deepOrangeAccent,
            ),
            onPressed: () {
              showMaterialModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context, scrollController) {
                    return SurveyInfoWidget();
                  });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
            child: ScrollablePositionedList.builder(
//              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemScrollController: _scrollController,
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return StepHeadingItem(
                  title: '${steps[index]}',
                  isActive: index == stepCounter,
                  isCompleted: index < stepCounter,
                  index: index + 1,
                );
              },
            ),
          ),
          Expanded(
            child: PageView(
              controller: _itemController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                InputDataWidget(),
                PicImageWidget(),
                AudioRecordWidget(),
                LocationSelectionMap(),
                MapPolylineWidget(),
                PolygonMapWidget(),

              ],
            ),
          )
        ],
      ),
      floatingActionButton: GestureDetector(
          onTap: isLastPage ?(){
            Navigator.of(context).pop();
          }:onStepContinue,
          child: Card(
            elevation: 6,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeIn,
                width: isLastPage ? 120 : 60,
                height: isLastPage?50:60.0,
                decoration: isLastPage
                    ? BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(24)
                )
                    : BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40)
//                          borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text(
                    isLastPage ? 'SUBMIT' : 'NEXT',
                    style: TextStyle(color: Colors.white,fontSize: isLastPage?18:14),
                  ),
                )
            ),
          ),),
    );
  }
}



