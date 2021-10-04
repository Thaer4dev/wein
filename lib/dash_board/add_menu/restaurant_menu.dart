import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wein/dash_board/add_menu/model_menu.dart';
import 'package:wein/dash_board/add_menu/store_menu.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';

class AddMenu extends StatefulWidget {
  static const String id = 'AddMenu';

  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {

  final _storeMenu = StoreMenu();


  File? _menuPhoto1 ;
  final pickerMenuPhoto1 = ImagePicker();
  Future getMenuPhoto1() async {
    final pickedFile = await pickerMenuPhoto1.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto1 = File(pickedFile.path);}
    });
  }

  File? _menuPhoto2 ;
  final pickerMenuPhoto2 = ImagePicker();
  Future getMenuPhoto2() async {
    final pickedFile = await pickerMenuPhoto2.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto2 = File(pickedFile.path);}
    });
  }

  File? _menuPhoto3 ;
  final pickerMenuPhoto3 = ImagePicker();
  Future getMenuPhoto3() async {
    final pickedFile = await pickerMenuPhoto3.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto3 = File(pickedFile.path);}
    });
  }

  File? _menuPhoto4 ;
  final pickerMenuPhoto4 = ImagePicker();
  Future getMenuPhoto4() async {
    final pickedFile = await pickerMenuPhoto4.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto4 = File(pickedFile.path);}
    });
  }

  File? _menuPhoto5 ;
  final pickerMenuPhoto5 = ImagePicker();
  Future getMenuPhoto5() async {
    final pickedFile = await pickerMenuPhoto5.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto5 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto6 ;
  final pickerMenuPhoto6 = ImagePicker();
  Future getMenuPhoto6() async {
    final pickedFile = await pickerMenuPhoto6.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto6 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto7 ;
  final pickerMenuPhoto7 = ImagePicker();
  Future getMenuPhoto7() async {
    final pickedFile = await pickerMenuPhoto7.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto7 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto8 ;
  final pickerMenuPhoto8 = ImagePicker();
  Future getMenuPhoto8() async {
    final pickedFile = await pickerMenuPhoto8.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto8 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto9 ;
  final pickerMenuPhoto9 = ImagePicker();
  Future getMenuPhoto9() async {
    final pickedFile = await pickerMenuPhoto9.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto9 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto10 ;
  final pickerMenuPhoto10 = ImagePicker();
  Future getMenuPhoto10() async {
    final pickedFile = await pickerMenuPhoto10.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto10 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto11 ;
  final pickerMenuPhoto11 = ImagePicker();
  Future getMenuPhoto11() async {
    final pickedFile = await pickerMenuPhoto11.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto11 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto12 ;
  final pickerMenuPhoto12 = ImagePicker();
  Future getMenuPhoto12() async {
    final pickedFile = await pickerMenuPhoto12.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto12 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto13 ;
  final pickerMenuPhoto13 = ImagePicker();
  Future getMenuPhoto13() async {
    final pickedFile = await pickerMenuPhoto13.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto13 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto14 ;
  final pickerMenuPhoto14 = ImagePicker();
  Future getMenuPhoto14() async {
    final pickedFile = await pickerMenuPhoto14.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto14 = File(pickedFile.path);}
    });
  }
  File? _menuPhoto15 ;
  final pickerMenuPhoto15 = ImagePicker();
  Future getMenuPhoto15() async {
    final pickedFile = await pickerMenuPhoto15.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_menuPhoto15 = File(pickedFile.path);}
    });
  }
  
  

  var photo1 = false;
  var menuPhoto1 = '';
  var photo2 = false;
  var menuPhoto2 = '';
  var photo3 = false;
  var menuPhoto3 = '';
  var photo4 = false;
  var menuPhoto4 = '';
  var photo5 = false;
  var menuPhoto5 = '';
  var photo6 = false;
  var menuPhoto6 = '';
  var photo7 = false;
  var menuPhoto7 = '';
  var photo8 = false;
  var menuPhoto8 = '';
  var photo9 = false;
  var menuPhoto9 = '';
  var photo10 = false;
  var menuPhoto10 = '';
  var photo11 = false;
  var menuPhoto11 = '';
  var photo12 = false;
  var menuPhoto12 = '';
  var photo13 = false;
  var menuPhoto13 = '';
  var photo14 = false;
  var menuPhoto14 = '';
  var photo15 = false;
  var menuPhoto15 = '';


  @override
  Widget build(BuildContext context) {
    ModelRestaurants? modelRestaurants = ModalRoute.of(context)!.settings.arguments as ModelRestaurants?;
    
    var restaurantCode = modelRestaurants!.restaurantCode;
    var restaurantName = modelRestaurants.restaurantName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(modelRestaurants.restaurantName +' Menu',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Wrap(alignment: WrapAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){getMenuPhoto1();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto1 != null
                          ?
                      Image.file(_menuPhoto1!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ),
                  _menuPhoto1 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto2();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto2 != null
                          ?
                      Image.file(_menuPhoto2!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto2 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto3();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto3 != null
                          ?
                      Image.file(_menuPhoto3!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto3 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto4();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto4 != null
                          ?
                      Image.file(_menuPhoto4!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto4 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto5();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto5 != null
                          ?
                      Image.file(_menuPhoto5!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto5 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto6();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto6 != null
                          ?
                      Image.file(_menuPhoto6!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto6 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto7();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto7 != null
                          ?
                      Image.file(_menuPhoto7!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto7 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto8();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto8 != null
                          ?
                      Image.file(_menuPhoto8!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto8 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto9();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto9 != null
                          ?
                      Image.file(_menuPhoto9!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto9 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto10();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto10 != null
                          ?
                      Image.file(_menuPhoto10!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto10 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto11();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto11 != null
                          ?
                      Image.file(_menuPhoto11!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto11 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto12();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto12 != null
                          ?
                      Image.file(_menuPhoto12!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto12 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto13();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto13 != null
                          ?
                      Image.file(_menuPhoto13!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto13 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto14();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto14 != null
                          ?
                      Image.file(_menuPhoto14!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                  _menuPhoto14 != null ?
                  GestureDetector(
                    onTap: (){getMenuPhoto15();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: MediaQuery.of(context).size.width*0.45,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                      child:
                      _menuPhoto15 != null
                          ?
                      Image.file(_menuPhoto15!, fit:BoxFit.fill,)
                          :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                          SizedBox(height: 19,),
                          Text('Click to add new image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                    ),
                  ):SizedBox(height: 0,),
                ],),),
            Container(
              width: double.infinity, height: 50.0,
              margin: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0), color: Colors.lightBlueAccent,),
              child: MaterialButton(
                child: Text('Upload Restaurant Menu', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                onPressed: () async {

                  final menuPhoto1 = basename(_menuPhoto1!.path.toString());
                  var menuPhoto1StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto1');
                  var menuPhoto1Task = menuPhoto1StorageImage.putFile(_menuPhoto1!);
                  var _menuPhoto1Url = await (await menuPhoto1Task).ref.getDownloadURL();

                  if(_menuPhoto2 == null){
                    _storeMenu.addMenu(ModelMenu(

                    restaurantCode : restaurantCode,
                    restaurantName : restaurantName,
                    menuPhoto1 : _menuPhoto1Url.toString(),
                    menuPhoto2 : '',
                    menuPhoto3 : '',
                    menuPhoto4 : '',
                    menuPhoto5 : '',
                    menuPhoto6 : '',
                    menuPhoto7 : '',
                    menuPhoto8 : '',
                    menuPhoto9 : '',
                    menuPhoto10 : '',
                    menuPhoto11 : '',
                    menuPhoto12 : '',
                    menuPhoto13 : '',
                    menuPhoto14 : '',
                    menuPhoto15 : '',

                  ));
                  _storeMenu.loadingAlert(context);
                  _storeMenu.successAddAlert(context);}

                  final menuPhoto2 = basename(_menuPhoto2!.path.toString());
                  var menuPhoto2StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto2');
                  var menuPhoto2Task = menuPhoto2StorageImage.putFile(_menuPhoto2!);
                  var _menuPhoto2Url = await (await menuPhoto2Task).ref.getDownloadURL();

                  if(_menuPhoto3 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : '',
                      menuPhoto4 : '',
                      menuPhoto5 : '',
                      menuPhoto6 : '',
                      menuPhoto7 : '',
                      menuPhoto8 : '',
                      menuPhoto9 : '',
                      menuPhoto10 : '',
                      menuPhoto11 : '',
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}

                  final menuPhoto3 = basename(_menuPhoto3!.path.toString());
                  var menuPhoto3StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto3');
                  var menuPhoto3Task = menuPhoto3StorageImage.putFile(_menuPhoto3!);
                  var _menuPhoto3Url = await (await menuPhoto3Task).ref.getDownloadURL();

                  if(_menuPhoto4 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : '',
                      menuPhoto5 : '',
                      menuPhoto6 : '',
                      menuPhoto7 : '',
                      menuPhoto8 : '',
                      menuPhoto9 : '',
                      menuPhoto10 : '',
                      menuPhoto11 : '',
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}

                  final menuPhoto4 = basename(_menuPhoto4!.path.toString());
                  var menuPhoto4StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto4');
                  var menuPhoto4Task = menuPhoto4StorageImage.putFile(_menuPhoto4!);
                  var _menuPhoto4Url = await (await menuPhoto4Task).ref.getDownloadURL();

                  if(_menuPhoto5 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : '',
                      menuPhoto6 : '',
                      menuPhoto7 : '',
                      menuPhoto8 : '',
                      menuPhoto9 : '',
                      menuPhoto10 : '',
                      menuPhoto11 : '',
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto5 = basename(_menuPhoto5!.path.toString());
                  var menuPhoto5StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto5');
                  var menuPhoto5Task = menuPhoto5StorageImage.putFile(_menuPhoto5!);
                  var _menuPhoto5Url = await (await menuPhoto5Task).ref.getDownloadURL();

                  if(_menuPhoto6 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : '',
                      menuPhoto7 : '',
                      menuPhoto8 : '',
                      menuPhoto9 : '',
                      menuPhoto10 : '',
                      menuPhoto11 : '',
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto6 = basename(_menuPhoto6!.path.toString());
                  var menuPhoto6StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto6');
                  var menuPhoto6Task = menuPhoto6StorageImage.putFile(_menuPhoto6!);
                  var _menuPhoto6Url = await (await menuPhoto6Task).ref.getDownloadURL();

                  if(_menuPhoto7 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : '',
                      menuPhoto8 : '',
                      menuPhoto9 : '',
                      menuPhoto10 : '',
                      menuPhoto11 : '',
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto7 = basename(_menuPhoto7!.path.toString());
                  var menuPhoto7StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto7');
                  var menuPhoto7Task = menuPhoto7StorageImage.putFile(_menuPhoto7!);
                  var _menuPhoto7Url = await (await menuPhoto7Task).ref.getDownloadURL();

                  if(_menuPhoto8 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : _menuPhoto7Url.toString(),
                      menuPhoto8 : '',
                      menuPhoto9 : '',
                      menuPhoto10 : '',
                      menuPhoto11 : '',
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto8 = basename(_menuPhoto8!.path.toString());
                  var menuPhoto8StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto8');
                  var menuPhoto8Task = menuPhoto8StorageImage.putFile(_menuPhoto8!);
                  var _menuPhoto8Url = await (await menuPhoto8Task).ref.getDownloadURL();

                  if(_menuPhoto9 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : _menuPhoto7Url.toString(),
                      menuPhoto8 : _menuPhoto8Url.toString(),
                      menuPhoto9 : '',
                      menuPhoto10 : '',
                      menuPhoto11 : '',
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto9 = basename(_menuPhoto9!.path.toString());
                  var menuPhoto9StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto9');
                  var menuPhoto9Task = menuPhoto9StorageImage.putFile(_menuPhoto9!);
                  var _menuPhoto9Url = await (await menuPhoto9Task).ref.getDownloadURL();

                  if(_menuPhoto10 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : _menuPhoto7Url.toString(),
                      menuPhoto8 : _menuPhoto8Url.toString(),
                      menuPhoto9 : _menuPhoto9Url.toString(),
                      menuPhoto10 : '',
                      menuPhoto11 : '',
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}



                  final menuPhoto10 = basename(_menuPhoto10!.path.toString());
                  var menuPhoto10StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto10');
                  var menuPhoto10Task = menuPhoto10StorageImage.putFile(_menuPhoto10!);
                  var _menuPhoto10Url = await (await menuPhoto10Task).ref.getDownloadURL();

                  if(_menuPhoto11 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : _menuPhoto7Url.toString(),
                      menuPhoto8 : _menuPhoto8Url.toString(),
                      menuPhoto9 : _menuPhoto9Url.toString(),
                      menuPhoto10 : _menuPhoto10Url.toString(),
                      menuPhoto11 : '',
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto11 = basename(_menuPhoto11!.path.toString());
                  var menuPhoto11StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto11');
                  var menuPhoto11Task = menuPhoto11StorageImage.putFile(_menuPhoto11!);
                  var _menuPhoto11Url = await (await menuPhoto11Task).ref.getDownloadURL();

                  if(_menuPhoto12 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : _menuPhoto7Url.toString(),
                      menuPhoto8 : _menuPhoto8Url.toString(),
                      menuPhoto9 : _menuPhoto9Url.toString(),
                      menuPhoto10 : _menuPhoto10Url.toString(),
                      menuPhoto11 : _menuPhoto11Url.toString(),
                      menuPhoto12 : '',
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto12 = basename(_menuPhoto12!.path.toString());
                  var menuPhoto12StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto12');
                  var menuPhoto12Task = menuPhoto12StorageImage.putFile(_menuPhoto12!);
                  var _menuPhoto12Url = await (await menuPhoto12Task).ref.getDownloadURL();

                  if(_menuPhoto13 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : _menuPhoto7Url.toString(),
                      menuPhoto8 : _menuPhoto8Url.toString(),
                      menuPhoto9 : _menuPhoto9Url.toString(),
                      menuPhoto10 : _menuPhoto10Url.toString(),
                      menuPhoto11 : _menuPhoto11Url.toString(),
                      menuPhoto12 : _menuPhoto12Url.toString(),
                      menuPhoto13 : '',
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto13 = basename(_menuPhoto13!.path.toString());
                  var menuPhoto13StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto13');
                  var menuPhoto13Task = menuPhoto13StorageImage.putFile(_menuPhoto13!);
                  var _menuPhoto13Url = await (await menuPhoto13Task).ref.getDownloadURL();

                  if(_menuPhoto14 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : _menuPhoto7Url.toString(),
                      menuPhoto8 : _menuPhoto8Url.toString(),
                      menuPhoto9 : _menuPhoto9Url.toString(),
                      menuPhoto10 : _menuPhoto10Url.toString(),
                      menuPhoto11 : _menuPhoto11Url.toString(),
                      menuPhoto12 : _menuPhoto12Url.toString(),
                      menuPhoto13 : _menuPhoto13Url.toString(),
                      menuPhoto14 : '',
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto14 = basename(_menuPhoto14!.path.toString());
                  var menuPhoto14StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto14');
                  var menuPhoto14Task = menuPhoto14StorageImage.putFile(_menuPhoto14!);
                  var _menuPhoto14Url = await (await menuPhoto14Task).ref.getDownloadURL();

                  if(_menuPhoto15 == null){
                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : _menuPhoto7Url.toString(),
                      menuPhoto8 : _menuPhoto8Url.toString(),
                      menuPhoto9 : _menuPhoto9Url.toString(),
                      menuPhoto10 : _menuPhoto10Url.toString(),
                      menuPhoto11 : _menuPhoto11Url.toString(),
                      menuPhoto12 : _menuPhoto12Url.toString(),
                      menuPhoto13 : _menuPhoto13Url.toString(),
                      menuPhoto14 : _menuPhoto14Url.toString(),
                      menuPhoto15 : '',

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);}


                  final menuPhoto15 = basename(_menuPhoto15!.path.toString());
                  var menuPhoto15StorageImage = FirebaseStorage.instance.ref().child('Menus/$menuPhoto15');
                  var menuPhoto15Task = menuPhoto15StorageImage.putFile(_menuPhoto15!);
                  var _menuPhoto15Url = await (await menuPhoto15Task).ref.getDownloadURL();

                    _storeMenu.addMenu(ModelMenu(

                      restaurantCode : restaurantCode,
                      restaurantName : restaurantName,
                      menuPhoto1 : _menuPhoto1Url.toString(),
                      menuPhoto2 : _menuPhoto2Url.toString(),
                      menuPhoto3 : _menuPhoto3Url.toString(),
                      menuPhoto4 : _menuPhoto4Url.toString(),
                      menuPhoto5 : _menuPhoto5Url.toString(),
                      menuPhoto6 : _menuPhoto6Url.toString(),
                      menuPhoto7 : _menuPhoto7Url.toString(),
                      menuPhoto8 : _menuPhoto8Url.toString(),
                      menuPhoto9 : _menuPhoto9Url.toString(),
                      menuPhoto10 : _menuPhoto10Url.toString(),
                      menuPhoto11 : _menuPhoto11Url.toString(),
                      menuPhoto12 : _menuPhoto12Url.toString(),
                      menuPhoto13 : _menuPhoto13Url.toString(),
                      menuPhoto14 : _menuPhoto14Url.toString(),
                      menuPhoto15 : _menuPhoto15Url.toString(),

                    ));
                    _storeMenu.loadingAlert(context);
                    _storeMenu.successAddAlert(context);







                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
