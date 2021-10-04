import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wein/login_Auth/googleauth_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wein/screens/home.dart';
import 'package:wein/screens/login_phone/signin_phone.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;


class AuthUi extends StatefulWidget {

  @override
  _AuthUiState createState() => _AuthUiState();
}

class _AuthUiState extends State<AuthUi> {
  String error ='';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 300,height: 50,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                  onPressed: (){
                    Navigator.pushNamed(context, SigninPhoneScreen.id);},
                  color:Color(0xFFF1A220),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 4,),
                      Icon(Icons.phone_iphone,color: Colors.white,size: 40,),
                      SizedBox(width: 10,),
                      Text('Continue with Mobile No.',style: TextStyle(fontFamily:'Raleway',color: Colors.white,fontSize: 16,),),
                    ],)),
            ),
            SizedBox(height: 15,),
            Container(
              width: 300,height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  onPressed: () async{
                    User? user =await GoogleAuthentication.signInWithGoogle(context: context);

                    if(user!=null){
                      CollectionReference users = FirebaseFirestore.instance.collection('users');
                      final QuerySnapshot result = await users.where('uid', isEqualTo: user.uid).get();
                      List<DocumentSnapshot> document = result.docs;
                      if (document.length > 0) {Navigator.pushReplacementNamed(context, Home.id);
                      } else {await

                      FirebaseMessaging.instance.getToken().then((value) {
                        String? token = value;

                         _firestore.collection('users').doc(user.uid).set({
                        'uid': user.uid,
                        'mobile': '', // Stokes and Sons
                        'name': user.displayName,
                        'email': user.email,
                        'token':token,
                      }).then((value) {
                        print("User Added");
                        Navigator.pushReplacementNamed(context, Home.id);
                      });
                        });
                      }}},


                  color:Color(0xFFEA4335),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Image.asset('images/googlelogo.png',height: 45,width: 45,),
                      SizedBox(width: 18,),
                      Text('Continue with Google',style: TextStyle(fontFamily:'Raleway',color: Colors.white,fontSize: 16),),
                    ],)),
            ),
            SizedBox(height: 15,),
            Container(
              width: 300,height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  onPressed: () {
                    // AuthService().fbSignIn().then((value){Navigator.pushReplacementNamed(context, Home.id);});
                    },
                  color:Color(0xFFFF1778F2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('images/facebooklogo2.png',height: 45,width: 45,),
                      SizedBox(width: 14,),
                      Text('Continue with Facebook',style: TextStyle(fontFamily:'Raleway',color: Colors.white,fontSize: 16),),
                    ],)),
            ),
            SizedBox(height: 15,),
            // Container(
            //   width: 300,height: 50,
            //   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
            //   child: MaterialButton(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(30))
            //       ),
            //
            //       onPressed: (){},
            //       color:Colors.grey[800],
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           SizedBox(width: 6,),
            //           Image.asset('images/applelogo.png',height: 35,width: 35,),
            //           SizedBox(width: 27,),
            //           Text('Continue with Apple',style: TextStyle(fontFamily:'Raleway',color: Colors.white,fontSize: 16),),
            //         ],)),
            // ),
            SizedBox(height: 30,),
            Container(
              width: 300,height: 50,color:Colors.white,
              child: TextButton(
                onPressed: (){Navigator.pushNamed(context, Home.id);},
                child: Text('I Will login later',style: TextStyle(fontFamily:'Raleway',color: Colors.grey[500],fontSize: 20,fontWeight: FontWeight.bold),),
                  )),
            SizedBox(height: 20.0,),
            Text(error,style: TextStyle(color: Colors.red[800],fontSize: 12,fontWeight: FontWeight.bold),)





          ],
        ),
      ),
    );
  }
}
