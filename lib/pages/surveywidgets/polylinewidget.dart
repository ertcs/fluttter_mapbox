
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

class MapPolylineWidget extends StatefulWidget {
  @override
  _MapPolylineWidgetState createState() => _MapPolylineWidgetState();
}

class _MapPolylineWidgetState extends State<MapPolylineWidget> {
  MapController mapController = MapController();
  List<Marker> locationMarker = [];
  var points = <LatLng>[];
  LatLng centerLatLng ;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  void onMarkerSelection(LatLng latLng){
    if(locationMarker.isEmpty){
      points=[];
      locationMarker =[
        Marker(
          width: 65.0,
          height: 65.0,
          point: latLng,
          builder: (context) => new Container(
            child: IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.black,
              iconSize: 45.0,
              onPressed: () {

              },
            ),
          ),
        )
      ];
    }else if(locationMarker.length<2){
      Marker marker = Marker(
        width: 65.0,
        height: 65.0,
        point: latLng,
        builder: (context) => new Container(
          child: IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.black,
            iconSize: 45.0,
            onPressed: () {

            },
          ),
        ),
      );
      locationMarker.add(marker);
      LatLng maker1 = locationMarker[0].point;
      LatLng maker2 = locationMarker[1].point;
      points.add(maker1);
      points.add(maker2);
      locationMarker=[];
    }

    setState(() {

    });

  }




  @override
  Widget build(BuildContext context) {
    var overlayImages = <OverlayImage>[
      OverlayImage(
          bounds: LatLngBounds(LatLng(51.5, -0.09), LatLng(48.8566, 2.3522)),
          opacity: 0.8,
          imageProvider: NetworkImage(
              'https://images.pexels.com/photos/231009/pexels-photo-231009.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=600')),
    ];

    return Stack(
      children: <Widget>[
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            onPositionChanged: (position, isGesture){
              centerLatLng = position.center;
            },
            interactive: true,
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
            PolylineLayerOptions(
              polylines: [
                Polyline(
                    points: points,
                    strokeWidth: 4.0,
                    color: Colors.purple,),
              ],
            ),
            OverlayImageLayerOptions(overlayImages: overlayImages)

          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/images/location_pin.png',height: 60,width: 60,),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                points.isNotEmpty?GestureDetector(
                  onTap: (){
                    points=[];
                    setState(() {

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red.withOpacity(0.9)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.close,size: 16,color: Colors.white,),
                          Text('Delete Line',style: TextStyle(color: Colors.white),)
                        ],
                      ),

                    ),
                  ),
                ):Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(width: 100,),
                ),
                RaisedButton(
                  color: Colors.black,
                  onPressed: (){
                    onMarkerSelection(centerLatLng);
                  },
                  child: Text('Add Marker',style: TextStyle(color: Colors.white),),

                ),
                SizedBox(width: 110,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
