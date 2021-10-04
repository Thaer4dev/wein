import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/dash_board/purchaseDAshBoard.dart';

class UsersDashBoard extends StatefulWidget {
  static const String id = 'UsersDashBoard';

  @override
  _UsersDashBoardState createState() => _UsersDashBoardState();
}
class ModelUsers {
  String email;
  String mobile;
  String uid;

  ModelUsers({
    required this.email,
    required this.mobile,
    required this.uid,
  });
}

class _UsersDashBoardState extends State<UsersDashBoard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading:IconButton(
          onPressed: () {Navigator.pushNamed(context, DashBoard.id);},
          icon: Icon(Icons.arrow_back_outlined,),color: Colors.black,iconSize: 30,),
        title:Text('Users',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
        centerTitle: true,),

      body: Column(
        children: <Widget>[
          Container(
              width: double.infinity,height:50,color: Colors.grey[700],alignment: Alignment.center,
              child: Text('List of Home Ads',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold,),)),
          SizedBox(height: 15,),
          Expanded(
            child: Container(
                child: homeAdList()),
          ),

        ],
      ) ,
    );
  }

  Widget homeAdList(){

    return StreamBuilder<QuerySnapshot>(
      stream: loadUsers(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelUsers>modelUsers=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);
            modelUsers.add(ModelUsers(

              email: data['email'],
              mobile: data['mobile'],
              uid: data['uid'],



            ));
          }
          return ListView.separated(
              separatorBuilder: (context, index)=>
                  SizedBox(width: 0,),
              itemCount: modelUsers.length,
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () {Navigator.pushNamed(context,PurchaseDshBoard.id);},
                    onLongPress: (){
                      AlertDialog alert = AlertDialog(
                        title: Text('Do you want delete this user?',style: TextStyle(color: Colors.grey),),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(height: 40, width: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),color: Colors.red),
                                child: MaterialButton(
                                  onPressed: (){
                                    deleteUsers(modelUsers[index].uid);
                                    Navigator.pop(context);
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

                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(7),
                      padding: EdgeInsets.all(7),
                      decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.grey
                      ) ,
                      child:Row(
                        children: [
                          Container(
                            width: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('User ID',
                                  style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15,),overflow: TextOverflow.ellipsis,),
                                Text('Mobile',
                                  style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15,),overflow: TextOverflow.ellipsis,),
                                Text('Email',
                                  style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15,),maxLines: 2,overflow: TextOverflow.ellipsis,),

                              ],),
                          ),
                          Container(
                            width: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15,)),
                                Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15,)),
                                Text(':', style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15,)),

                              ],),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(modelUsers[index].uid,
                                    style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15,),overflow: TextOverflow.ellipsis,),
                                  Text(modelUsers[index].mobile,
                                    style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15,),overflow: TextOverflow.ellipsis,),
                                  Text(modelUsers[index].email,
                                    style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15,),overflow: TextOverflow.ellipsis,),

                                ],),
                            ),
                          ),
                        ],
                      ),
                    ),
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
  Stream<QuerySnapshot> loadUsers() {
    return _firestore.collection('users').snapshots();
  }

  deleteUsers(uuu) {
    _firestore.collection('users').doc(uuu).delete();
  }
}

