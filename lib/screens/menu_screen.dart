import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/add_menu/model_menu.dart';

class MenuScreen extends StatefulWidget {
  static const String id = 'MenuScreen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // leading:IconButton(
          //   onPressed: () {Navigator.pushNamed(context, RestaurantScreen2.id);},
          //   icon: Icon(Icons.arrow_back_outlined,),color: Colors.black,iconSize: 30,),
          title: Text(modelMenu!.restaurantName + ' Menu',
            style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16), overflow: TextOverflow.ellipsis,),
          centerTitle: true,
        ),
        body:

        Column(
          children:<Widget> [
            SizedBox(height: 10,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2=="" &&
                modelMenu.menuPhoto3=="" &&
                modelMenu.menuPhoto4=="" &&
                modelMenu.menuPhoto5=="" &&
                modelMenu.menuPhoto6=="" &&
                modelMenu.menuPhoto7=="" &&
                modelMenu.menuPhoto8=="" &&
                modelMenu.menuPhoto9=="" &&
                modelMenu.menuPhoto10=="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu1Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3=="" &&
                modelMenu.menuPhoto4=="" &&
                modelMenu.menuPhoto5=="" &&
                modelMenu.menuPhoto6=="" &&
                modelMenu.menuPhoto7=="" &&
                modelMenu.menuPhoto8=="" &&
                modelMenu.menuPhoto9=="" &&
                modelMenu.menuPhoto10=="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu2Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4=="" &&
                modelMenu.menuPhoto5=="" &&
                modelMenu.menuPhoto6=="" &&
                modelMenu.menuPhoto7=="" &&
                modelMenu.menuPhoto8=="" &&
                modelMenu.menuPhoto9=="" &&
                modelMenu.menuPhoto10=="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu3Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5=="" &&
                modelMenu.menuPhoto6=="" &&
                modelMenu.menuPhoto7=="" &&
                modelMenu.menuPhoto8=="" &&
                modelMenu.menuPhoto9=="" &&
                modelMenu.menuPhoto10=="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu4Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6=="" &&
                modelMenu.menuPhoto7=="" &&
                modelMenu.menuPhoto8=="" &&
                modelMenu.menuPhoto9=="" &&
                modelMenu.menuPhoto10=="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu5Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7=="" &&
                modelMenu.menuPhoto8=="" &&
                modelMenu.menuPhoto9=="" &&
                modelMenu.menuPhoto10=="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu6Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7!="" &&
                modelMenu.menuPhoto8=="" &&
                modelMenu.menuPhoto9=="" &&
                modelMenu.menuPhoto10=="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu7Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7!="" &&
                modelMenu.menuPhoto8!="" &&
                modelMenu.menuPhoto9=="" &&
                modelMenu.menuPhoto10=="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu8Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7!="" &&
                modelMenu.menuPhoto8!="" &&
                modelMenu.menuPhoto9!="" &&
                modelMenu.menuPhoto10=="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu9Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7!="" &&
                modelMenu.menuPhoto8!="" &&
                modelMenu.menuPhoto9!="" &&
                modelMenu.menuPhoto10!="" &&
                modelMenu.menuPhoto11=="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu10Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7!="" &&
                modelMenu.menuPhoto8!="" &&
                modelMenu.menuPhoto9!="" &&
                modelMenu.menuPhoto10!="" &&
                modelMenu.menuPhoto11!="" &&
                modelMenu.menuPhoto12=="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu11Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7!="" &&
                modelMenu.menuPhoto8!="" &&
                modelMenu.menuPhoto9!="" &&
                modelMenu.menuPhoto10!="" &&
                modelMenu.menuPhoto11!="" &&
                modelMenu.menuPhoto12!="" &&
                modelMenu.menuPhoto13=="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu12Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7!="" &&
                modelMenu.menuPhoto8!="" &&
                modelMenu.menuPhoto9!="" &&
                modelMenu.menuPhoto10!="" &&
                modelMenu.menuPhoto11!="" &&
                modelMenu.menuPhoto12!="" &&
                modelMenu.menuPhoto13!="" &&
                modelMenu.menuPhoto14=="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu13Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7!="" &&
                modelMenu.menuPhoto8!="" &&
                modelMenu.menuPhoto9!="" &&
                modelMenu.menuPhoto10!="" &&
                modelMenu.menuPhoto11!="" &&
                modelMenu.menuPhoto12!="" &&
                modelMenu.menuPhoto13!="" &&
                modelMenu.menuPhoto14!="" &&
                modelMenu.menuPhoto15=="" ?
            Container(
              child: menu14Page(),):SizedBox(width: 0,),
            modelMenu.menuPhoto1!="" &&
                modelMenu.menuPhoto2!="" &&
                modelMenu.menuPhoto3!="" &&
                modelMenu.menuPhoto4!="" &&
                modelMenu.menuPhoto5!="" &&
                modelMenu.menuPhoto6!="" &&
                modelMenu.menuPhoto7!="" &&
                modelMenu.menuPhoto8!="" &&
                modelMenu.menuPhoto9!="" &&
                modelMenu.menuPhoto10!="" &&
                modelMenu.menuPhoto11!="" &&
                modelMenu.menuPhoto12!="" &&
                modelMenu.menuPhoto13!="" &&
                modelMenu.menuPhoto14!="" &&
                modelMenu.menuPhoto15!="" ?
            Container(
              child: menu15Page(),):SizedBox(width: 0,),

            // modelMenu.menuPhoto2!="" && modelMenu.menuPhoto3!=""?
            // Container(
            //   child: menu3Page(),):SizedBox(width: 0,),




          ],
        )
    );
  }


  Widget menu1Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu2Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu3Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu4Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu5Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu6Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu7Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto7,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu8Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto7,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto8,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu9Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto7,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto8,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto9,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu10Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto7,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto8,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto9,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto10,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu11Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto7,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto8,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto9,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto10,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto11,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu12Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto7,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto8,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto9,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto10,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto11,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto12,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu13Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto7,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto8,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto9,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto10,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto11,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto12,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto13,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu14Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto7,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto8,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto9,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto10,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto11,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto12,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto13,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto14,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),

        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
  Widget menu15Page() {
    ModelMenu? modelMenu = ModalRoute.of(context)!.settings.arguments as ModelMenu?;
    return CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu!.menuPhoto1,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto2,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto3,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto4,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto5,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto6,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto7,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto8,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto9,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto10,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto11,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto12,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto13,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto14,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.network(modelMenu.menuPhoto15,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),),
        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.85,
          initialPage: 0,
          viewportFraction: 0.97,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }



}