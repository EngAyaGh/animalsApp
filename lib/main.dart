import 'dart:async';

import 'package:flutter/material.dart';

import 'animals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      //showSemanticsDebugger: true,
      routes: <String, WidgetBuilder>{
        '/anm': (BuildContext context) => new animals_show(""),
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Animals Learn'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround ,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Container(
                  margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/tiger.jpg"),

                          //Timer(Duration(seconds: 3), () {
                          // });
                          fit: BoxFit.cover)),

                  // height: 100.0,
                  //width: 50.0,
                ),
              ),
              SizedBox(
                //width: MediaQuery.of(context).size.width,
                height: 8,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _cards("jungle","jungle","jungle"),
                  SizedBox(
                    width: 0,

                  ),
                  _cards("sea","sea","sea"),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _cards("forest","forest","forest"),
                  SizedBox(
                    width:0,

                  ),
                  _cards("brids","brids","brids"),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _cards("farm","farm","farm"),
                  SizedBox(
                      width: 0
                  ),
                  _cards("sea","sea","sea"),
                ],
              )

            ],
          ),
        ],
      ),
    );
  }

  _gotoSecondPage(BuildContext con, String typeImage) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext con) => new animals_show(typeImage)));
  }

  Widget _cards(String typeName,String assName,String label) {
    return
      GestureDetector(
        onTap: () {
          _gotoSecondPage(context,typeName);
          //Navigator.of(context).pushNamed('/anm');
        },
        child:
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,

          height: 120,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  new Container(
                    margin:
                    const EdgeInsets.only(left: 2.0, right: 2.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/"+assName+".jpg"),
                            fit: BoxFit.cover)),
                    height: 120,
                    //width: double.infinity,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  Positioned(
                    top: 85,
                    child: Container(
                      height: 120.0,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.6)),
                    ),
                  ),
                  Positioned(
                    top: 85,
                    right: 50,
                    child: Text(
                      label,
                      style: TextStyle(fontFamily: 'Quicksand' ,fontSize:30),
                    ),
                  )
                ],
              ),
              //new RaisedButton(onPressed: (){ Navigator.of(context).pushNamed('/anm');}),
              //new RaisedButton(onPressed: (){ _gotoSecondPage(context,"jungle");}),
            ],
          ),
        ),
      );

  }
}
