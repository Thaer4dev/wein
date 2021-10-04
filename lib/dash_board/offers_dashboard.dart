import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';
import 'package:wein/dash_board/restaurants/store_Restaurants.dart';
import 'package:wein/screens/offers_list.dart';

class OffersDashboard extends StatefulWidget {
  static const String id = 'OffersDashboard';

  @override
  _OffersDashboardState createState() => _OffersDashboardState();
}

class _OffersDashboardState extends State<OffersDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade200,
      appBar:AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading:IconButton(
          onPressed: () {Navigator.pushNamed(context, DashBoard.id);},
          icon: Icon(Icons.arrow_back_outlined,),color: Colors.black,iconSize: 30,),

        title:Text('Offers',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
        centerTitle: true,
        actions:[IconButton(
          icon: Icon(Icons.login_outlined, size: 30,color: Colors.black,),
          onPressed: (){Navigator.pushNamed(context, OffersList.id);},
        )],),
      body: Column(
          children: <Widget>[
            Container(
      width: double.infinity,height:60,color: Colors.grey[700],alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('List of Offers',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold,),),
              Text('(Long press to delete any offer)',style: TextStyle(color: Colors.white,fontSize: 14.0,),),
            ],
          )),
            SizedBox(height: 10,),

            Expanded(
               child: Container(
                 child: allOfferListDashBoard()),
      ),
    ])
    );
  }

  final _storeRestaurants = StoreRestaurants();



  Widget allOfferListDashBoard(){

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


              GestureDetector(
              onLongPress: (){
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
                                _storeRestaurants.deleteOffer(modelRestaurants[index].mainOfferDetails);
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
                  margin:EdgeInsets.only(left: 8,right: 8) ,
                  padding: EdgeInsets.only(right: 4),
                  child: Column(children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(height: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(child: Text(modelRestaurants[index].restaurantName,
                                style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,)),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),),
                                    child:
                                    Text(modelRestaurants[index].mainOfferDetails,
                                      style: TextStyle(color: Colors.lightBlueAccent,fontSize: 10,)
                                      ,maxLines: 3,overflow: TextOverflow.ellipsis,),),

                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                          child: Image.network(modelRestaurants[index].mainOfferImage,
                                            width: 80,height:80,fit: BoxFit.fill,),),
                                        SizedBox(width: 8,),
                                       Expanded(
                                         child:
                                         modelRestaurants[index].mainOfferWeinOffer !=false
                                             ?
                                        Container(
                                          width: double.infinity,
                                          height: 80,
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.all(7),
                                          decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.white
                                          ) ,
                                          child:Row(
                                            children: [
                                              Container(
                                                width: 90,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Salable for',
                                                      style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,),overflow: TextOverflow.ellipsis,),
                                                    Text('Total offers',
                                                      style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,),overflow: TextOverflow.ellipsis,),
                                                    Text('Sold offers',
                                                      style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                                    Text('Remaining offers',
                                                      style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                                    Text('Selling amount',
                                                      style: TextStyle(color: Colors.blue.shade700,fontWeight: FontWeight.bold,fontSize: 10,),maxLines: 2,overflow: TextOverflow.ellipsis,),

                                                  ],),
                                              ),
                                              Container(
                                                width: 10,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,)),
                                                    Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,)),
                                                    Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,)),
                                                    Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,)),
                                                    Text(':', style: TextStyle(color: Colors.blue.shade700,fontWeight: FontWeight.bold,fontSize: 10,)),

                                                  ],),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(modelRestaurants[index].mainOfferSellingPrice +" AED",
                                                        style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,),overflow: TextOverflow.ellipsis,),
                                                      Text(modelRestaurants[index].mainOfferMaxSaleFirst,
                                                        style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,),overflow: TextOverflow.ellipsis,),
                                                      Text((int.parse(modelRestaurants[index].mainOfferMaxSaleFirst) - int.parse(modelRestaurants[index].mainOfferMaxSale)).toString(),
                                                        style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                                      Text(modelRestaurants[index].mainOfferMaxSale,
                                                        style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 10,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                                      Text(((int.parse(modelRestaurants[index].mainOfferMaxSaleFirst) - int.parse(modelRestaurants[index].mainOfferMaxSale)) * int.parse(modelRestaurants[index].mainOfferSellingPrice)).toString()+" AED",
                                                        style: TextStyle(color: Colors.blue.shade700,fontWeight: FontWeight.bold,fontSize: 10,),maxLines: 2,overflow: TextOverflow.ellipsis,),

                                                    ],),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                             :
                                        Container(
                                           width: double.infinity,
                                           height: 80,
                                           alignment: Alignment.center,
                                           padding: EdgeInsets.all(7),
                                           decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.white
                                           ) ,
                                           child:Text('Not Salable Offer',
                                             style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16,),overflow: TextOverflow.ellipsis,),

                                        ))
                                      ]
                                    )

                                  ,

                                ],),),
                          )
                        ],),
                    ),
                    Divider(height: 5,color: Colors.grey,thickness: 0.3,)
                  ],),
                ),
              )

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

}
