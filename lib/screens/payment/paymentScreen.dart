import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';
import 'package:wein/screens/payment/modelPayment.dart';
import 'package:wein/screens/payment/storePayment.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';



class PaymentScreen extends StatefulWidget {
  static const String id = 'PaymentScreen';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final _storePayment = StorePayment();
final GlobalKey<FormState> _globalKeyPayment = GlobalKey<FormState>();
var cardHolderController = TextEditingController();
var cardNumberController = TextEditingController();
var cardExpireController = TextEditingController();
var ccvController = TextEditingController();
var paymentAvailable=true;
var paymentUsed=false;
var paymentExpiry=false;

var paymentDate = DateFormat('dd/MMM/yy').format(DateTime.now());
Future<DateTime> fullDatePayments = NTP.now();
DateTime fullDatePayment = DateTime.now();
var dateOfPaymentPlusNinetyDays = fullDatePayment.add(Duration(days: 90));
var paymentExpireDate = DateFormat('dd/MMM/yy').format(dateOfPaymentPlusNinetyDays);


class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    ModelRestaurants? modelRestaurants = ModalRoute.of(context)!.settings.arguments as ModelRestaurants?;
    var rCode = modelRestaurants!.restaurantCode;
    var oPrice = modelRestaurants.mainOfferSellingPrice;
    var maxS = modelRestaurants.mainOfferMaxSale;
    int newMaxS = int.parse(modelRestaurants.mainOfferMaxSale)-1;


    var voucherId = 'Wein-$rCode-$oPrice-$maxS';
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor:Colors.grey.shade800,
      //   elevation: 0,
      // ),
      body: Form(
        key: _globalKeyPayment,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.grey.shade800,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      padding: EdgeInsets.fromLTRB(50, 40, 50, 20),
                      child: Image.asset(
                        'images/logo with slogan.png', width: 100,fit: BoxFit.contain,),
                    ),
                    Positioned(
                      top: 40,left: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.lightBlueAccent,
                        radius: 20,
                        child: IconButton(
                          onPressed: (){Navigator.pop(context);},
                          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),),
                      ),),
                  ],
                ),
                Container(
                margin:EdgeInsets.fromLTRB(8, 15, 8, 15),
                  child: Text(modelRestaurants.restaurantName,
                    style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.bold,fontSize: 24),overflow: TextOverflow.ellipsis,)),
                Container(
                  margin:EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child:
                  Text(modelRestaurants.mainOfferDetails,
                    style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 20,)
                    ,maxLines: 3,textAlign: TextAlign.center,),),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 50,
                  margin:EdgeInsets.fromLTRB(0, 20, 0, 20),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20.0),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Get it now for only  ",
                        style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Raleway')),
                      Text(modelRestaurants.mainOfferSellingPrice,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24,)),
                      Text('AED',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24,)),
                    ],
                  ),),
                Container(
                  margin:EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child:
                  Text('Kindly fill the Payment information',
                      style: TextStyle(color: Colors.grey,fontSize: 16,fontFamily: 'Raleway',fontStyle: FontStyle.italic)),),
                Container(
               child: Column(
                 children: [
                   Container(
                     margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                     width: MediaQuery.of(context).size.width*0.9,
                     child: TextFormField(
                       controller: cardHolderController,
                       keyboardType: TextInputType.text,
                       onFieldSubmitted: (value) {cardHolderController.text = (value);},
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
                   )),
                   Container(
                       margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                       width: MediaQuery.of(context).size.width*0.9,
                       child: TextFormField(
                         controller: cardNumberController,
                         keyboardType: TextInputType.number,
                         onFieldSubmitted: (value) {cardNumberController.text = (value);},
                         validator: (value) {
                           if (value!.isEmpty) {
                             return 'you must fill Card Number ';
                           }return null;
                         },
                         cursorColor: Colors.amber,
                         cursorHeight: 20,
                         style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                         decoration: InputDecoration(
                           border:OutlineInputBorder(borderSide: BorderSide(width: 1.0),) ,
                           labelText: 'Card Number',
                           labelStyle: TextStyle(color: Colors.grey),
                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber, width: 2.0),),
                         ),
                       )),
                   Container(
                     margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                     width: MediaQuery.of(context).size.width*0.9,

                     child: Row(

                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                             width: MediaQuery.of(context).size.width*0.43,
                             child: TextFormField(
                               controller: cardExpireController,
                               keyboardType: TextInputType.number,
                               onFieldSubmitted: (value) {cardExpireController.text = (value);},
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'you must fill expire date ';
                                 }return null;
                               },
                               cursorColor: Colors.amber,
                               cursorHeight: 20,
                               style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                               decoration: InputDecoration(
                                 border:OutlineInputBorder(borderSide: BorderSide(width: 1.0),) ,
                                 hintText: 'MM/YY',hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 14, ),
                                 labelText: 'Expire Date',
                                 labelStyle: TextStyle(color: Colors.grey),
                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber, width: 2.0),),
                               ),
                             )),
                         Expanded(child: SizedBox(width: 0,)),
                         Container(
                             width: MediaQuery.of(context).size.width*0.43,
                             child: TextFormField(
                               controller: ccvController,
                               keyboardType: TextInputType.number,
                               onFieldSubmitted: (value) {ccvController.text = (value);},
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'you must fill CCV Number ';
                                 }return null;
                               },
                               cursorColor: Colors.amber,
                               cursorHeight: 20,
                               style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                               decoration: InputDecoration(
                                 border:OutlineInputBorder(borderSide: BorderSide(width: 1.0),) ,
                                 labelText: 'CCV',
                                 labelStyle: TextStyle(color: Colors.grey),
                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber, width: 2.0),),
                               ),
                             )),
                       ],
                     ),
                   ),

                 ],
               ),
             ),
                MaterialButton(
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width*0.7,
                        height: 50,
                        margin:EdgeInsets.fromLTRB(0, 20, 0, 5),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(30.0),),
                          child: Text("Place Order  ",
                                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
                                onPressed: () async{
                                  final FirebaseAuth auth = FirebaseAuth.instance;
                                  final User? user = auth.currentUser;
                                  final uid = user!.uid;



                               //    FirebaseMessaging.instance.getToken().then((value) {
                               // String? token = value;
                               _globalKeyPayment.currentState!.save();
                               _firestore.collection('Offers List').doc(modelRestaurants.mainOfferDetails).update({
                                 "mainOfferMaxSale": newMaxS.toString(),
                                  });

                               _storePayment.addPayment(ModelPayment(

                               restaurantName: modelRestaurants.restaurantName,
                               restaurantCode: modelRestaurants.restaurantCode,

                               mainOfferDetails: modelRestaurants.mainOfferDetails,
                               mainOfferStartingTime : modelRestaurants.mainOfferStartingTime,
                               mainOfferEndTime : modelRestaurants.mainOfferEndTime,
                               mainOfferDaySat : modelRestaurants.mainOfferDaySat,
                               mainOfferDaySun : modelRestaurants.mainOfferDaySun,
                               mainOfferDayMon : modelRestaurants.mainOfferDayMon,
                               mainOfferDayTus : modelRestaurants.mainOfferDayTus,
                               mainOfferDayWed : modelRestaurants.mainOfferDayWed,
                               mainOfferDayThu : modelRestaurants.mainOfferDayThu,
                               mainOfferDayFri : modelRestaurants.mainOfferDayFri,
                               mainOfferSellingPrice : modelRestaurants.mainOfferSellingPrice,


                               paymentDate : paymentDate.toString(),
                               paymentExpireDate : paymentExpireDate.toString(),
                               voucherId : voucherId.toString(),
                               paymentAvailable: paymentAvailable,
                               paymentUsed: paymentUsed,
                               fullDateRedeem : "",
                               fullDatePayment : fullDatePayment.toString(),
                               token:uid.toString(),
                               ));
                               // _globalKeyPayment.currentState!.reset();
                               _storePayment.successPaymentAlert(context);
                               },),



                MaterialButton(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width*0.7,
                    height: 50,
                    margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),border: Border.all(color: Colors.lightBlueAccent, width: 2)),
                    child: Text("Cancel  ",
                      style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20,),),),
                      onPressed: (){
                    Navigator.pop(context);
                    },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


    }
