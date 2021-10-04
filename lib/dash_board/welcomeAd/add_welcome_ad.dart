import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wein/dash_board/welcomeAd/welcomeAd_dashBoard.dart';

class AddWelcomeAd extends StatefulWidget {
  static const String id = 'AddWelcomeAd';

  @override
  _AddWelcomeAdState createState() => _AddWelcomeAdState();
}
class ModelAddWelcomeAd {
  String welcomeAdName;
  String welcomeAdPhoto;
  String welcomeAdActiveStart;
  String welcomeAdActiveEnd;

  ModelAddWelcomeAd({
    required this.welcomeAdName,
    required this.welcomeAdPhoto,
    required this.welcomeAdActiveStart,
    required this.welcomeAdActiveEnd,
  });
}

class _AddWelcomeAdState extends State<AddWelcomeAd> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  var welcomeAdNameController = TextEditingController();
  var welcomeAdActiveStartController = TextEditingController();
  var welcomeAdActiveEndController = TextEditingController();

  File? _welcomeAdPhoto ;
  final pickerWelcomeAdPhoto = ImagePicker();
  Future getWelcomeAdPhoto() async {
    final pickedFile = await pickerWelcomeAdPhoto.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_welcomeAdPhoto = File(pickedFile.path);}
    });
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Add Welcome Ad',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
        centerTitle: true,
      ),
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
          padding:EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                child:
                    GestureDetector(
                      onTap: (){getWelcomeAdPhoto();},
                      child: Container(
                        alignment: Alignment.center,
                        height: 300,
                        width: MediaQuery.of(context).size.width*0.45,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                        child:
                        _welcomeAdPhoto != null
                            ?
                        Image.file(_welcomeAdPhoto!, fit:BoxFit.fill,)
                            :
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_outlined,size: 90,color:Colors.lightBlueAccent,),
                            SizedBox(height: 19,),
                            Text('Click to add image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                      ),
                    ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                maxLength: 1,
                controller: welcomeAdNameController,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {welcomeAdNameController.text = (value);},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'you must fill Ad Name';
                  }return null;
                },
                cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'Ad Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 2),),
                child: Column(
                  children: [
                    Text ('Active Time',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            maxLength: 2,
                            controller: welcomeAdActiveStartController,
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (value) {welcomeAdActiveStartController.text = (value);},
                            validator: (value) {
                              if (value!.length<2) {
                                return 'you must fill 2 digits';
                              }return null;
                            },
                            cursorColor: Colors.lightBlueAccent,
                            cursorHeight: 20,
                            style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              labelText: 'Start',
                              labelStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                              prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Flexible(
                          child: TextFormField(
                            maxLength: 2,
                            controller: welcomeAdActiveEndController,
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (value) {welcomeAdActiveEndController.text = (value);},
                            validator: (value) {
                              if (value!.length<2) {
                                return 'you must fill 2 digits';
                              }return null;
                            },
                            cursorColor: Colors.lightBlueAccent,
                            cursorHeight: 20,
                            style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              labelText: 'End',
                              labelStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                              prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                          ),
                        ),

                      ],),
                  ],
                ),),
              SizedBox(height: 20,),

              Container(
                width: double.infinity, height: 50.0,
                margin: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0), color: Colors.lightBlueAccent,),
                child: MaterialButton(
                  child: Text('Add Welcome Ad', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    onPressed: () async {
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();

                        final welcomeAdImageName = basename(_welcomeAdPhoto!.path.toString());
                        var welcomeAdStorageImage = FirebaseStorage.instance.ref().child('Restaurants/$welcomeAdImageName');
                        var welcomeAdStorageImageTask = welcomeAdStorageImage.putFile(_welcomeAdPhoto!);
                        var _welcomeAdImageUrl = await (await welcomeAdStorageImageTask).ref.getDownloadURL();

                        addWelcomeAd(ModelAddWelcomeAd(
                          welcomeAdName: welcomeAdNameController.text,
                          welcomeAdPhoto: _welcomeAdImageUrl.toString(),
                          welcomeAdActiveStart: welcomeAdActiveStartController.text,
                          welcomeAdActiveEnd: welcomeAdActiveEndController.text,

                        ));
                        successAddAlert(context);
                        _globalKey.currentState!.reset();
                      }
                    }

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }



  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addWelcomeAd(ModelAddWelcomeAd modelAddWelcomeAd)async{
    await _firestore.collection('WelcomeAd').doc(modelAddWelcomeAd.welcomeAdName).set(
        {
          'welcomeAdName': modelAddWelcomeAd.welcomeAdName,
          'welcomeAdPhoto' : modelAddWelcomeAd.welcomeAdPhoto,
          'welcomeAdActiveStart' : modelAddWelcomeAd.welcomeAdActiveStart,
          'welcomeAdActiveEnd' : modelAddWelcomeAd.welcomeAdActiveEnd,

        });
  }

  Stream<QuerySnapshot> loadWelcomeAd() {
    return _firestore.collection('WelcomeAd').snapshots();
  }

  deleteWelcomeAd(www) {
    _firestore.collection('WelcomeAd').doc(www).delete();
  }

    successAddAlert(BuildContext context) {
      AlertDialog alert = AlertDialog(
        title: Text('Added successfully',style: TextStyle(color: Colors.lightBlueAccent),),
        actions: <Widget>[
          Row(
            children: [
              TextButton(
                  child: Text('Done',style: TextStyle(color: Colors.blue[750],fontWeight: FontWeight.bold),),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, WelcomeAdDashBoard.id);
                  }),
            ],
          )
        ],
      );
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

  }
