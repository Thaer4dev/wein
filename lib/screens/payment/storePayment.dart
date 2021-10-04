import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/screens/offers_list.dart';
import 'package:wein/screens/payment/modelPayment.dart';
import 'package:wein/screens/payment/myPurchase.dart';
//66
class StorePayment {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addPayment(ModelPayment modelPayment) async {
    await
    // FirebaseMessaging.instance.getToken().then((value) {
    //   String? token = value;
    _firestore.collection('Payment').doc(modelPayment.voucherId).set(
        {

// thaer(restaurant Main elements)---------------------------------------
          "restaurantName": modelPayment.restaurantName,
          "restaurantCode": modelPayment.restaurantCode,

//thaer(main offer elements)---------------------------------------
          "mainOfferDetails": modelPayment.mainOfferDetails,
          "mainOfferStartingTime": modelPayment.mainOfferStartingTime,
          "mainOfferEndTime": modelPayment.mainOfferEndTime,
          "mainOfferDaySat": modelPayment.mainOfferDaySat,
          "mainOfferDaySun": modelPayment.mainOfferDaySun,
          "mainOfferDayMon": modelPayment.mainOfferDayMon,
          "mainOfferDayTus": modelPayment.mainOfferDayTus,
          "mainOfferDayWed": modelPayment.mainOfferDayWed,
          "mainOfferDayThu": modelPayment.mainOfferDayThu,
          "mainOfferDayFri": modelPayment.mainOfferDayFri,
          "mainOfferSellingPrice": modelPayment.mainOfferSellingPrice,
          "paymentDate": modelPayment.paymentDate,
          "paymentExpireDate": modelPayment.paymentExpireDate,
          "voucherId": modelPayment.voucherId,
          "paymentAvailable": modelPayment.paymentAvailable,
          "paymentUsed": modelPayment.paymentUsed,
          "fullDateRedeem": modelPayment.fullDateRedeem,
          "fullDatePayment": modelPayment.fullDatePayment,
          "token": modelPayment.token,
        });

  }

  Stream<QuerySnapshot> loadPayment() {
    return _firestore.collection('Payment').snapshots();
  }


  deletePayment(ppp) {
    _firestore.collection('Payment').doc(ppp).delete();
  }

  editVoucher(docName,data) {
    _firestore.collection('Payment').doc(docName).update(data);
  }


  successPaymentAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Transaction Done Successfully',style: TextStyle(color: Colors.amber,fontSize: 18),),
      actions: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           MaterialButton(
             child: Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width*0.7,
               height: 40,
               margin:EdgeInsets.fromLTRB(0, 20, 0, 5),
               decoration: BoxDecoration(
                 color: Colors.lightBlueAccent,
                 borderRadius: BorderRadius.circular(30.0),),
               child: Text("Purchasing More Offer",
                 style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),),
             onPressed: () {Navigator.pushReplacementNamed(context, OffersList.id);},
           ),
           MaterialButton(
             child: Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width*0.7,
               height: 40,
               margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30.0),border: Border.all(color: Colors.lightBlueAccent, width: 2)),
               child: Text("My Purchases List",
                 style: TextStyle(color: Colors.lightBlueAccent,fontSize: 16,),),),
             onPressed: () {Navigator.pushReplacementNamed(context,MyPurchase.id);},
           ),
        ],)
      ],);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
  final GlobalKey<FormState> _globalKeyRedeem = GlobalKey<FormState>();
  var restaurantCodeController = TextEditingController();
  redeemPaymentAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Redeem your Purchase',style: TextStyle(color: Colors.amber,fontSize: 18),),
      actions: <Widget>[
        Form(
          key: _globalKeyRedeem,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Kindly ask the restaurant to fill their code',style: TextStyle(color: Colors.grey.shade700,fontSize: 14),),
                TextFormField(
                controller: restaurantCodeController,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) {restaurantCodeController.text = (value);},
                    validator: (value) {
                    if (value!.isEmpty) {
                    return 'you must fill Name Of Card Holder ';
                    }return null;
                    },
                    cursorColor: Colors.amber,
                    cursorHeight: 20,
                    style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                    border:OutlineInputBorder(borderSide: BorderSide(width: 1.0),) ,
                    labelText: 'Card Holder',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber, width: 2.0),),
                    ),
                    ),
              MaterialButton(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width*0.7,
                  height: 40,
                  margin:EdgeInsets.fromLTRB(0, 20, 0, 5),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30.0),),
                  child: Text("Purchasing More Offer",
                    style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),),
                onPressed: () {Navigator.pushReplacementNamed(context, OffersList.id);},
              ),
              MaterialButton(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width*0.7,
                  height: 40,
                  margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),border: Border.all(color: Colors.lightBlueAccent, width: 2)),
                  child: Text("My Purchases List",
                    style: TextStyle(color: Colors.lightBlueAccent,fontSize: 16,),),),
                onPressed: (){Navigator.pop(context);},
              ),
            ],),
        )
      ],);
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
