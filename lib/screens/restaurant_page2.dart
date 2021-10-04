import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';
import 'package:wein/dash_board/restaurants/store_Restaurants.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:share/share.dart';
import 'package:wein/screens/add_review.dart';
import 'package:wein/screens/payment/paymentScreen.dart';
import 'package:wein/screens/start_menu_screen.dart';
import 'package:wein/screens/shinyButton.dart';

class RestaurantScreen2 extends StatefulWidget {
  static const String id = 'RestaurantScreen2';

  @override
  _RestaurantScreen2State createState() => _RestaurantScreen2State();
}

class _RestaurantScreen2State extends State<RestaurantScreen2> {


  @override
  Widget build(BuildContext context) {
    ModelRestaurants? modelRestaurants = ModalRoute.of(context)!.settings.arguments as ModelRestaurants?;

    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Image(image: NetworkImage(modelRestaurants!.restaurantMainImage),
                        width: double.infinity,height:200,fit: BoxFit.fill,),
                      Positioned(
                        top: 10,left: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.lightBlueAccent,
                          radius: 20,
                          child: IconButton(
                            onPressed: (){Navigator.pop(context);},
                            icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),),
                        ),),
                    ],),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(children: [
                    CircleAvatar(
                      backgroundColor: Colors.lime,
                      radius: 20,
                      child: IconButton(
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(modelRestaurants.phone);
                        },
                        icon: Icon(Icons.call_outlined,color: Colors.white,),),),
                    SizedBox(width: 8,),
                    CircleAvatar(
                      backgroundColor: Colors.lime,
                      radius: 20,
                      child: IconButton(
                        onPressed: (){
                          double lat = double.parse(modelRestaurants.lat);
                          double long = double.parse(modelRestaurants.long);
                          _launchMaps(lat, long);
                        },
                        icon: Icon(Icons.assistant_direction_outlined,color: Colors.white,),),),
                    SizedBox(width: 8,),
                    CircleAvatar(
                      backgroundColor: Colors.lime,
                      radius: 20,
                      child: IconButton(
                        onPressed: (){
                          Share.share('I got this amazing offer in Wein App ');
                        },
                        icon: Icon(Icons.ios_share_outlined,color: Colors.white,),),),
                    Expanded(child: SizedBox(width: 8,)),
                    Container(
                      width: 120, height: 35,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0), border: Border.all(color:Colors.lime,width: 0.5),),
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.pushNamed(context,StartMenuScreen.id,arguments: modelRestaurants);
                        },
                        child: Row(children: [
                          Text('Menu',style: TextStyle(color: Colors.lime,fontSize: 18,fontFamily:'Raleway')),
                          Icon(Icons.restaurant_menu_outlined,color:Colors.lime ,),],),
                      ),)
                  ],),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Row(children:[
                          Expanded(child:
                              Container(
                                  child: Text(modelRestaurants.restaurantName,
                                    style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 20),overflow: TextOverflow.ellipsis,))),
                          Container(
                            alignment: Alignment.center, height: 26,
                            margin: EdgeInsets.only(left: 10,right: 10), padding: EdgeInsets.only(left: 10,right: 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                            child: Text(modelRestaurants.rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                        ],),
                      SizedBox(height: 5,),
                      Text(modelRestaurants.cuisine,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12,),),
                      SizedBox(height: 2,),
                      Text(modelRestaurants.address,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12,),),
                      SizedBox(height: 2,),
                      Row(children: [
                        Text(modelRestaurants.openTime,style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold),),
                        Text(' - ',style: TextStyle(color: Colors.grey,fontSize: 15),),
                        Text(modelRestaurants.closeTime,style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold),),
                      ]),
                    ],),),
                Container(
                    child: restaurantOfferList()),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.start,
                    children: [
                      modelRestaurants.shisha != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/1.jpg',fit: BoxFit.contain,),)
                          :SizedBox(height: 0,),
                      modelRestaurants.playingCard != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/5.jpg',fit: BoxFit.contain,),)
                          :SizedBox(height: 0,),
                      modelRestaurants.nonSmoking != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/6.jpg',fit: BoxFit.contain,),)
                          :SizedBox(height: 0,),
                      modelRestaurants.liveMusic != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/7.jpg',fit: BoxFit.contain,),):SizedBox(height: 0,),
                      modelRestaurants.sportScreen != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/8.jpg',fit: BoxFit.contain,),):SizedBox(height: 0,),
                      modelRestaurants.outdoor != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/9.jpg',fit: BoxFit.contain,),)
                          :SizedBox(height: 0,),
                      modelRestaurants.acceptedCard != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/10.jpg',fit: BoxFit.contain,),):SizedBox(height: 0,),
                      modelRestaurants.kidsFriendly != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/11.jpg',fit: BoxFit.contain,),):SizedBox(height: 0,),
                      modelRestaurants.valetParking != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/13.jpg',fit: BoxFit.contain,),):SizedBox(height: 0,),
                      modelRestaurants.birthdayParty != false ?
                      Container(height: 60, width: 60,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), border: Border.all(color:Colors.lightBlueAccent, width: 1.5),),
                        child: Image.asset('images/14.jpg',fit: BoxFit.contain,),):SizedBox(height: 0,),
                    ],),),
                Divider(height: 15,color: Colors.grey,thickness: 0.3,),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 30),
                  child: Column(children: [
                    Row(children: [
                      Text('Users Reviews', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20)),
                      Expanded(child: SizedBox(width: 5,)),
                      Container(
                        width: 150, height: 35,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(color: Colors.amber,
                          borderRadius: BorderRadius.circular(40.0), border: Border.all(color:Colors.lime,width: 0.5),),
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.pushNamed(context,AddReview.id,arguments: modelRestaurants);
                          },
                          child:
                            Text('Add Review',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily:'Raleway')),
                        ),),
                    ],),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(10),

                      child: Stack(
                        children: [
                          Container(alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text ('No reviews for this restaurant yet',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16)),
                                Text ('Be the first & adding your review',style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.bold,fontSize: 15)),

                              ],
                            ),
                          ),
                          reviewList(),
                        ],
                      ),
                    ),
                    // Container(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //     Text("User Name",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14)),
                    //     SizedBox(height: 8,),
                    //     Text("aaaaaaaaaabbbbbbbbbbccccccccccaaaaaaaaaabbbbbbbbbbccccccccccaaaaaaaaaabbbbbbbbbbccccccccccaaaaaaaaaabbbbbbbbbbcccccccccc",
                    //         style: TextStyle(color: Colors.grey,fontSize: 13,),maxLines: 3,),
                    //       Divider(height: 15,color: Colors.grey,thickness: 0.3,),
                    //
                    //
                    //     ],),
                    // )
                  ],),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  final _storeRestaurants = StoreRestaurants();
  Widget restaurantOfferList(){

    ModelRestaurants? modelRestaurants = ModalRoute.of(context)!.settings.arguments as ModelRestaurants?;

    var idid = double.parse(modelRestaurants!.rater);

    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);



            modelRestaurants.add(ModelRestaurants(

// thaer(restaurant Main elements)---------------------------------------
              restaurantId:doc.id,
              restaurantName: data["restaurantName"],
              restaurantCode: data["restaurantCode"],
              restaurantMainImage: data['RestaurantMainImage'],
              rater: data["rater"],
              cuisine: data["cuisine"],
              address: data["address"],
              lat: data["lat"],
              long: data["long"],
              phone: data["phone"],
              openTime: data["openTime"],
              closeTime: data["closeTime"],
              shisha: data["shisha"],
              playingCard: data["playingCard"],
              nonSmoking: data["nonSmoking"],
              liveMusic: data["liveMusic"],
              sportScreen: data["sportScreen"],
              outdoor: data["outdoor"],
              acceptedCard: data["acceptedCard"],
              kidsFriendly: data["kidsFriendly"],
              valetParking: data["valetParking"],
              birthdayParty: data["birthdayParty"],

//thaer(main offer elements)---------------------------------------
              mainOffer: data["mainOffer"],
              mainOfferImage: data["mainOfferImage"],
              mainOfferDetails: data["mainOfferDetails"],
              mainOfferStartingTime: data["mainOfferStartingTime"],
              mainOfferEndTime: data["mainOfferEndTime"],
              mainOfferDaySat: data["mainOfferDaySat"],
              mainOfferDaySun: data["mainOfferDaySun"],
              mainOfferDayMon: data["mainOfferDayMon"],
              mainOfferDayTus: data["mainOfferDayTus"],
              mainOfferDayWed: data["mainOfferDayWed"],
              mainOfferDayThu: data["mainOfferDayThu"],
              mainOfferDayFri: data["mainOfferDayFri"],
              mainOfferBreakfast: data["mainOfferBreakfast"],
              mainOfferLunch: data["mainOfferLunch"],
              mainOfferDinner: data["mainOfferDinner"],
              mainOfferShishaOffer: data["mainOfferShishaOffer"],
              mainOfferDelivery: data["mainOfferDelivery"],
              mainOfferBuffet: data["mainOfferBuffet"],
              mainOfferWeinOffer: data["mainOfferWeinOffer"],
              mainOfferButtonText: data["mainOfferButtonText"],
              mainOfferSellingPrice: data["mainOfferSellingPrice"],
              mainOfferMaxSale: data["mainOfferMaxSale"],
              mainOfferMaxSaleFirst: data["mainOfferMaxSaleFirst"],
              mainOfferActiveStart:data["mainOfferActiveStart"],
              mainOfferActiveEnd:data["mainOfferActiveEnd"] ,

//thaer(second offer elements)---------------------------------------
              secondOffer: data["secondOffer"],
              secondOfferImage: data["secondOfferImage"],
              secondOfferDetails: data["secondOfferDetails"],
              secondOfferStartingTime: data["secondOfferStartingTime"],
              secondOfferEndTime: data["secondOfferEndTime"],
              secondOfferDaySat: data["secondOfferDaySat"],
              secondOfferDaySun: data["secondOfferDaySun"],
              secondOfferDayMon: data["secondOfferDayMon"],
              secondOfferDayTus: data["secondOfferDayTus"],
              secondOfferDayWed: data["secondOfferDayWed"],
              secondOfferDayThu: data["secondOfferDayThu"],
              secondOfferDayFri: data["secondOfferDayFri"],
              secondOfferBreakfast: data["secondOfferBreakfast"],
              secondOfferLunch: data["secondOfferLunch"],
              secondOfferDinner: data["secondOfferDinner"],
              secondOfferShishaOffer: data["secondOfferShishaOffer"],
              secondOfferDelivery: data["secondOfferDelivery"],
              secondOfferBuffet: data["secondOfferBuffet"],
              secondOfferWeinOffer: data["secondOfferWeinOffer"],
              secondOfferButtonText: data["secondOfferButtonText"],
              secondOfferSellingPrice: data["secondOfferSellingPrice"],
              secondOfferMaxSale: data["secondOfferMaxSale"],
              secondOfferMaxSaleFirst: data["secondOfferMaxSaleFirst"],
              secondOfferActiveStart:data["secondOfferActiveStart"],
              secondOfferActiveEnd:data["secondOfferActiveEnd"] ,

//thaer(third offer elements)---------------------------------------
              thirdOffer: data["thirdOffer"],
              thirdOfferImage: data["thirdOfferImage"],
              thirdOfferDetails: data["thirdOfferDetails"],
              thirdOfferStartingTime: data["thirdOfferStartingTime"],
              thirdOfferEndTime: data["thirdOfferEndTime"],
              thirdOfferDaySat: data["thirdOfferDaySat"],
              thirdOfferDaySun: data["thirdOfferDaySun"],
              thirdOfferDayMon: data["thirdOfferDayMon"],
              thirdOfferDayTus: data["thirdOfferDayTus"],
              thirdOfferDayWed: data["thirdOfferDayWed"],
              thirdOfferDayThu: data["thirdOfferDayThu"],
              thirdOfferDayFri: data["thirdOfferDayFri"],
              thirdOfferBreakfast: data["thirdOfferBreakfast"],
              thirdOfferLunch: data["thirdOfferLunch"],
              thirdOfferDinner: data["thirdOfferDinner"],
              thirdOfferShishaOffer: data["thirdOfferShishaOffer"],
              thirdOfferDelivery: data["thirdOfferDelivery"],
              thirdOfferBuffet: data["thirdOfferBuffet"],
              thirdOfferWeinOffer: data["thirdOfferWeinOffer"],
              thirdOfferButtonText: data["thirdOfferButtonText"],
              thirdOfferSellingPrice: data["thirdOfferSellingPrice"],
              thirdOfferMaxSale: data["thirdOfferMaxSale"],
              thirdOfferMaxSaleFirst: data["thirdOfferMaxSaleFirst"],
              thirdOfferActiveStart:data["thirdOfferActiveStart"],
              thirdOfferActiveEnd:data["thirdOfferActiveEnd"] ,

//thaer(fourth offer elements)---------------------------------------
              fourthOffer: data["fourthOffer"],
              fourthOfferImage: data["fourthOfferImage"],
              fourthOfferDetails: data["fourthOfferDetails"],
              fourthOfferStartingTime: data["fourthOfferStartingTime"],
              fourthOfferEndTime: data["fourthOfferEndTime"],
              fourthOfferDaySat: data["fourthOfferDaySat"],
              fourthOfferDaySun: data["fourthOfferDaySun"],
              fourthOfferDayMon: data["fourthOfferDayMon"],
              fourthOfferDayTus: data["fourthOfferDayTus"],
              fourthOfferDayWed: data["fourthOfferDayWed"],
              fourthOfferDayThu: data["fourthOfferDayThu"],
              fourthOfferDayFri: data["fourthOfferDayFri"],
              fourthOfferBreakfast: data["fourthOfferBreakfast"],
              fourthOfferLunch: data["fourthOfferLunch"],
              fourthOfferDinner: data["fourthOfferDinner"],
              fourthOfferShishaOffer: data["fourthOfferShishaOffer"],
              fourthOfferDelivery: data["fourthOfferDelivery"],
              fourthOfferBuffet: data["fourthOfferBuffet"],
              fourthOfferWeinOffer: data["fourthOfferWeinOffer"],
              fourthOfferButtonText: data["fourthOfferButtonText"],
              fourthOfferSellingPrice: data["fourthOfferSellingPrice"],
              fourthOfferMaxSale: data["fourthOfferMaxSale"],
              fourthOfferMaxSaleFirst: data["fourthOfferMaxSaleFirst"],
              fourthOfferActiveStart:data["fourthOfferActiveStart"],
              fourthOfferActiveEnd:data["fourthOfferActiveEnd"] ,

            ));
          }

          return
            ListView.separated(
              separatorBuilder: (context, index)=>
                  SizedBox(width: 0,),
              itemCount: modelRestaurants.length,
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>

              double.parse(modelRestaurants[index].rater)== idid?
              Container(
                margin:EdgeInsets.only(left: 8,right: 8) ,
                padding: EdgeInsets.only(right: 4),
                child: Column(children: [
                  
                  Container(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),),
                          child: Image.network(modelRestaurants[index].mainOfferImage,
                            width: 110,height:110,fit: BoxFit.fill,),),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Container(height: 110,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  height: 45,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),),
                                  child:
                                  Text(modelRestaurants[index].mainOfferDetails,
                                    style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
                                    ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                SizedBox(height: 5,),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                      Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                      Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                      SizedBox(width: 3,),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 20,width: 20,
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                          child:Text('S',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                        ),),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 20,width: 20,
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                          child:Text('M',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                        ),),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 20,width: 20,
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                          child:Text('T',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                        ),),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 20,width: 20,
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                          child:Text('W',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                        ),),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 20,width: 20,
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                          child:Text('T',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                        ),),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 20,width: 20,
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                          child:Text('F',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                        ),),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 20,width: 20,
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: modelRestaurants[index].mainOfferDaySat != false ? Colors.lightBlueAccent : Colors.grey[600],),
                                          child:Text('S',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                        ),),
                                    ],
                                  ),),
                                Expanded(
                                  child:
                                  modelRestaurants[index].mainOfferWeinOffer !=false &&
                                      int.parse(modelRestaurants[index].mainOfferMaxSale)>0
                                      ?
                                  GestureDetector(
                                      onTap: (){ Navigator.pushNamed(context,PaymentScreen.id,arguments: modelRestaurants[index]);},
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          ShinyButton(),
                                          Text(modelRestaurants[index].mainOfferButtonText, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16,)),
                                        ],))
                                      :
                                  SizedBox(height: 0,),
                                ),

                              ],),),
                        )
                      ],),
                  ),
                  Divider(height: 15,color: Colors.grey,thickness: 0.3,)
                ],),
              ):SizedBox(width: 0,),
            );
        } else {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Loading....',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20.0,fontWeight:FontWeight.bold,)),
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


  Widget reviewList(){

    ModelRestaurants? modelRestaurants = ModalRoute.of(context)!.settings.arguments as ModelRestaurants?;

    var pageRName = modelRestaurants!.restaurantName;

    return StreamBuilder<QuerySnapshot>(
      stream: loadReviews(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelAddReview>modelAddReview=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);
            modelAddReview.add(ModelAddReview(

              reviewId:doc.id,
              restaurantName: data['restaurantName'],
              userName: data['userName'],
              review: data['review'],
              reviewDate: data['reviewDate'],
            ));
          }
          return ListView.separated(
              separatorBuilder: (context, index)=>
                  SizedBox(width: 0,),
              itemCount: modelAddReview.length,
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>

              modelAddReview[index].restaurantName == pageRName?
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(modelAddReview[index].userName,style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14))),
                        Text(modelAddReview[index].reviewDate,style: TextStyle(color: Colors.amber,fontSize: 12)),
                      ],
                    ),

                    SizedBox(height: 8,),
                    Text(modelAddReview[index].review,
                      style: TextStyle(color: Colors.grey,fontSize: 13,),maxLines: 3,),
                    Divider(height: 15,color: Colors.grey,thickness: 0.3,),


                  ],),
              )
                :SizedBox(width: 0,),
            );
        } else {
          return Container(
            height: 100,color: Colors.white,width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20.0,fontWeight:FontWeight.bold,)),
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
                ]),
          );
        }
      },
    );
  }





  Future<void> _launchMaps(double lat, double lon) async {
    String googleUrl =
        'comgooglemaps://?center=${lat},${lon}';
    String appleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> loadReviews() {
    return _firestore.collection('Reviews').snapshots();
  }

}
