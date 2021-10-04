import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/add_menu/model_menu.dart';
import 'package:wein/dash_board/restaurants/dashBoardRestaurants.dart';

class StoreMenu{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addMenu(ModelMenu modelMenu)async{
    await _firestore.collection('Menus').doc(modelMenu.restaurantName).set(
        {

          'restaurantCode' : modelMenu.restaurantCode,
          'restaurantName' : modelMenu.restaurantName,
          'menuPhoto1' : modelMenu.menuPhoto1,
          'menuPhoto2' : modelMenu.menuPhoto2,
          'menuPhoto3' : modelMenu.menuPhoto3,
          'menuPhoto4' : modelMenu.menuPhoto4,
          'menuPhoto5' : modelMenu.menuPhoto5,
          'menuPhoto6' : modelMenu.menuPhoto6,
          'menuPhoto7' : modelMenu.menuPhoto7,
          'menuPhoto8' : modelMenu.menuPhoto8,
          'menuPhoto9' : modelMenu.menuPhoto9,
          'menuPhoto10' : modelMenu.menuPhoto10,
          'menuPhoto11' : modelMenu.menuPhoto11,
          'menuPhoto12' : modelMenu.menuPhoto12,
          'menuPhoto13' : modelMenu.menuPhoto13,
          'menuPhoto14' : modelMenu.menuPhoto14,
          'menuPhoto15' : modelMenu.menuPhoto15,
        });
  }

  Stream<QuerySnapshot> loadMenu(){
    return _firestore.collection('Menus').snapshots();
  }

  deleteMenu(aaa){
    _firestore.collection('Menus').doc(aaa).delete();
  }


  successAddAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Added successfully',style: TextStyle(color: Colors.lightBlueAccent),),
      actions: <Widget>[
        TextButton(
            child: Text('Done',style: TextStyle(color: Colors.blue[750],fontWeight: FontWeight.bold),),
            onPressed: () {
              Navigator.pushNamed(context, DashBoardRestaurants.id);
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
