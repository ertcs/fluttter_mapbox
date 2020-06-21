import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:maptrailflutter/pages/homepagewidgets/test.dart';


class UserMapPage extends StatefulWidget {
  @override
  _UserMapPageState createState() => _UserMapPageState();
}

class _UserMapPageState extends State<UserMapPage> {
  String mapUrl =
      'https://api.mapbox.com/styles/v1/mapboxflutter/ckbl7kdwa06f11ioi0ryu9ha8/tiles/256/{level}/{col}/{row}@2x.png?access_token=pk.eyJ1IjoibWFwYm94Zmx1dHRlciIsImEiOiJja2JrcWhyZ2YwajlhMnFzNDJrcGRoYjY5In0.-hWYn5U_SDdgtt1xs1Tlqw';
  String token = 'pk.eyJ1IjoibWFwYm94Zmx1dHRlciIsImEiOiJja2JrcWhyZ2YwajlhMnFzNDJrcGRoYjY5In0.-hWYn5U_SDdgtt1xs1Tlqw';
  MapController mapController = MapController();


  void addMarker(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlutterMap(
            mapController: mapController,
            options: MapOptions(center: LatLng(35.22, -101.83), minZoom: 13.0),
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
                markers: [
                  Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(35.215, -101.825),
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
                ],
              )
            ],
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        color: Colors.black45.withOpacity(0.3),
                        child: BackButton(
                          color: Colors.white,
                        )),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SimpleWidget()),
                        );
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.black45.withOpacity(0.3),
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.my_location),
        onPressed: (){
          mapController.move(LatLng(35.22, -101.83), 13.0);
        },
      ),
    );
  }


}
