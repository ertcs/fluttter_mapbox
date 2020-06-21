import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maptrailflutter/pages/homepagewidgets/settingpage.dart';
import 'package:maptrailflutter/pages/homepagewidgets/syncpagewidget.dart';
import 'package:maptrailflutter/pages/mappage/usermapwidget.dart';


class HomePageMain extends StatefulWidget {
  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text('Home'.toUpperCase(), style: TextStyle(fontSize: 55, fontWeight: FontWeight.w500)),
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SyncPageWidget()),
                          );
                        },
                        child: Icon(
                          Icons.sync,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Sync',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SettingWidget()),
                          );
                        },
                        child: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Setting',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => UserMapPage()),
                  );
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      'Start'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 21),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
