import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/dash_board/welcomeAd/add_welcome_ad.dart';
import 'package:wein/screens/ad_screen.dart';

class WelcomeAdDashBoard extends StatefulWidget {
  static const String id = 'WelcomeDashBoard';

  @override
  _WelcomeAdDashBoardState createState() => _WelcomeAdDashBoardState();
}


class _WelcomeAdDashBoardState extends State<WelcomeAdDashBoard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading:IconButton(
          onPressed: () {Navigator.pushNamed(context, DashBoard.id);},
          icon: Icon(Icons.arrow_back_outlined,),color: Colors.black,iconSize: 30,),
        actions:[IconButton(
          icon: Icon(Icons.login_outlined, size: 30,color: Colors.black,),
          onPressed: (){Navigator.pushNamed(context, AdScreen.id);},
        )],
        title:Text('Welcome Ad',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
        centerTitle: true,),

      body: Column(
        children: <Widget>[
          Container(
              width: double.infinity,height:50,color: Colors.grey[700],alignment: Alignment.center,
              child: Text('List of Welcome Ads',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold,),)),
          SizedBox(height: 15,),
          Expanded(
            child: Container(
                child: welcomeAdList()),
          ),
          Divider(height: 10,color: Colors.grey.shade700,thickness: 8,),
          Container(
            width: double.infinity,
            height: 60.0,
            margin:EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10) ,
            decoration:BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.lightBlueAccent,) ,
            child: MaterialButton(
              onPressed: (){Navigator.pushNamed(context, AddWelcomeAd.id);},
              child: Text(
                'Add New welcome Ads',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            ),),

        ],
      ) ,
    );
  }

  Widget welcomeAdList(){

    return StreamBuilder<QuerySnapshot>(
      stream: loadWelcomeAd(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelAddWelcomeAd>modelAddWelcomeAd=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);
            modelAddWelcomeAd.add(ModelAddWelcomeAd(

              welcomeAdName: data['welcomeAdName'],
              welcomeAdPhoto: data['welcomeAdPhoto'],
              welcomeAdActiveStart: data['welcomeAdActiveStart'],
              welcomeAdActiveEnd: data['welcomeAdActiveEnd'],

            ));
          }
          return ListView.separated(
              separatorBuilder: (context, index)=>
                  SizedBox(width: 0,),
              itemCount: modelAddWelcomeAd.length,
              itemBuilder: (context, index) =>
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40 ,width: 40,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.lightBlueAccent),
                              child:Text(modelAddWelcomeAd[index].welcomeAdName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))),
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10.0),),
                              child: Image.network(modelAddWelcomeAd[index].welcomeAdPhoto,
                                width: 60,height:60,fit: BoxFit.fill,),),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Ad starting appears',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14)),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('from : ',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14)),
                                      Text(modelAddWelcomeAd[index].welcomeAdActiveStart,style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14)),
                                      SizedBox(width: 5,),
                                      Text('to : ',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14)),
                                      Text(modelAddWelcomeAd[index].welcomeAdActiveEnd,style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14)),

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                AlertDialog alert = AlertDialog(
                                  title: Text('Do you want delete this review?',style: TextStyle(color: Colors.grey),),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(height: 40, width: 140,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(15.0)),color: Colors.red),
                                          child: MaterialButton(
                                            onPressed: (){
                                              deleteWelcomeAd(modelAddWelcomeAd[index].welcomeAdName);
                                              Navigator.pushNamed(context, WelcomeAdDashBoard.id);
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
                              icon: Icon(Icons.delete_outlined,color: Colors.red[600],size: 30,
                              ),),
                          ],
                        ),
                        Divider(height: 20 ,color: Colors.grey,thickness: 1,),


                      ],),
                  )

          );
        } else {
          return Container(
            height: 100,color: Colors.white,width: double.infinity,
            child: Column(
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
                ]),
          );
        }
      },
    );
  }



  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> loadWelcomeAd() {
    return _firestore.collection('WelcomeAd').snapshots();
  }

  deleteWelcomeAd(www) {
    _firestore.collection('WelcomeAd').doc(www).delete();
  }
}

