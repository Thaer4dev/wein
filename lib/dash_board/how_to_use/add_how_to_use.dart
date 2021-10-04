import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wein/dash_board/how_to_use/model_how_to_use.dart';
import 'package:wein/dash_board/how_to_use/store_how_to_use.dart';

class AddHowToUse extends StatefulWidget {
  static const String id = 'AddHowToUse';

  @override
  _AddHowToUseState createState() => _AddHowToUseState();
}

var titleController = TextEditingController();
var descriptionsController = TextEditingController();
var imageController = TextEditingController();
final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

class _AddHowToUseState extends State<AddHowToUse> {

 final _store = Store();



  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_image = File(pickedFile.path);}
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Add New Page', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),),
          centerTitle: true,
        ),
        body: Form(
          key: _globalKey,
          child: SingleChildScrollView(
              child: Padding(padding: const EdgeInsets.all(5.0),
                  child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){getImage();},
                              child: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height*0.45,
                                width: double.infinity,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                                child:
                                _image != null
                                    ?
                                Image.file(_image!, fit:BoxFit.contain,)
                                    :
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image_outlined,size: 60,color:Colors.lightBlueAccent,),
                                    SizedBox(height: 20,),
                                    Text('Click to select image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),)],),
                              ),
                            ),
                             SizedBox(height: 10,),
                             TextFormField(
                             maxLength: 30,
                             controller: titleController,
                             keyboardType: TextInputType.name,
                             onFieldSubmitted: (value) {titleController.text = (value);},
                             validator: (value) {
                               if (value!.isEmpty) {
                                 return 'you must fill the title';
                               }return null;
                             },
                             cursorColor: Colors.lightBlueAccent,
                             cursorHeight: 30,
                             style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                             decoration: InputDecoration(
                               labelText: 'Title',
                               labelStyle: TextStyle(color: Colors.grey),
                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                               prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                             ),
                             TextFormField(
                             maxLength: 220,
                             controller: descriptionsController,
                             keyboardType: TextInputType.name,
                             onFieldSubmitted: (value) {descriptionsController.text = (value);},
                             validator: (value) {
                               if (value!.isEmpty) {
                                 return 'you must fill the descriptions';
                               }return null;
                             },
                             cursorColor: Colors.lightBlueAccent,
                             cursorHeight: 30,
                             style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                             decoration: InputDecoration(
                               labelText: 'Descriptions',
                               labelStyle: TextStyle(color: Colors.grey),
                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                               prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                             ),
                             SizedBox(height: 20,),
                             Container(width: double.infinity, height: 60.0, color: Colors.lightBlueAccent,
                             child: MaterialButton(
                               onPressed: () async{
                                 if (_globalKey.currentState!.validate()& (_image != null) ) {
                                   _store.loadingAlert(context);
                                   _globalKey.currentState!.save();
                                   final imageName = basename(_image!.path.toString());
                                   var storageImage = FirebaseStorage.instance.ref().child('How to use/$imageName');
                                   var task = storageImage.putFile(_image!);
                                   var _imageUrl = await (await task).ref.getDownloadURL();
                                   _store.addHowtoUse(ModelHowToUse(
                                       htuId: "",
                                       title: titleController.text,
                                       descriptions: descriptionsController.text,
                                       image: _imageUrl.toString()));
                                   _store.successAddAlert(context);
                                   _globalKey.currentState!.reset();
                                 }else{
                                   _store.noSelectedImageAlert(context);}
                               },
                               child: Text('Add page', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),),),
                      ]),
    ),),)
        );
  }
}
