import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:maptrailflutter/pages/logininwidget/logininpage.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  bool isAgreed = false;

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Web-based GIS",
          body: "Create your own map-based interview records. Import/export, view and analyze your spatial data.",
          image: _buildImage('assets/images/image_1.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Survey Tools",
          body:
          "Develop and deploy custom online surveys with our easy web form creator.",
          image: _buildImage('assets/images/image_2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Document & Multimedia Library",
          body:
          "Create an easy-to-use digital archive. Upload and search important documents and reports.",
          image: _buildImage('assets/images/image_3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Communications",
          body:
          "Keep community members engaged by sharing select content online.",
          image: _buildImage('assets/images/image_5.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Mobile Data Collection",
          body:
          "Customize your own mobile data collection app.",
          image: _buildImage('assets/images/image_4.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reporting & Referrals",
          body: "Run spatial queries and export results as a KML or CSV file.",
          image: _buildImage('assets/images/image_6.png'),
          footer: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Text('Read Privacy Policy',style: TextStyle(fontSize: 18,color: Colors.blue),),
              CheckboxListTile(
                title: Text("By checking this box, you agree to our Privacy Policy"),
                value: isAgreed,
                onChanged: (newValue) {
                  setState(() {
                    isAgreed = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration:BoxDecoration(
                      color: isAgreed?Colors.deepOrange:Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text('Lets Start',style: TextStyle(color: Colors.white,fontSize: 21),),),
                  ),
                ),
              ),

            ],
          ),
          decoration: pageDecoration,
        ),

      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
