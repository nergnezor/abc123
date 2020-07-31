import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shape_match.dart';
import 'letters.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: ABC123(),
        // home: FindTheMatchingFruit(),
        debugShowCheckedModeBanner: false);
  }
}

class ABC123 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Best Learning Game Ever'),
      ),*/
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/StartScreenBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: RaisedButton(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('Play The Fruit Game',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FindTheMatchingFruit()),
                    );
                  },
                ),
              ),
              Card(
                child: RaisedButton(
                  // color: Colors.transparent,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(100),
                  // ),
                  // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'ABC',
                  ),
                  // style: TextStyle(fontSize: 25, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Letters()),
                    );
                  },
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
