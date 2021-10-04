import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/screens/payment/modelPayment.dart';
import 'package:wein/screens/payment/storePayment.dart';

class SoldVouchers extends StatefulWidget {
  static const String id = 'SoldVouchers';

  @override
  _SoldVouchersState createState() => _SoldVouchersState();
}
class _SoldVouchersState extends State<SoldVouchers> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading:IconButton(
          onPressed: () {Navigator.pushNamed(context, DashBoard.id);},
          icon: Icon(Icons.arrow_back_outlined,),color: Colors.black,iconSize: 30,),
        title:Text('Sold Vouchers',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
        centerTitle: true,),
      body: Column(
        children: <Widget>[
          Container(
              width: double.infinity,height:60,color: Colors.grey[700],alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('List of Sold Vouchers',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold,),),
                  Text('(Long press to delete any vouchers)',style: TextStyle(color: Colors.white,fontSize: 14.0,),),
                ],
              )),
          Expanded(
            child: Container(
                child: allVouchersList()),
          ),],
      ) ,);
  }

  final _store = StorePayment();

  Widget allVouchersList(){

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


            GestureDetector(
              onLongPress: (){
                AlertDialog alert = AlertDialog(
                  title: Text('Do you want delete this voucher?',style: TextStyle(color: Colors.grey),),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(height: 40, width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),color: Colors.red),
                          child: MaterialButton(
                            onPressed: (){
                              _store.deletePayment(modelPayment[index].fullDatePayment);
                              Navigator.pop(context);
                            },
                            child: Text('Delete', style: TextStyle(color: Colors.white,
                                fontSize: 16, fontWeight: FontWeight.bold),),),
                        ),

                        TextButton(
                            child: Text('Cancel',style: TextStyle(color: Colors.grey,fontSize: 16)),
                            onPressed: (){Navigator.pop(context);}),
                      ],
                    )
                  ],
                );
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    });
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                margin:EdgeInsets.only(left: 10,right: 10) ,
                padding: EdgeInsets.all(7),
                decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                    color: modelPayment[index].paymentUsed == false
                        ? Colors.lightBlue : Colors.grey
                ) ,
                child:Row(
                  children: [
                    Container(
                      width: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('V No',
                            style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text('P Date',
                            style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text('User ID',
                            style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text('Valid',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text('R Name',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text('Offer',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text('P For',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text('Status',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,)

                        ],),
                    ),
                    Container(
                      width: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),Text(':', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),Text(':', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),Text(':', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),Text(':', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),Text(':', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                        ],),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(modelPayment[index].voucherId,
                            style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text(modelPayment[index].fullDatePayment,
                            style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 7,),
                          Text(modelPayment[index].token,
                            style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 12,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 6,),
                            Text(modelPayment[index].paymentExpireDate,
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 5,),
                            Text(modelPayment[index].restaurantName,
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 10,),
                            Text(modelPayment[index].mainOfferDetails,
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 10,),
                            Text(modelPayment[index].mainOfferSellingPrice + 'AED',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 5,),
                          Container(
                            child:
                            modelPayment[index].paymentUsed == false
                                ?
                            Text("Available",
                               style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),)
                                :
                            Text("Used",
                                  style: TextStyle(color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],),
                      ),
                    ),
                  ],
                ),
              ),
            )
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