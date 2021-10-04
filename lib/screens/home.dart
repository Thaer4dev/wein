import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wein/dash_board/homeAd/add_home_ad.dart';
import 'package:wein/screens/aboutWeinApp.dart';
import 'package:wein/screens/getHelp.dart';
import 'package:wein/screens/login_screen.dart';
import 'package:wein/screens/map_list.dart';
import 'package:wein/screens/notifications.dart';
import 'package:wein/screens/offers_list.dart';
import 'package:wein/screens/payment/myPurchase.dart';
import 'package:wein/screens/termsConditions.dart';

//thaer (let drawer open from other key-should make 3 steps) 1st step
var scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  static const String id = 'Home';



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double mainIconHeight = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1500)).then((value) => setState(() {
          mainIconHeight = 120;
        }));
  }





  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
//thaer (let drawer open from other key-should make 3 steps) 1st step
    key: scaffoldKey,
      drawer: Drawer(
        child:Container(

          child: Column(
            children: [

              Container(
                color: Colors.grey.shade800,
                height: 250,width: double.infinity,
                padding: EdgeInsets.fromLTRB(50, 50, 50, 20),
                child: Image.asset(
                  'images/logo with slogan.png', width: 100,fit: BoxFit.contain,),
              ),
              Container(
                height: 40,width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 8, 2, 2),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Image(image: AssetImage('images/list icon.png'), height: 35.0, width: 35.0,color: Colors.amber,),
                      SizedBox(width: 8,),
                      Text('Offers List', style:TextStyle(color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.bold)),],),
                  onTap: () {Navigator.pushReplacementNamed(context, OffersList.id);},
                ),
              ),
              Container(
                height: 40,width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 8, 2, 2),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Image(image: AssetImage('images/map icon.png'), height: 35.0, width: 35.0,color: Colors.amber,),
                      SizedBox(width: 8,),
                      Text('Offers Map', style:TextStyle(color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.bold)),],),
                  onTap: () {Navigator.pushReplacementNamed(context, MapList.id);},
                ),
              ),
              Container(
                height: 40,width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 8, 2, 2),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart_outlined, size: 35,color: Colors.amber,),
                      SizedBox(width: 8,),
                      Text('My Purchases', style:TextStyle(color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.bold)),],),
                  onTap: () {Navigator.pushReplacementNamed(context, MyPurchase.id);},
                ),
              ),
              Container(
                height: 40,width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 8, 2, 2),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.notifications_outlined, size: 35,color: Colors.amber,),
                      SizedBox(width: 8,),
                      Text('Notifications', style:TextStyle(color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.bold)),],),
                  onTap: () {Navigator.pushReplacementNamed(context, Notifications.id);},
                ),
              ),
              Container(
                height: 40,width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 8, 2, 2),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.contact_support_outlined, size: 35,color: Colors.amber,),
                      SizedBox(width: 8,),
                      Text('Get Help', style:TextStyle(color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.bold)),],),
                  onTap: () {Navigator.pushReplacementNamed(context, GetHelp.id);},
                ),
              ),
              Container(
                height: 40,width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 8, 2, 2),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.article_outlined, size: 35,color: Colors.amber,),
                      SizedBox(width: 8,),
                      Text('Terms & Conditions', style:TextStyle(color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.bold)),],),
                  onTap: () {Navigator.pushReplacementNamed(context, TermsConditions.id);},
                ),
              ),
              Container(
                height: 40,width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 8, 2, 2),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Image(image: AssetImage('images/weinlogo.png'), height: 35.0, width: 35.0,color: Colors.amber,),
                      SizedBox(width: 8,),
                      Text('About Wein App', style:TextStyle(color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.bold)),],),
                  onTap: () {Navigator.pushReplacementNamed(context, AboutWeinApp.id);},
                ),
              ),
              Container(
                height: 40,width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 8, 2, 2),
                child: GestureDetector(
                  child: Row(
                    children: [
                    Icon(Icons.logout_outlined, size: 35,color: Colors.amber,),
                      SizedBox(width: 8,),
                      Text('Logout', style:TextStyle(color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.bold)),],),
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushReplacementNamed(context, LoginScreen.id);});
                  },
                ),
              ),

            ],
          ),
        )),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/background home.jpg'), fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken))),),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Column(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
//thaer (let drawer open from other key-should make 3 steps) 3rd step
                            onPressed: () {
                                if(FirebaseAuth.instance.currentUser != null){
                                scaffoldKey.currentState!.openDrawer();}
                                else{mustLoginAlert(context);}},
                            icon: Icon(Icons.menu, size: 40, color: Colors.white,),),
                          IconButton(
                            onPressed: () {
                              if(FirebaseAuth.instance.currentUser != null){
                              Navigator.pushReplacementNamed(context, MyPurchase.id);}
                              else{mustLoginAlert(context);}},
                            icon: Icon(Icons.shopping_cart_outlined, size: 40, color: Colors.white,),),
                        ],),
                      Image.asset(
                        'images/logo with slogan.png', width: 200,),
                      Expanded(
                        child: Container(
                          child: Stack(alignment: Alignment.center, children: <Widget>[
                            AnimatedContainer(
                              duration: Duration(seconds: 3),
                              curve: Curves.ease,
                              height: mainIconHeight,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if(FirebaseAuth.instance.currentUser != null){
                                        Navigator.pushNamed(context, MapList.id);}
                                        else{mustLoginAlert(context);}},
                                      child: Image(image: AssetImage('images/map icon.png'),),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if(FirebaseAuth.instance.currentUser != null){
                                          Navigator.pushNamed(context, OffersList.id);}
                                        else{mustLoginAlert(context);}},
                                      child: Image(
                                        image: AssetImage('images/list icon.png'), height: 120.0, width: 120.0,),
                                    ),
                                  ],),
                              ),)
                          ]),
                        ),),
                    ],),),
                Container(
                    child: homeAdList()),
                SizedBox(height: 20,),
              ],),)
        ],),
    );
  }





  Widget homeAdList(){

    return StreamBuilder<QuerySnapshot>(
      stream: loadHomeAd(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelAddHomeAd>modelAddHomeAd=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);
            modelAddHomeAd.add(ModelAddHomeAd(
              homeAdName: data['homeAdName'],
              homeAdPhoto: data['homeAdPhoto'],
            ));
          }
          return Container(
              margin: EdgeInsets.only(left: 10,),
                height: 130,
                alignment: AlignmentDirectional.centerStart,
                color: Colors.transparent,
                child:ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index)=>
                      SizedBox(width: 15,),
                  itemCount:modelAddHomeAd.length,
                  itemBuilder: (context, index) =>
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          child: Image.network(modelAddHomeAd[index].homeAdPhoto,
                            width: MediaQuery.of(context).size.width*0.80, height:130, fit: BoxFit.fill,),),
                      ],),
                  ),)
                );
              } else {
                return Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('',style: TextStyle(color: Colors.grey,fontSize: 20.0,fontWeight:FontWeight.bold,)),
                      ]),
          );}},);
  }



  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> loadHomeAd() {
    return _firestore.collection('HomeAd').snapshots();
  }

  mustLoginAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('You must be logged in to use this feature',style: TextStyle(color: Colors.amber,fontSize: 18),maxLines: 2,textAlign: TextAlign.center,),
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
                child: Text("Login Now",
                  style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),),
              onPressed: () {Navigator.pushReplacementNamed(context, LoginScreen.id);},
            ),
            MaterialButton(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.7,
                height: 40,
                margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),border: Border.all(color: Colors.lightBlueAccent, width: 2)),
                child: Text("Not Now",
                  style: TextStyle(color: Colors.lightBlueAccent,fontSize: 16,),),),
                  onPressed: (){Navigator.pop(context);}),

          ],)
      ],);
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

}



// ______________________________________________________
//thaer (old CarouselSlider was used before list view)

// CarouselSlider(
// items: [
// GestureDetector(
// onTap: (){},
// child: ClipRRect(
// borderRadius: BorderRadius.all(Radius.circular(25)),
// child: Image(image: AssetImage('images/home ad.jpg'), height: 130.0, width: 300.0,fit: BoxFit.cover),
//
// ),
// ),
// GestureDetector(
// onTap: (){},
// child: ClipRRect(
// borderRadius: BorderRadius.all(Radius.circular(25)),
// child: Image(image: AssetImage('images/home ad.jpg'), height: 130.0, width: 300.0,fit: BoxFit.cover),
//
// ),
// ),
// GestureDetector(
// onTap: (){},
// child: ClipRRect(
// borderRadius: BorderRadius.all(Radius.circular(25)),
// child: Image(image: AssetImage('images/home ad.jpg'), height: 130.0, width: 300.0,fit: BoxFit.cover),
//
// ),
// ),
// ],
// options: CarouselOptions(
// height: 130.0,
// initialPage: 1,
// viewportFraction: 0.8,
// enableInfiniteScroll: true,
// reverse: false,
// autoPlay: true,
// autoPlayInterval:Duration(seconds:5),
// autoPlayAnimationDuration:Duration(seconds:1),
// autoPlayCurve: Curves.fastOutSlowIn,
// scrollDirection: Axis.horizontal,
// )),



// onTap: () {
// String specifyId = modelRestaurants[index].restaurantName;
// double lat = double.parse(modelRestaurants[index].secondOfferButtonText);
// double long = double.parse(modelRestaurants[index].secondOfferSellingPrice);
// _gotoLocation(lat, long);
// _initMarker(lat, long,specifyId);
// },