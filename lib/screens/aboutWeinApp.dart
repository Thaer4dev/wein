import 'package:flutter/material.dart';
import 'package:wein/screens/home.dart';

class AboutWeinApp extends StatefulWidget {
  static const String id = 'AboutWeinApp';

  @override
  _AboutWeinAppState createState() => _AboutWeinAppState();
}
class _AboutWeinAppState extends State<AboutWeinApp> {

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
        title: Text('Wein App',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),),
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade800,
              height: 200,width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Image.asset(
                'images/logo with slogan.png', width: 100,fit: BoxFit.contain,),
            ),
            Container(
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
                    'at is the difference car car is the difference car car car is the difference car car car is the difference '
                    'at is the difference car car car is the difference car car car car '
                    'at is the difference car car car is the difference car car car the difference car car is the difference car car car is the difference car'
                    'car carce caren at is the difference car car car is the difference car car car'
                    'at is the difference car car car is th is the difference car car car is the difference car car car is the difference '
                    'at is the difference car car car is the difference car car car car '
                    'at is the difference car car car is the difference car car car the difference car car is the difference car car car is the difference car'
                    'car carce caren at is the difference car car car is the difference car car car'
                    'at is the difference car car car is thence car is the difference car car car car '
                    'at is the difference car car car is the difference car car car the difference car car is the difference car car car is the difference car'
                    'car carce caren at is the difference car car car is the difference car car car'
                    'at is the difference car car car is the difference car car car is the difference '
                    'at is the difference car car car is the difference car car car car '
                    'at is the difference car car car is the difference car car ',
                style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.bold, fontSize: 14),
                overflow: TextOverflow.ellipsis, maxLines: 1100,),
            ),
          ],
        ),
      ),
    );
  }
}