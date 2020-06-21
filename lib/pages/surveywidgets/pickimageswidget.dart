
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class PicImageWidget extends StatefulWidget {
  @override
  _PicImageWidgetState createState() => _PicImageWidgetState();
}

class _PicImageWidgetState extends State<PicImageWidget> {
  List<Asset> images = List<Asset>();
  String _error;

  Widget buildGridView() {
    if (images != null)
      return GridView.count(
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          );
        }),
      );
    else
      return Container(color: Colors.white);
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildGridView(),

        Positioned(
          bottom: 50,
          left: 100,
          right: 100,
          child: RaisedButton(
            child: Text("Pick images"),
            onPressed: loadAssets,
          ),
        ),

      ],
    );
  }
}
