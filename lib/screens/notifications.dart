import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wein/dash_board/Notifications/model_notifications.dart';
import 'package:wein/dash_board/Notifications/store_notifications.dart';
import 'package:wein/screens/home.dart';

class Notifications extends StatefulWidget {
  static const String id = 'Notifications';

  @override
  _NotificationsState createState() => _NotificationsState();
}
class _NotificationsState extends State<Notifications> {




  void configureCallbacks(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
      print("on massage");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async{
      print('on Message Opened App');
    });

    FirebaseMessaging.onBackgroundMessage((message) async{
      // Navigator.pushNamed(context, Notifications.id);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Notifications()));
    });
  }

  @override
  void initState(){
    super.initState();
    configureCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.amber,
        leading:IconButton(
          onPressed: () {Navigator.pushReplacementNamed(context, Home.id);},
          icon: Icon(Icons.arrow_back_outlined,),color: Colors.black,iconSize: 30,),
        title:Text('Notifications',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
        centerTitle: true,),
      body: Column(
        children: <Widget>[
          Container(
              width: double.infinity,height:50,color: Colors.grey[700],alignment: Alignment.center,
              child: Text('List of Notifications',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold,),)),
          Expanded(
            child: Container(
                color: Colors.grey[300],
                // margin:EdgeInsets.only(left: 10,right: 10) ,
                child: notificationsList()),
          ),

        ],
      ) ,
    );
  }

  final _store = StoreNotification();
  Widget notificationsList(){

    return StreamBuilder<QuerySnapshot>(
      stream: _store.loadNotification(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelNotification>modelNotification=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);

            modelNotification.add(ModelNotification(
              notificationId:doc.id,
              title: data['title'],
              body: data['body'],
            ));
          }
          return ListView.separated(
            separatorBuilder: (context, index)=> SizedBox(height: 15,),padding: EdgeInsets.only(top: 15,bottom: 15),
            itemCount: modelNotification.length,
            itemBuilder: (context, index) =>
                Container(
                  height: 100,
                  width: double.infinity,
                  margin:EdgeInsets.only(left: 10,right: 10) ,
                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.white,) ,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                              margin:EdgeInsets.only(left: 15,top: 5) ,
                              child: Text(modelNotification[index].title,style: TextStyle(color: Colors.amber,fontSize: 14.0,fontWeight:FontWeight.bold,),overflow: TextOverflow.ellipsis))),
                      Expanded(
                        child: Container(
                            margin:EdgeInsets.only(left: 15,top: 5) ,
                            child: Text(modelNotification[index].body,style: TextStyle(color: Colors.grey,fontSize: 10.0,),textAlign: TextAlign.left,maxLines: 7,overflow: TextOverflow.ellipsis,)),
                      ),

                    ],
                  ),
                ),
          );
        } else {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Loading....',style: TextStyle(color: Colors.amber,fontSize: 20.0,fontWeight:FontWeight.bold,)),
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
              ]);
        }
      },
    );
  }

}