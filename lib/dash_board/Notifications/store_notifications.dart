import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/Notifications/model_notifications.dart';
import 'package:wein/dash_board/Notifications/notifications_dash_board.dart';

class StoreNotification{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addNotification(ModelNotification modelNotification)async{
    await _firestore.collection('Notifications').doc(modelNotification.title).set(
        {
          'title': modelNotification.title,
          'body' : modelNotification.body,
        });
  }

  Stream<QuerySnapshot> loadNotification(){
    return _firestore.collection('Notifications').snapshots();
  }

  deleteNotification(aaa){
    _firestore.collection('Notifications').doc(aaa).delete();
  }


  successAddAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Added successfully',style: TextStyle(color: Colors.lightBlueAccent),),
      actions: <Widget>[
        TextButton(
            child: Text('Done',style: TextStyle(color: Colors.blue[750],fontWeight: FontWeight.bold),),
            onPressed: () {
              Navigator.pushNamed(context, NotificationsDashBoard.id);
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

}
