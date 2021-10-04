import 'package:flutter/material.dart';
class SkipAd extends StatefulWidget {
  static const String id = 'SkipAd';


  @override
  _SkipAdState createState() => _SkipAdState();
}

class _SkipAdState extends State<SkipAd> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 5000
    ),
    );
    _controller!.repeat();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _controller!, builder: (context, _) {
      return Container(
        child: Text('Skip in 5 sec',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
            fontSize: 20,)),
        width:160,
        height: 42,
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.lightBlue,
                  Colors.lightBlue,
                  Colors.grey,
                ],
                stops: [
                  0.0,
                  _controller!.value,
                  0.0,
                ])
        ),
      );
    });
  }

}
