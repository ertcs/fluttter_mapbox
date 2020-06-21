import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SyncPageWidget extends StatefulWidget {
  @override
  _SyncPageWidgetState createState() => _SyncPageWidgetState();
}

class _SyncPageWidgetState extends State<SyncPageWidget> {
  bool isDownloading = false;
  bool isUploading = false;
  Icon uploadIcon = Icon(Icons.cloud_upload,size: 30,);
  String uploadCount = "10 ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          'Sync',
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.sync,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Uploads',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text(
                  'Upload all'.toUpperCase(),
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/image_icon.png',
                height: 30,
                width: 30,
              ),
              Text(
                ' 0',
                style: TextStyle(fontSize: 21),
              ),
              Expanded(
                child: Container(
                  height: 2,
                ),
              ),
              Icon(
                Icons.cloud_upload,
                size: 30,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Container(
            height: 10,
            width: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/audio_icon.png',
                height: 30,
                width: 30,
              ),
              Text(
                ' 0',
                style: TextStyle(fontSize: 21),
              ),
              Expanded(
                child: Container(
                  height: 2,
                ),
              ),
              Icon(
                Icons.cloud_upload,
                size: 30,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Container(
            height: 10,
            width: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/data_icon.png',
                    height: 30,
                    width: 30,
                  ),
                  Text(
                    uploadCount,
                    style: TextStyle(fontSize: 21),
                  ),
                ],
              ),
              isUploading
                  ? SizedBox(height: 2, width: 200, child: LinearProgressIndicator())
                  : Text(
                      '',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
              isUploading
                  ? GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text('Cancel'.toUpperCase()),
                      ),
                      onTap: () {
                        setState(() {
                          isUploading = false;
                        });
                      },
                    )
                  : GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: uploadIcon,
                      ),
                      onTap: () {
                        setState(() {
                          isUploading = true;
                          Future.delayed(Duration(seconds: 4),(){
                            setState(() {
                              uploadCount =' 0';
                              uploadIcon = Icon(Icons.cloud_done,color: Colors.green,size: 30,);
                              isUploading = false;
                            });
                          });
                        });
                      },
                    ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Downloads',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text(
                  'Download all'.toUpperCase(),
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Project Map',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                isDownloading
                    ? SizedBox(height: 2, width: 200, child: LinearProgressIndicator())
                    : Text(
                        'Map2',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                isDownloading
                    ? GestureDetector(
                        child: Text('Cancel'.toUpperCase()),
                        onTap: () {
                          setState(() {
                            isDownloading = false;
                          });
                        },
                      )
                    : GestureDetector(
                        child: Icon(
                          Icons.cloud_download,
                          size: 30,
                        ),
                        onTap: () {
                          setState(() {
                            isDownloading = true;
                          });
                        },
                      ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Project Map',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Map2',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Icon(
                  Icons.cloud_download,
                  size: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Project Map',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Map3',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Icon(
                  Icons.cloud_download,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
