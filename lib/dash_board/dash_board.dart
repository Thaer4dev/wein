import 'package:flutter/material.dart';
import 'package:wein/dash_board/Notifications/notifications_dash_board.dart';
import 'package:wein/dash_board/homeAd/homeAd_dashBoard.dart';
import 'package:wein/dash_board/how_to_use/how_to_use.dart';
import 'package:wein/dash_board/offers_dashboard.dart';
import 'package:wein/dash_board/restaurants/dashBoardRestaurants.dart';
import 'package:wein/dash_board/reviews/reviews_dash_board.dart';
import 'package:wein/dash_board/soldVouchers.dart';
import 'package:wein/dash_board/users.dart';
import 'package:wein/dash_board/welcomeAd/welcomeAd_dashBoard.dart';
import 'package:wein/screens/home.dart';

class DashBoard extends StatefulWidget {
  static const String id = 'DashBoard';

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        backgroundColor: Colors.lightBlueAccent,

        title:Text('Wein Dash Board',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
        centerTitle: true,
        actions:[IconButton(
          icon: Icon(Icons.home_outlined, size: 30,color: Colors.white,),
          onPressed: (){Navigator.pushNamed(context, Home.id);},
    )],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Welcome Admin', style:TextStyle(color: Colors.grey[600],fontSize: 20,fontWeight: FontWeight.bold)),
              // SizedBox(height: 8.0,),
              // Text('   We have in Wain App :', style:TextStyle(color: Colors.grey[600],fontSize: 16)),
              // SizedBox(height: 15.0,),
              // Container(
              //   alignment: Alignment.center,
              //   height: 60,width: double.maxFinite,
              //   child: Text('1000 Users', style:TextStyle(color: Colors.lightBlueAccent,fontSize: 20,fontWeight: FontWeight.bold)),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15.0,),
              //         color: Colors.white,
              //         border: Border.all(color: Colors.lightBlueAccent,width: 8)
              //   ),),
              // SizedBox(height: 15.0,),
              // Container(
              //   alignment: Alignment.center,
              //   height: 60,width: double.maxFinite,
              //   child: Text('2000 Offers', style:TextStyle(color: Colors.amber,fontSize: 20,fontWeight: FontWeight.bold)),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15.0,),
              //       color: Colors.white,
              //       border: Border.all(color: Colors.amber,width: 8)
              //   ),),
              // SizedBox(height: 15.0,),
              // Container(
              //   alignment: Alignment.center,
              //   height: 60,width: double.maxFinite,
              //   child: Text('3000 Restaurants', style:TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold)),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15.0,),
              //       color: Colors.white,
              //       border: Border.all(color: Colors.deepOrange,width: 8)
              //   ),),
               SizedBox(height: 20.0,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    MaterialButton(
                      onPressed: () {Navigator.pushReplacementNamed(context, WelcomeAdDashBoard.id);},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: 100,minWidth: 180, color: Colors.lightBlueAccent,
                      child: Text('Welcome Ad', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                    MaterialButton(
                      onPressed: () {Navigator.pushReplacementNamed(context, HowToUse.id);},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: 100,minWidth: 180, color: Colors.lightBlueAccent,
                      child: Text('How to Use', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),


                    ),
                  ],),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, HomeAdDashBoard.id);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        height: 100,minWidth: 180, color: Colors.lightBlueAccent,
                        child: Text('Home Page Ad', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                      MaterialButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, UsersDashBoard.id);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        height: 100,minWidth: 180, color: Colors.lightBlueAccent,
                        child: Text('Users', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                    ],),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, DashBoardRestaurants.id);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        height: 100,minWidth: 180, color: Colors.lightBlueAccent,
                        child: Text('Restaurants', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                      MaterialButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, OffersDashboard.id);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        height: 100,minWidth: 180, color: Colors.lightBlueAccent,
                        child: Text('All Offers', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                    ],),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, ReviewsDashBoard.id);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        height: 100,minWidth: 180, color: Colors.lightBlueAccent,
                        child: Text('Reviews', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                      MaterialButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, NotificationsDashBoard.id);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        height: 100,minWidth: 180, color: Colors.lightBlueAccent,
                        child: Text('Notifications', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                    ],),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, SoldVouchers.id);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        height: 100,minWidth: 180, color: Colors.lightBlueAccent,
                        child: Text('Sold Vouchers', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                      // MaterialButton(
                      //   onPressed: () {Navigator.pushReplacementNamed(context, SoldVouchers.id);},
                      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      //   height: 100,minWidth: 180, color: Colors.grey[600],
                      //   child: Text('Salable Offers ', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                    ],),
                  SizedBox(height: 15.0,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     MaterialButton(
                  //       onPressed: () {  },
                  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  //       height: 100,minWidth: 180, color: Colors.grey[600],
                  //       child: Text('free', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                  //     MaterialButton(
                  //       onPressed: () {  },
                  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  //       height: 100,minWidth: 180, color: Colors.grey[600],
                  //       child: Text('free', style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),),
                  //   ],),
                  // SizedBox(height: 15.0,),
                ],)
            ],),
        ),
      ),
    );
  }
}
