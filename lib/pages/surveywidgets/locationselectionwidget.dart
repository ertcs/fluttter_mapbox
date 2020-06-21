

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

class MarkerObject{
  Marker marker;
  int index;


  MarkerObject({this.marker, this.index});
}


class LocationSelectionMap extends StatefulWidget {
  @override
  _LocationSelectionMapState createState() => _LocationSelectionMapState();
}

class _LocationSelectionMapState extends State<LocationSelectionMap> {
  MapController mapController = MapController();
  List<Marker> locationMarker = [];
  List<LatLng> markerLatLng = <LatLng>[];
  LatLng centerLatLng ;
  List<MarkerObject> markerInfoList =<MarkerObject>[];




  @override
  void initState() {
    super.initState();

    mapController = MapController();
  }

  void onMarkerSelection(LatLng latLng){
    int markerKey;
    if(markerInfoList.isEmpty){
      markerKey = 0;
    }else{
      markerKey = markerInfoList.length;
    }

    Marker marker = Marker(
      width: 55,
      height: 55,
      point: latLng,
      builder: (context) => new Container(
        child: GestureDetector(
          key: Key(markerKey.toString()),
          child: Icon(Icons.location_on,color: Colors.black,size: 50,),
          onLongPress: () {
            String markerIndex = markerKey.toString().replaceFirst("[<'",'').replaceAll("'>]", '');
            MarkerObject markerObject = markerInfoList.where((element) => element.index==int.parse(markerIndex)).first;
            markerInfoList.remove(markerObject);
            updateMarkers(markerInfoList);
          },

        ),
      ),
    );

    markerInfoList.add(MarkerObject(marker: marker,index: markerKey));
    updateMarkers(markerInfoList);

  }


  void updateMarkers(List<MarkerObject> markerInfoList){
    locationMarker=[];
    for(int i=0; i <markerInfoList.length; i++){
      locationMarker.add(markerInfoList[i].marker);
    }
    setState(() {

    });
  }






  @override
  Widget build(BuildContext context) {


    return Stack(
      children: <Widget>[
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
          onPositionChanged: (position, isGesture){
            centerLatLng = position.center;
          },
              interactive: true,
              onLongPress: onMarkerSelection,
              center: LatLng(35.22, -101.83),
              minZoom: 13.0,),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://api.tiles.mapbox.com/v4/"
                  "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
              additionalOptions:
              {'accessToken': 'pk.eyJ1IjoibWFwYm94Zmx1dHRlciIsImEiOiJja2JrcWhyZ2YwajlhMnFzNDJrcGRoYjY5In0.-hWYn5U_SDdgtt1xs1Tlqw',
                'id': 'mapbox.satellite',
              },
            ),
            MarkerLayerOptions(
              markers: locationMarker,
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: locationMarker.isNotEmpty?Container(
            color: Colors.red.withOpacity(0.3),
            padding: EdgeInsets.all(8.0),
            child: Text(' Long press marker to remove',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
          ):Container()
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/images/location_pin.png',height: 60,width: 60,),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: RaisedButton(
              color: Colors.black,
              onPressed: (){
                onMarkerSelection(centerLatLng);
              },
              child: Text('Add Marker',style: TextStyle(color: Colors.white),),

            ),
          ),
        )
      ],
    );
  }
}


//647-854-4906