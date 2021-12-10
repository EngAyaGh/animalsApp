//import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'assets_audio_player.dart';
//import 'audio_cache.dart';

class animals_show extends StatefulWidget {
  String typePhoto;
  animals_show(this.typePhoto);
  @override
  _animals_showState createState() => new _animals_showState(typePhoto);
}

class _animals_showState extends State<animals_show> {
  int photoIndex = 0;
  String typePhoto;
  _animals_showState(this.typePhoto);
  List<String> photos = [
    "assets/tiger.jpg",
    "assets/sea.jpg",
    "assets/jungle.jpg",
    "assets/forest.jpg",
    "assets/farm.jpg"
  ];
  @override
  initState() {
    super.initState();
  }

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                        image: AssetImage(photos[photoIndex]),
                        fit: BoxFit.cover)),
                height: 400.0,
                width: 300.0,
              ),
              Positioned(
                top: 375.0,
                left: 25.0,
                right: 25.0,
                child: SelectedPhoto(
                    numberOfDots: photos.length, photoIndex: photoIndex),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Icon( Icons.arrow_right) ,
              onPressed: _nextImage,
              elevation: 5.0,
              color: Colors.green,
            ),
            SizedBox(width: 10.0),
            RaisedButton(
              child: Text('Prev'),
              onPressed: (){
    setState(() {
               //audioCache.prefix="assets";
              //audioCache.play('chicken.mp3');
      _playVoice("canarybird.mp3", "assets/audio/");
    });},
//              _previousImage,
              elevation: 5.0,
              color: Colors.blue,

              /* if (photos.length-1!=photoIndex){
    disabledElevation:true ;
    }*/
            ),
            RaisedButton(
              child: Icon(Icons.volume_up),
              onPressed: () {
                setState(() {
                  //audioCache.prefix="assets";
                //  audioCache.play('chicken.mp3');
                  _playVoice("canarybird.mp3", "assets/audio/");
                });
              },
              elevation: 5.0,
              color: Colors.blue,
            ),
          ],
        )
      ],
    ));
  }
}
//AudioCache audioCache = AudioCache();
Future _playVoice(String filename, String assets) async {
  MethodChannel _channel = const MethodChannel('animals');
  String assetName = filename;
  if (assetName.startsWith("/")) {
    assetName = assetName.substring(1);
  }
  String folder = assets;
  if (folder.endsWith("/")) {
    folder = folder.substring(0, folder.length - 1);
  }
  if (folder.startsWith("/")) {
    folder = folder.substring(1);
  }

  try {
    var invokeMethod =await _channel.invokeMethod(
           'open', <String, dynamic>{'file': "chicken.mp3", 'folder': "assets" ,'isLocal': true});
  } catch (e) {
    // print(e);
  }
  /*'open', <String, dynamic>{
  folder: "assets",
  assetName :"chicken.mp3",
  'isLocal': true,
  });*/
 return await  _channel.invokeMethod('play',<String, dynamic>{
   assets: "chicken.mp3",
   folder: "assets" ,
 }
/*
   folder: "assets",
   assets :"chicken.mp3",}*/
   );
}
/*
AssetsAudioPlayer _assetsAudioPlayer1 = AssetsAudioPlayer();
    _assetsAudioPlayer1.open(
       AssetsAudio(
       asset: "song1.mp3",
       folder: "assets/audios/",
     )*/

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots=0;
  final int photoIndex=0;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
      ),
    ));
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
