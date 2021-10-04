import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color? slogan1Color = Colors.transparent;
  Color? slogan2Color = Colors.transparent;


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000)).then((value) => setState(() {
      slogan1Color = Colors.white;
    }));
    Future.delayed(Duration(milliseconds: 4000)).then((value) => setState(() {
      slogan2Color = Colors.white;
    }));

  }

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          // backgroundColor: Colors.transparent,
          body: Stack(
            children:[
            Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/background splash.jpg'),
              fit: BoxFit.cover)
            ),),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/weinlogo.png',
                  width: 230,
                ),
                SizedBox(height: 5,),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedDefaultTextStyle(
                            child: Text('eat more '),
                            style: TextStyle(
                              color: slogan1Color,
                              fontSize: 27.0,
                            ),
                            duration: (Duration(milliseconds: 100))
                        ),
                        AnimatedDefaultTextStyle(
                            child: Text('pay less'),
                            style: TextStyle(
                              color: slogan2Color,
                              fontSize: 27.0,
                            ),
                            duration: (Duration(milliseconds: 100))
                        )
                      ],)
                ),
              ],),
  ])
        );
  }
}
