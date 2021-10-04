import 'package:flutter/material.dart';
import 'package:wein/screens/home.dart';

class TermsConditions extends StatefulWidget {
  static const String id = 'TermsConditions';

  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}
class _TermsConditionsState extends State<TermsConditions> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Home.id);
          },
          icon: Icon(Icons.arrow_back_outlined,),
          color: Colors.black,
          iconSize: 30,),
        title: Text('Terms & Conditions',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),),
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(8, 20, 8, 20),
          padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.amber, width: 3),),
          child: Text(
            '1- What is the difference car car is the difference car car car is the difference car'
                'car carce caren at is the difference car car car is.'
                ''
                '2- the difference car car car.'


                'at is the difference car car car is the difference car car car is the difference '
                'at is the difference car car car is the difference car car car car '
                'at is the difference car car car is the difference car car car the difference car car is the difference car car car is the difference car'
                'car carce caren at is the difference car car car is the difference car car car'
                'at is the difference car car car is the difference car car car is the difference '
                'at is the difference car car car is the difference car car car car '
                'at is the difference car car car is the difference car car ',
            style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.bold, fontSize: 14),
            overflow: TextOverflow.ellipsis, maxLines: 1100,),
        ),
      ),
    );
  }
}