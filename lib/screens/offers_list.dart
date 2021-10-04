import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wein/screens/payment/paymentScreen.dart';
import 'package:wein/screens/restaurant_page2.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';
import 'package:wein/dash_board/restaurants/store_Restaurants.dart';
import 'package:wein/screens/filterModelScreen.dart';
import 'package:wein/screens/home.dart';
import 'package:wein/screens/map_list.dart';
import 'package:wein/screens/shinyButton.dart';

class OffersList extends StatefulWidget {
  static const String id = 'OffersList';



  @override
  _OffersListState createState() => _OffersListState();
}
var searchController = TextEditingController();

class _OffersListState extends State<OffersList> {


  int _selectedIndex = 0;
  int iconId = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          leading:IconButton(
            onPressed: () {Navigator.pushNamed(context, Home.id);},
            icon: Icon(Icons.arrow_back_ios_sharp,),color: Colors.white,iconSize: 30,),
          title: Text('Offers List', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),), centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {Navigator.pushNamed(context, MapList.id);},
              icon: Icon(Icons.map_outlined,),color: Colors.white,iconSize: 30,),

          ],
        ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
        children: [
//           SizedBox(height: 10,),
//           Container(
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {Navigator.pushNamed(context, Home.id);},
//                   icon: Icon(Icons.arrow_back_ios_sharp,),color: Colors.lightBlueAccent,iconSize: 30,),
// //thaer(search bar)----------------------------
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 40,
//                     margin: EdgeInsets.all(5),
//                     child: Text('Offers List', style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold, fontSize: 26),),
//                     // child:TextFormField(
//                     //   controller: searchController,
//                     //   keyboardType: TextInputType.text,
//                     //   cursorColor: Colors.lightBlueAccent,
//                     //   cursorHeight: 20,
//                     //   style: TextStyle(color: Colors.grey, fontSize: 14,),
//                     //   decoration: InputDecoration(
//                     //     labelText: 'Restaurant,Area,Cuisine',
//                     //     labelStyle: TextStyle(color: Colors.grey),
//                     //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide(color:Colors.black54, width: 3 )),
//                     //     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),borderRadius:BorderRadius.circular(30.0) ),
//                     //     prefixIcon: Icon(Icons.search_outlined, color: Colors.black54,),),
//                     // ),
//
//                       ),
//                 ),
//                 GestureDetector(
//                   onTap: () {Navigator.pushNamed(context, MapList.id);},
//                   child: Container(
//                     margin: EdgeInsets.only(right: 12,left: 5),
//                     child: Row(
//                       children: [
//                         Image.asset('images/Location Icon.jpg',height: 35,width: 30,),
//                         // Text('Map View',style: TextStyle(fontFamily:'Raleway',color: Colors.lightBlueAccent,fontSize: 16),),
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],),
//           ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            height: 100,
            alignment: AlignmentDirectional.centerStart,
            color: Colors.white,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index)=> Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            iconId = filterModel[index].id;
                          });
                          setState(() {_selectedIndex = index;});
                        },
                        child: Container(
                          height: 60, width: 60,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: _selectedIndex != null && _selectedIndex == index
                                  ? Colors.amber
                                  : Colors.lightBlueAccent,
                                width: 4),),
                          child: Image.asset(filterModel[index].image,fit: BoxFit.fill,),),
                      ),
                      Text(filterModel[index].name,style: TextStyle(
                          color: _selectedIndex != null && _selectedIndex == index
                                 ? Colors.amber
                                 : Colors.lightBlueAccent,
                          fontSize: 11.0,fontWeight:FontWeight.bold,height:0.6),),
                    ],),
                ),
                separatorBuilder: (context, index)=> SizedBox(width: 1,), itemCount: filterModel.length),
                ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlue[300],),
                    child:GestureDetector(
                        onTap: (){setState(() {iconId = 14;});},
                        child: Text("Breakfast",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                  ),
                ),
                SizedBox(width: 5,),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlue[300],),
                    child:GestureDetector(
                        onTap: (){setState(() {iconId = 15;});},
                        child: Text("Lunch",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                  ),
                ),
                SizedBox(width: 5,),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlue[300],),
                    child:GestureDetector(
                        onTap: (){setState(() {iconId = 16;});},
                        child: Text("Dinner",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                  ),),
              ],),
          ),
// CupertinoSearchTextField(placeholder: "tr",),
          iconId == 0 ?
          Expanded(
              child: Container(
                  child: allOfferList())
          ):SizedBox(width :0),
          iconId == 1 ?
          Expanded(
            child: Container(
                child: shishaOfferList())
          ):SizedBox(width :0),
          iconId == 2 ?
          Expanded(
              child: Container(
                  child: deliveryOfferList())
          ):SizedBox(width :0),
          iconId == 3 ?
          Expanded(
              child: Container(
                  child: buffetOfferList())
          ):SizedBox(width :0),
          iconId == 4 ?
          Expanded(
              child: Container(
                  child: weinOfferList())
          ):SizedBox(width :0),
          iconId == 5 ?
          Expanded(
              child: Container(
                  child: playingCardOfferList())
          ):SizedBox(width :0),
          iconId == 6 ?
          Expanded(
              child: Container(
                  child: nonSmokingOfferList())
          ):SizedBox(width :0),
          iconId == 7 ?
          Expanded(
              child: Container(
                  child: liveMusicOfferList())
          ):SizedBox(width :0),
          iconId == 8 ?
          Expanded(
              child: Container(
                  child: sportScreenOfferList())
          ):SizedBox(width :0),
          iconId == 9 ?
          Expanded(
              child: Container(
                  child: outdoorOfferList())
          ):SizedBox(width :0),
          iconId == 10 ?
          Expanded(
              child: Container(
                  child: acceptedCardOfferList())
          ):SizedBox(width :0),
          iconId == 11 ?
          Expanded(
              child: Container(
                  child: kidsFriendlyOfferList())
          ):SizedBox(width :0),
          iconId == 12 ?
          Expanded(
              child: Container(
                  child: valetParkingOfferList())
          ):SizedBox(width :0),
          iconId == 13 ?
          Expanded(
              child: Container(
                  child: birthdayOfferList())
          ):SizedBox(width :0),
          iconId == 14 ?
          Expanded(
              child: Container(
                  child: breakfastOfferList())
          ):SizedBox(width :0),
          iconId == 15 ?
          Expanded(
              child: Container(
                  child: lunchOfferList())
          ):SizedBox(width :0),
          iconId == 16 ?
          Expanded(
              child: Container(
                  child: deliveryOfferList())
          ):SizedBox(width :0),


        ],
        ),
      )
    );
  }
}
var time = DateTime.now().hour;
final _storeRestaurants = StoreRestaurants();

Widget allOfferList(){

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
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          int.parse(modelRestaurants[index].mainOfferActiveStart) < time && int.parse(modelRestaurants[index].mainOfferActiveEnd) > time ?
              GestureDetector(
                onTap: (){
                   Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                },
                child: Container(
                  margin:EdgeInsets.only(left: 8,right: 8) ,
                  padding: EdgeInsets.only(right: 4),
                  child: Column(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children:[Expanded(child:
                             Container(
                                  child: Text(modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                              Container(
                                alignment: Alignment.center,
                                height: 20,
                                margin: EdgeInsets.only(left: 5,right: 5),
                                padding: EdgeInsets.only(left: 5,right: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                                child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                            ],),
                        ],),
                      Container(
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                  child: Image.network(modelRestaurants[index].mainOfferImage,
                                    width: 130,height:130,fit: BoxFit.fill,),),
                                Positioned(
                                  top: 105,left: 59,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 20,width: 60,
                                    padding: EdgeInsets.only(left: 10,right: 10),
                                    margin: EdgeInsets.only(left: 5,right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                    child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                                ),
                              ],
                            ),
                            SizedBox(width: 8,),

                            Expanded(
                              child: Container(height: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                          Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                          Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                                color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                                color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                                color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                                color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                                color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                                color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                    Divider(height: 5,color: Colors.grey,thickness: 0.3,)
                    ],),
                ),
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
Widget shishaOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].mainOfferShishaOffer !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                            
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    height: 60,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),),
                                    child:
                                    Text(modelRestaurants[index].mainOfferDetails,
                                      style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                      ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                  modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                  Container(
                                      height: 60,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.bottomRight,
                                      child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                      :SizedBox(width: 0,),
                                  modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                  Container(
                                      height: 60,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.bottomRight,
                                      child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                      :SizedBox(width: 0,),
                                  modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                  Container(
                                      height: 60,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.bottomRight,
                                      child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                      :SizedBox(width: 0,),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget deliveryOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].mainOfferDelivery !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),
                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget buffetOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].mainOfferBuffet !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                height: 60,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),),
                                child:
                                Text(modelRestaurants[index].mainOfferDetails,
                                  style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
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
                                      fit: FlexFit.tight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget weinOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(width: 0,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].mainOfferWeinOffer !=false &&
                                          int.parse(modelRestaurants[index].mainOfferMaxSale)>0 ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget playingCardOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].playingCard !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget nonSmokingOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].nonSmoking !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget liveMusicOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].liveMusic !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget sportScreenOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].sportScreen !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget outdoorOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].outdoor !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget acceptedCardOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].acceptedCard !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget kidsFriendlyOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].kidsFriendly !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget valetParkingOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].valetParking !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget birthdayOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].birthdayParty !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget breakfastOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].mainOfferBreakfast !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget lunchOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].mainOfferLunch !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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
Widget dinnerOfferList(){

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
        return ListView.separated(
          separatorBuilder: (context, index)=>
              SizedBox(height: 4,),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>

          modelRestaurants[index].mainOfferDinner !=false ?
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RestaurantScreen2.id,arguments: modelRestaurants[index]);
            },
            child: Container(
              margin:EdgeInsets.only(left: 8,right: 8) ,
              padding: EdgeInsets.only(right: 4),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Expanded(child:
                      Container(
                          child: Text(modelRestaurants[index].restaurantName,
                            style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,))),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          margin: EdgeInsets.only(left: 5,right: 5),
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: Colors.amber,),
                          child: Text(modelRestaurants[index].rater,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),)
                      ],),
                        ],),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            child: Image.network(modelRestaurants[index].mainOfferImage,
                              width: 130,height:130,fit: BoxFit.fill,),),
                          Positioned(
                            top: 105,left: 59,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,width: 60,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              margin: EdgeInsets.only(left: 5,right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                              child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9,)),),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),

                      Expanded(
                        child: Container(height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),),
                                          child:
                                          Text(modelRestaurants[index].mainOfferDetails,
                                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14,)
                                            ,maxLines: 3,overflow: TextOverflow.ellipsis,),),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != true && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+1 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(height: 4,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != true ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+2 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                        modelRestaurants[index].secondOffer != false && modelRestaurants[index].thirdOffer != false && modelRestaurants[index].fourthOffer != false ?
                                        Container(
                                            height: 60,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.bottomRight,
                                            child: Text("+3 Offers", style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 12,)))
                                            :SizedBox(width: 0,),
                                      ],
                                    ),

                              SizedBox(height: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(modelRestaurants[index].mainOfferStartingTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
                                    Text('-',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                                    Text(modelRestaurants[index].mainOfferEndTime,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontWeight: FontWeight.bold),),
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
                                          color: modelRestaurants[index].mainOfferDaySun != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayMon != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayTus != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayWed != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayThu != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
                                          color: modelRestaurants[index].mainOfferDayFri != false ? Colors.lightBlueAccent : Colors.grey[600],),
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
              ],),
            ),
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







