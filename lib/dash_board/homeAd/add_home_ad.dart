import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wein/dash_board/homeAd/homeAd_dashBoard.dart';


class AddHomeAd extends StatefulWidget {
  static const String id = 'AddHomeAd';

  @override
  _AddHomeAdState createState() => _AddHomeAdState();
}
class ModelAddHomeAd {
  String homeAdName;
  String homeAdPhoto;


  ModelAddHomeAd({
    required this.homeAdName,
    required this.homeAdPhoto,

  });
}

class _AddHomeAdState extends State<AddHomeAd> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  var homeAdNameController = TextEditingController();


  File? _homeAdPhoto ;
  final pickerHomeAdPhoto = ImagePicker();
  Future getHomeAdPhoto() async {
    final pickedFile = await pickerHomeAdPhoto.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_homeAdPhoto = File(pickedFile.path);}
    });
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Add Home Ad',
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
                      onTap: (){getHomeAdPhoto();},
                      child: Container(
                        alignment: Alignment.center,
                        height: 120,
                        width: MediaQuery.of(context).size.width*0.9,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                        child:
                        _homeAdPhoto != null
                            ?
                        Image.file(_homeAdPhoto!, fit:BoxFit.fill,)
                            :
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_outlined,size: 60,color:Colors.lightBlueAccent,),
                            SizedBox(height: 10,),
                            Text('Click to add image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),)],),
                      ),
                    ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                maxLength: 1,
                controller: homeAdNameController,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {homeAdNameController.text = (value);},
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
              SizedBox(height: 20,),

              Container(
                width: double.infinity, height: 50.0,
                margin: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0), color: Colors.lightBlueAccent,),
                child: MaterialButton(
                  child: Text('Add Home Ad', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    onPressed: () async {
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();

                        final homeAdImageName = basename(_homeAdPhoto!.path.toString());
                        var homeAdStorageImage = FirebaseStorage.instance.ref().child('Restaurants/$homeAdImageName');
                        var homeAdStorageImageTask = homeAdStorageImage.putFile(_homeAdPhoto!);
                        var _homeAdImageUrl = await (await homeAdStorageImageTask).ref.getDownloadURL();

                        addHomeAd(ModelAddHomeAd(
                          homeAdName: homeAdNameController.text,
                          homeAdPhoto: _homeAdImageUrl.toString(),


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
  addHomeAd(ModelAddHomeAd modelAddHomeAd)async{
    await _firestore.collection('HomeAd').doc(modelAddHomeAd.homeAdName).set(
        {
          'homeAdName': modelAddHomeAd.homeAdName,
          'homeAdPhoto' : modelAddHomeAd.homeAdPhoto,


        });
  }

  Stream<QuerySnapshot> loadHomeAd() {
    return _firestore.collection('HomeAd').snapshots();
  }

  deleteHomeAd(www) {
    _firestore.collection('HomeAd').doc(www).delete();
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
                    Navigator.pushReplacementNamed(context, HomeAdDashBoard.id);
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
