import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wein/screens/payment/modelPayment.dart';
import 'package:wein/screens/payment/storePayment.dart';

class PurchaseDshBoard extends StatefulWidget {
  static const String id = 'PurchaseDshBoard';

  @override
  _PurchaseDshBoardState createState() => _PurchaseDshBoardState();
}
class _PurchaseDshBoardState extends State<PurchaseDshBoard> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.amber,

        title:Text('User Purchase',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
        centerTitle: true,),
      body: Column(
        children: <Widget>[
          Container(
              width: double.infinity,height:50,color: Colors.grey[700],alignment: Alignment.center,
              child: Text('list of user vouchers',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold,),)),
          Expanded(
            child: Container(
                child: vouchersList()),
          ),],
      ) ,);
  }

  final _store = StorePayment();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _globalKeyRedeem = GlobalKey<FormState>();
  var restaurantCodeController = TextEditingController();
  final uid = FirebaseAuth.instance.currentUser!.uid;
  var fullDateRedeem = DateTime.now();

  Widget vouchersList(){

    return StreamBuilder<QuerySnapshot>(
      stream: _store.loadPayment(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelPayment>modelPayment=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);
            modelPayment.add(ModelPayment(
              restaurantName: data['restaurantName'],
              restaurantCode: data['restaurantCode'],
              mainOfferDetails: data['mainOfferDetails'],
              mainOfferStartingTime: data['mainOfferStartingTime'],
              mainOfferEndTime: data['mainOfferEndTime'],
              mainOfferDaySat: data['mainOfferDaySat'],
              mainOfferDaySun: data['mainOfferDaySun'],
              mainOfferDayMon: data['mainOfferDayMon'],
              mainOfferDayTus: data['mainOfferDayTus'],
              mainOfferDayWed: data['mainOfferDayWed'],
              mainOfferDayThu: data['mainOfferDayThu'],
              mainOfferDayFri: data['mainOfferDayFri'],
              mainOfferSellingPrice: data['mainOfferSellingPrice'],
              paymentDate: data['paymentDate'],
              paymentExpireDate: data['paymentExpireDate'],
              voucherId: data['voucherId'],
              paymentAvailable: data['paymentAvailable'],
              paymentUsed: data['paymentUsed'],
              fullDateRedeem: data['fullDateRedeem'],
              fullDatePayment: data['fullDatePayment'],
              token: data['token'],

            ));}
          return ListView.separated(
            separatorBuilder: (context, index)=> SizedBox(height: 15,),padding: EdgeInsets.only(top: 15,bottom: 15),
            itemCount: modelPayment.length,
            itemBuilder: (context, index) =>

            modelPayment[index].token== uid?

            GestureDetector(
              child: Container(
                height: 130,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                margin:EdgeInsets.only(left: 10,right: 10) ,
                padding: EdgeInsets.only(top: 6,) ,
                decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.0),) ,
                child:Stack(
                  children: [
                    Image.asset(
                      'images/voucher.png', width: double.infinity,height: 120,
                      color: modelPayment[index].paymentUsed == false
                          ? Colors.lightBlue : Colors.lightBlueAccent.shade100
                      ,),
                    Row(children: [
                      Container(
                        height: 120,width: 110,
                        margin: EdgeInsets.only(top: 4),
                        child: Column(children: [
                          Text('valid until',style: TextStyle(color: Colors.white,fontSize: 11),),
                          Text(modelPayment[index].paymentExpireDate,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight:FontWeight.bold),),
                          SizedBox(height: 6,),
                          Text('Purchased For',style: TextStyle(color: Colors.white,fontSize: 11,),),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(modelPayment[index].mainOfferSellingPrice,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight:FontWeight.bold),),
                              Text(' AED',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight:FontWeight.bold),),
                            ],),

                          Container(
                            child:
                            modelPayment[index].paymentUsed == false
                                ?
                            MaterialButton(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),),
                                  child: Text("Redeem",
                                    style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15,fontWeight: FontWeight.bold),),),
                                onPressed: () {
                                  AlertDialog alert = AlertDialog(
                                    title: Text('Redeem your Purchase',style: TextStyle(color: Colors.amber,fontSize: 20,),textAlign: TextAlign.center,),
                                    actions: <Widget>[
                                      Form(
                                        key: _globalKeyRedeem,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Kindly ask the restaurant to fill their code',style: TextStyle(color: Colors.grey.shade700,fontSize: 14,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 15,),
                                            TextFormField(
                                              controller: restaurantCodeController,
                                              keyboardType: TextInputType.number,
                                              onFieldSubmitted: (value) {restaurantCodeController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill Restaurant Code ';
                                                }return null;
                                              },
                                              cursorColor: Colors.amber,
                                              cursorHeight: 20,
                                              style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                border:OutlineInputBorder(borderSide: BorderSide(width: 1.0),) ,
                                                labelText: 'Restaurant Code',
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
                                                onPressed: () {
                                                  if (_globalKeyRedeem.currentState!.validate()&&
                                                      int.parse(modelPayment[index].restaurantCode) == int.parse(restaurantCodeController.text)
                                                  ) {
                                                    _store.loadingAlert(context);
                                                    _firestore.collection('Payment').doc(modelPayment[index].fullDatePayment).update({
                                                      "paymentUsed": true,
                                                      "fullDateRedeem": fullDateRedeem.toString(),
                                                    });
                                                    Navigator.pushReplacementNamed(context, PurchaseDshBoard.id);
                                                  }
                                                }
                                            ),
                                          ],),
                                      )
                                    ],);
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert;
                                      });
                                }
                            )
                                :Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 10,left: 7,right: 7),
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.red.shade300,
                                borderRadius: BorderRadius.circular(20.0),),
                              child: Text("Used",
                                style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),),
                          ),
                        ],),),
                      Expanded(
                        child: Container(
                          height: 120,
                          margin: EdgeInsets.fromLTRB(6, 4, 3, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(modelPayment[index].restaurantName,
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17,),overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 10,),
                              Text(modelPayment[index].mainOfferDetails,
                                style: TextStyle(color: Colors.white,fontSize: 12,)
                                ,maxLines: 3,overflow: TextOverflow.ellipsis,),
                              Expanded(child: SizedBox(height: 0,)),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelPayment[index].mainOfferStartingTime,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.white,fontSize: 12),),
                                    Text(modelPayment[index].mainOfferEndTime,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 3,),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: modelPayment[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                        child:Text('S',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                      ),),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: modelPayment[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                        child:Text('M',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                      ),),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: modelPayment[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                        child:Text('T',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                      ),),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: modelPayment[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                        child:Text('W',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                      ),),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: modelPayment[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                        child:Text('T',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                      ),),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: modelPayment[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                        child:Text('F',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                      ),),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: modelPayment[index].mainOfferDaySat != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                        child:Text('S',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                      ),),
                                  ],
                                ),),
                            ],),
                        ),
                      )
                    ],)


                  ],
                ),
              ),
            ):SizedBox(width: 0,),
          );
        } else {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Loading....',style: TextStyle(color: Colors.amber,fontSize: 20.0,fontWeight:FontWeight.bold,)),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(width: 200, height: 10,
                    child:LinearProgressIndicator(
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor,),

                    ),
                  ),
                ),
              ]);
        }
      },

    );

  }


}