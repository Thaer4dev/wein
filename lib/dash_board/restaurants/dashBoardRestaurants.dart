import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/add_menu/restaurant_menu.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/dash_board/restaurants/addNewRestaurant.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';
import 'package:wein/dash_board/restaurants/store_Restaurants.dart';
import 'package:wein/screens/offers_list.dart';



class DashBoardRestaurants extends StatefulWidget {
  static const String id = 'DashBoardRestaurants';

  @override
  _DashBoardRestaurantsState createState() => _DashBoardRestaurantsState();
}

class _DashBoardRestaurantsState extends State<DashBoardRestaurants> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar:AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading:IconButton(
          onPressed: () {Navigator.pushNamed(context, DashBoard.id);},
          icon: Icon(Icons.arrow_back_outlined,),color: Colors.black,iconSize: 30,),
        title:Text('Restaurants List',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
        centerTitle: true,
        actions:[IconButton(
          icon: Icon(Icons.login_outlined, size: 30,color: Colors.black,),
          onPressed: (){Navigator.pushNamed(context, OffersList.id);},
        )],),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text('List of Restaurants',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold,),),
          SizedBox(height: 20,),
          Expanded(
            child: Container(
                color: Colors.grey[300],
                // margin:EdgeInsets.only(left: 10,right: 10) ,
                child: restaurantsList()),
          ),
          Container(
            width: double.infinity,
            height: 60.0,
            margin:EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10) ,
            decoration:BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.lightBlueAccent,) ,
            child: MaterialButton(
              onPressed: (){Navigator.pushNamed(context, AddNewRestaurant.id);},
              child: Text(
                'Add New Restaurant',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            ),),
        ],
      ) ,
    );
  }
}
final _storeRestaurants = StoreRestaurants();
Widget restaurantsList(){

  return StreamBuilder<QuerySnapshot>(
    stream: _storeRestaurants.loadRestaurant(),
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
          separatorBuilder: (context, index)=> SizedBox(height: 15,),padding: EdgeInsets.only(top: 15,bottom: 15),
          itemCount: modelRestaurants.length,
          itemBuilder: (context, index) =>
              GestureDetector(
                child: Container(
                  height: 110,
                  width: double.infinity,
                  margin:EdgeInsets.only(left: 10,right: 10) ,
                  padding: EdgeInsets.all(10),
                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.0),border: Border.all(color: Colors.amber, width: 3),color: Colors.white,) ,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(modelRestaurants[index].restaurantName,style: TextStyle(color: Colors.grey,fontSize: 20.0,fontWeight:FontWeight.bold,),overflow: TextOverflow.ellipsis),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Flexible(
                            child: Container(height: 35, width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),color: Colors.red),
                              child: MaterialButton(
                                onPressed: (){
                                  AlertDialog alert = AlertDialog(
                                    title: Text('Do you want delete this item?',style: TextStyle(color: Colors.grey),),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(height: 40, width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(15.0)),color: Colors.red),
                                            child: MaterialButton(
                                              onPressed: (){
                                                _storeRestaurants.deleteRestaurant(modelRestaurants[index].restaurantId);
                                                Navigator.pushNamed(context, DashBoardRestaurants.id);
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
                                child: Text('Delete Restaurant', style: TextStyle(color: Colors.white,
                                    fontSize: 13, fontWeight: FontWeight.bold),),),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Flexible(
                            child: Container(height: 35, width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),color: Colors.lime),
                              child: MaterialButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, AddMenu.id,arguments: modelRestaurants[index]);
                                },
                                child: Text('Add Menu', style: TextStyle(color: Colors.white,
                                    fontSize: 13, fontWeight: FontWeight.bold),),),
                            ),
                          ),
                          // IconButton(
                          //     onPressed: (){
                          //       Navigator.pushNamed(context, AddMenu.id,arguments: modelRestaurants[index]);
                          //     },
                          //     icon:Icon(Icons.restaurant_menu_outlined,color: Colors.lime,size: 40),)
                        ],
                      ),

                    ],),
                ),
              ),
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