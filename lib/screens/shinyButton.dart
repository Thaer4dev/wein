import 'package:flutter/material.dart';
class ShinyButton extends StatefulWidget {
  static const String id = 'ShinyButton';


  @override
  _ShinyButtonState createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 2500
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
        // child: Text('BUY Now For 50 AED',
        //   style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
        //     fontSize: 20,)),
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.all(2),
        // padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey.shade700,
                  Colors.lightBlue.shade200,
                  Colors.grey.shade700,
                ],
                stops: [
                  0.0,
                  _controller!.value,
                  1.0
                ])
        ),
      );
    });
  }

}
