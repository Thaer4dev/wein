import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/Notifications/add%20_notification.dart';
import 'package:wein/dash_board/Notifications/model_notifications.dart';
import 'package:wein/dash_board/Notifications/store_notifications.dart';
import 'package:wein/dash_board/dash_board.dart';

class NotificationsDashBoard extends StatefulWidget {
  static const String id = 'NotificationsDashBoard';

  @override
  _NotificationsDashBoardState createState() => _NotificationsDashBoardState();
}


class _NotificationsDashBoardState extends State<NotificationsDashBoard> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading:IconButton(
          onPressed: () {Navigator.pushNamed(context, DashBoard.id);},
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
          Container(
            width: double.infinity,
            height: 60.0,
            margin:EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10) ,
            decoration:BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.lightBlueAccent,) ,
            child: MaterialButton(
              onPressed: (){Navigator.pushNamed(context, AddNotification.id);},
              child: Text(
                'Add New Notification',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            ),),

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
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  margin:EdgeInsets.only(left: 15,top: 5) ,
                                  child: Text(modelNotification[index].title,style: TextStyle(color: Colors.lightBlueAccent,fontSize: 14.0,fontWeight:FontWeight.bold,),overflow: TextOverflow.ellipsis))),
                          Container(
                            width: 40,
                            alignment: Alignment.topCenter,
                            margin:EdgeInsets.only(right: 10) ,
                            child: IconButton(
                              onPressed: (){
                                AlertDialog alert = AlertDialog(
                                  title: Text('Do you want delete this item?',style: TextStyle(color: Colors.grey),),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(height: 40, width: 140,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(15.0)),color: Colors.red),
                                          child: MaterialButton(
                                            onPressed: (){
                                              _store.deleteNotification(modelNotification[index].notificationId);
                                              Navigator.pushNamed(context, NotificationsDashBoard.id);
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

                              // _store.deleteNotification(modelNotification[index].htuId);

                              icon: Icon(Icons.cancel_outlined,color: Colors.red,size: 35,),),),

                        ],
                      ),

                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                // width: 110,height:100,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin:EdgeInsets.only(right: 20) ,
                                          child: Text(modelNotification[index].body,style: TextStyle(color: Colors.grey,fontSize: 10.0,),textAlign: TextAlign.left,maxLines: 7,overflow: TextOverflow.ellipsis,)),
                                    ]),
                              ),
                            ),
                          ],),
                      ),
                    ],
                  ),
                ),
          );
        } else {
          return Column(
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
              ]);
        }
      },
    );
  }

}
