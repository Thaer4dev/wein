
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/screens/home.dart';
import 'package:wein/screens/login_phone/signin_phone.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class OTPScreen extends StatefulWidget {

  final String phoneWithCountryCode,verId;
  OTPScreen({required this.phoneWithCountryCode, required this.verId});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}
class _OTPScreenState extends State<OTPScreen> {

  bool _loading = false;
  String error ='';
  bool _tryAgain = true;

  var _text1 = TextEditingController();
  var _text2 = TextEditingController();
  var _text3 = TextEditingController();
  var _text4 = TextEditingController();
  var _text5 = TextEditingController();
  var _text6 = TextEditingController();

  Future<void>phoneCredential(BuildContext context,String otp,)async{
    FirebaseAuth _auth =FirebaseAuth.instance;

    //Thaer Admin Sign in - to get phoneWithCountryCode.1
    var pwcc = widget.phoneWithCountryCode;

    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verId, smsCode: otp);
      final User? user = (await _auth.signInWithCredential(credential)).user;

      if(user!=null){
        await
        FirebaseMessaging.instance.getToken().then((value) {
          String? token = value;
        _firestore.collection('users').doc(user.uid)
            .set({
          'uid': user.uid,
          'mobile': user.phoneNumber,
          'email': '',
          'token':token,
        }).then((value) {Navigator.pushReplacementNamed(context, Home.id);});
        // .catchError((error) => print("Failed to add user: $error"));
        });}

      //Thaer Admin Sign in - to inset the Admin phone Ph number for going with admin user to Admin Pages.1
      if(pwcc=='+971999999999'){Navigator.pushReplacementNamed(context, DashBoard.id);}

      else {
        print('Login Failed');
        if (mounted) {
          setState(() {
            error = '';
          });}
      }

    }catch(e){
      print(e.toString());
      if (mounted) {
        setState(() {
          error = 'Invalid OTP , kindly check again';
        });}}

  }

  @override
  Widget build(BuildContext context) {

    final node =FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        title: Text('OTP Verification',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Container(
            child: Form(
              // key: formKey,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Kindly enter OTP code', style:TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold)),
                  SizedBox(height: 40.0,),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('We send a 6-digit OTO code to:',
                          style: TextStyle(color: Colors.grey[400],fontSize: 18,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Text(widget.phoneWithCountryCode,
                             style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2),),
                        SizedBox(height: 40.0,),
                        Row(
                          children: [
                            Expanded(
                             child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: _text1,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlueAccent ,width: 2.0),),
                              ),
                              cursorColor: Colors.lightBlueAccent,cursorHeight: 30,
                              style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20,fontWeight: FontWeight.bold),
                              onChanged: (value){
                                if(value.length==1){
                                  node.nextFocus();
                                }
                              },
                            ),
                          ),
                            SizedBox(width: 10.0,),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _text2,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlueAccent ,width: 2.0),),
                                ),
                                cursorColor: Colors.lightBlueAccent,cursorHeight: 30,
                                style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20,fontWeight: FontWeight.bold),
                                onChanged: (value){
                                  if(value.length==1){
                                    node.nextFocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _text3,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlueAccent ,width: 2.0),),
                                ),
                                cursorColor: Colors.lightBlueAccent,cursorHeight: 30,
                                style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20,fontWeight: FontWeight.bold),
                                onChanged: (value){
                                  if(value.length==1){
                                    node.nextFocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _text4,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlueAccent ,width: 2.0),),
                                ),
                                cursorColor: Colors.lightBlueAccent,cursorHeight: 30,
                                style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20,fontWeight: FontWeight.bold),
                                onChanged: (value){
                                  if(value.length==1){
                                    node.nextFocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _text5,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlueAccent ,width: 2.0),),
                                ),
                                cursorColor: Colors.lightBlueAccent,cursorHeight: 30,
                                style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20,fontWeight: FontWeight.bold),
                                onChanged: (value){
                                  if(value.length==1){
                                    node.nextFocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _text6,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlueAccent ,width: 2.0),),
                                ),
                                cursorColor: Colors.lightBlueAccent,cursorHeight: 30,
                                style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20,fontWeight: FontWeight.bold),
                                onChanged: (value){
                                  if(value.length==1){
                                    if(_text1.text.length==1)
                                    {if(_text2.text.length==1)
                                    {if(_text3.text.length==1)
                                    {if(_text4.text.length==1)
                                    {if(_text5.text.length==1){
                                     String _otp ='${_text1.text}${_text2.text}${_text3.text}${_text4.text}${_text5.text}${_text6.text}';
                                     setState(() {
                                       _loading=true;
                                       _tryAgain=false;
                                     });
                                     phoneCredential(context, _otp);
                                   }}}}}
                                  }else{

                                    setState(() {
                                      _loading=false;
                                      _tryAgain=true;
                                    });
                                  }
                                },
                              ),
                            ),
                        ],),
                        SizedBox(height: 20.0,),
                        if(_loading)
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 200,
                              height: 10,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey.shade200,
                                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor,)
                              ),
                            ),
                          ),
                        SizedBox(height: 20.0,),
                        Text(error,style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold),),
                        if(_tryAgain)
                        MaterialButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, SigninPhoneScreen.id);
                            },
                          child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),color: Colors.lightBlueAccent),
                            child: Text('Try Again', style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),),

                          ),
                        ),


                      ],
                    ),
                  )


                ],
              ),
            )
        ),
      ),
    );
  }
}
