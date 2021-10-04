import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/how_to_use/how_to_use.dart';
import 'package:wein/dash_board/how_to_use/model_how_to_use.dart';

class Store{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addHowtoUse(ModelHowToUse modelHowToUse)async{
    await _firestore.collection('How to use').doc(modelHowToUse.title).set(
      {
        'Title': modelHowToUse.title,
        'Descriptions' : modelHowToUse.descriptions,
        'Image': modelHowToUse.image,
      });
  }

  Stream<QuerySnapshot> loadHowToUse(){
    return _firestore.collection('How to use').snapshots();
  }

  deleteHowToUse(fff){
    _firestore.collection('How to use').doc(fff).delete();
  }


  successAddAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Added successfully',style: TextStyle(color: Colors.lightBlueAccent),),
      actions: <Widget>[
        TextButton(
            child: Text('Done',style: TextStyle(color: Colors.blue[750],fontWeight: FontWeight.bold),),
            onPressed: () {
              Navigator.pushReplacementNamed(context, HowToUse.id);
            })
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
  loadingAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Loading.....',style: TextStyle(color: Colors.lightBlueAccent),),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
  noSelectedImageAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Should Selecting Image',style: TextStyle(color: Colors.lightBlueAccent),),
      actions: <Widget>[
        TextButton(
            child: Text('Back',style: TextStyle(color: Colors.red[600]),),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

}
