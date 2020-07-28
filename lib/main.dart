import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shape_match.dart';

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
          fontFamily: 'PressStart',
        ),
        home: ABC123(),
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
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black)),
              child: Text('Play The Fruit Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FindTheMatchingFruit()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
