import 'package:flutter/material.dart';
import 'package:wein/screens/login_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color? animatedContainerColor = Colors.white;
  double animatedContainerHeight = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1000)).then((value) => setState(() {
      animatedContainerColor = Colors.white;
      animatedContainerHeight = MediaQuery.of(context).size.height;
    }));
  }

  @override
  Widget build(BuildContext context) {
            return Scaffold(
                backgroundColor: Colors.grey[800],
                body: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child: Image.asset(
                          'images/logo with slogan.png',
                          width: 240,
                        ),),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children:<Widget>[
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  decoration: BoxDecoration(
                                      color: animatedContainerColor,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                      )),
                                  curve: Curves.easeIn ,
                                  height: animatedContainerHeight,
                                  child:Container(

                                    child: AuthUi(),
                                  ),),
                              ]),),
                      ),

                    ]));

        }
  }


