import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';
import 'package:wein/dash_board/restaurants/store_Restaurants.dart';
import 'package:wein/screens/filterModelScreen.dart';
import 'package:wein/screens/home.dart';
import 'package:wein/screens/restaurant_page2.dart';
import 'package:wein/screens/shinyButton.dart';
import 'package:location/location.dart';



class MapList extends StatefulWidget {
  static const String id = 'MapList';

  @override
  _MapListState createState() => _MapListState();
}

class _MapListState extends State<MapList> {

  Map<MarkerId,Marker> markers = <MarkerId,Marker>{};

  Completer<GoogleMapController> _controller = Completer();

  Location location = new Location();

  @override
  void initState() {
    super.initState();
    checkLocationServicesInDevice();
  }

//thaer ( الحصول على اذن استخدام الموقع والجي بي اس + الحصول على الموقع الحالي للجهاز)-----------------------
  //كل شي مزبوط وعم يطبعلي الموقع الحالي تحت بس ما عرفت كيف حدد المسافة بينه وبين موقع المطعم
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  Future<void> checkLocationServicesInDevice() async {
    Location location = new Location();
    _serviceEnabled = await location.serviceEnabled();
    if(_serviceEnabled)
    {
      _permissionGranted = await location.hasPermission();
      if(_permissionGranted == PermissionStatus.granted)
      {
        location.onLocationChanged.listen((LocationData currentLocation) {
          print(currentLocation.latitude.toString() + " " + currentLocation.longitude.toString());

        });
      }else{
        _permissionGranted = await location.requestPermission();
        if(_permissionGranted == PermissionStatus.granted)
        {
          print('user allowed');
        }else{
          Navigator.pushNamed(context, Home.id);
        }
      }
    }else{
      _serviceEnabled = await location.requestService();
      if(_serviceEnabled)
      {
        _permissionGranted = await location.hasPermission();
        if(_permissionGranted == PermissionStatus.granted)
        {
          print('user allowed before');
        }else{
          _permissionGranted = await location.requestPermission();
          if(_permissionGranted == PermissionStatus.granted)
          {
            print('user allowed');
          }else{
            Navigator.pushNamed(context, Home.id);
          }
        }
      }else{
        Navigator.pushNamed(context, Home.id);
      }
    }
  }
// ---------------------------------------------------------------------------------


  int _selectedIndex = 0;
  int iconId = 0;

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
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
                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
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
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: _buildGoogleMap(context),),
                    Positioned(
                      top: 10,left: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: IconButton(
                          onPressed: (){Navigator.pushReplacementNamed(context, Home.id);},
                          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.lightBlueAccent,),),
                      ),),

                  ],
                ),
              ),
              iconId == 0 ?
              Container(
                  child: allOfferList()):SizedBox(height :0),
              iconId == 1 ?
              Container(
                  child: shishaOfferList()):SizedBox(height :0),
              iconId == 2 ?
              Container(
                  child: deliveryOfferList()):SizedBox(height :0),
              iconId == 3 ?
              Container(
                  child: buffetOfferList()):SizedBox(height :0),
              iconId == 4 ?
              Container(
                  child: weinOfferList()):SizedBox(height :0),
              iconId == 5 ?
              Container(
                  child: playingCardOfferList()):SizedBox(height :0),
              iconId == 6 ?
              Container(
                  child: nonSmokingOfferList()):SizedBox(height :0),
              iconId == 7 ?
              Container(
                  child: liveMusicOfferList()):SizedBox(height :0),
              iconId == 8 ?
              Container(
                  child: sportScreenOfferList()):SizedBox(height :0),
              iconId == 9 ?
              Container(
                  child: outdoorOfferList()):SizedBox(height :0),
              iconId == 10 ?
              Container(
                  child: acceptedCardOfferList()):SizedBox(height :0),
              iconId == 11 ?
              Container(
                  child: kidsFriendlyOfferList()):SizedBox(height :0),
              iconId == 12 ?
              Container(
                  child: valetParkingOfferList()):SizedBox(height :0),
              iconId == 13 ?
              Container(
                  child: birthdayOfferList()):SizedBox(height :0),
              iconId == 14 ?
              Container(
                  child: breakfastOfferList()):SizedBox(height :0),
              iconId == 15 ?
              Container(
                  child: lunchOfferList()):SizedBox(height :0),
              iconId == 16 ?
              Container(
                  child: deliveryOfferList()):SizedBox(height :0),

              SizedBox(height: 10,)
            ],),
        )
    );
  }



  Future<void> _initMarker(double lat, double long, specifyId)async{
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      infoWindow:InfoWindow(title: specifyId, ),
      position: LatLng(lat, long),
      icon : BitmapDescriptor.defaultMarker,
    );

    setState(() {
      markers[markerId]=marker;
    });

  }

  Future<void> _gotoLocation(double lat, double long) async {

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 15, tilt: 50.0,
          bearing: 45.0,)));
  }

  Widget _buildGoogleMap(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(25.276987, 55.296249), zoom: 12,),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: Set<Marker>.of(markers.values),


    );
  }

  var time = DateTime.now().hour;
  final _storeRestaurants = StoreRestaurants();

  Widget allOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                int.parse(modelRestaurants[index].mainOfferActiveStart) < time && int.parse(modelRestaurants[index].mainOfferActiveEnd) > time
                    ?
                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(height: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget shishaOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].mainOfferShishaOffer !=false ?
                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget deliveryOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].mainOfferDelivery !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget buffetOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].mainOfferBuffet !=false ?
                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget weinOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].mainOfferWeinOffer !=false &&
                                int.parse(modelRestaurants[index].mainOfferMaxSale)>0 ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget playingCardOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].playingCard !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget nonSmokingOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].nonSmoking !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget liveMusicOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].liveMusic !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget sportScreenOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].sportScreen !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget outdoorOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].outdoor !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget acceptedCardOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].acceptedCard !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget kidsFriendlyOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].kidsFriendly !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget valetParkingOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].valetParking !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget birthdayOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].birthdayParty !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget breakfastOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].mainOfferBreakfast !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget lunchOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].mainOfferLunch !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }
  Widget dinnerOfferList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _storeRestaurants.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelRestaurants>modelRestaurants = [];
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
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 150,
              alignment: AlignmentDirectional.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: 10,),
                itemCount: modelRestaurants.length,
                itemBuilder: (context, index) =>

                modelRestaurants[index].mainOfferDinner !=false ?

                GestureDetector(
                  onLongPress: (){
                    Navigator.pushNamed(context,RestaurantScreen2.id,arguments: modelRestaurants[index]);
                  },

                  onTap: () {
                    String specifyId = modelRestaurants[index].restaurantName;
                    double lat = double.parse(modelRestaurants[index].lat);
                    double long = double.parse(modelRestaurants[index].long);
                    _gotoLocation(lat, long);
                    _initMarker(lat, long,specifyId);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text(
                                    modelRestaurants[index].restaurantName,
                                    style: TextStyle(color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,),
                              child: Text(modelRestaurants[index].rater,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,)),)
                          ],),
                        Container(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                    child: Image.network(modelRestaurants[index].mainOfferImage,
                                      width: 115,height:115,fit: BoxFit.fill,),),
                                  Positioned(
                                    top: 90,left: 46,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 15,width: 50,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), color: Colors.lightBlueAccent,),
                                      child: Text(modelRestaurants[index].cuisine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 7,)),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8,),

                              Expanded(
                                child: Container(height: 115,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 55,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),),
                                            child:
                                            Text(modelRestaurants[index].mainOfferDetails,
                                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 13,)
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
                                      Container(
                                        height: 20,
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
                                            onTap: (){print('yyyy');},
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
                )
                    : SizedBox(width: 0,),
              ));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 150,
            alignment: AlignmentDirectional.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading....', style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: 200, height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Theme
                            .of(context)
                            .primaryColor,),

                      ),
                    ),
                  ),
                ]),
          );
        }
      },
    );
  }




}
