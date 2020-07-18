import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo.shade400,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Image.asset(
                'assets/splash.jpg',
                // width: animation.value * 250,
                // height: animation.value * 250,
              ),
            ],
          ),

          new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Vocational Education",
                  style: TextStyle(color: Colors.black, fontSize: 21.0),
                ),
                Text(
                  "Daman and Diu & Dadra and Nagar Haveli\n",
                  style: TextStyle(color: Colors.black, fontSize: 21.0),
                ),
                Text(
                  "2020-04-10232",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                Text(
                  "Ankit Patel",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                Text(
                  "Urvi Shah",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                Text(
                  "ANVI\n",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                Text(
                  "v1.1(2)\n",
                  style: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
              ],
            ),
          
        ],
      ),
    );
  }
}
