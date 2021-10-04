import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/dash_board/homeAd/add_home_ad.dart';
import 'package:wein/screens/ad_screen.dart';

class HomeAdDashBoard extends StatefulWidget {
  static const String id = 'HomeAdDashBoard';

  @override
  _HomeAdDashBoardState createState() => _HomeAdDashBoardState();
}


class _HomeAdDashBoardState extends State<HomeAdDashBoard> {

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
        title:Text('Home Ad',
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
          Divider(height: 10,color: Colors.grey.shade700,thickness: 8,),
          Container(
            width: double.infinity,
            height: 60.0,
            margin:EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10) ,
            decoration:BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.lightBlueAccent,) ,
            child: MaterialButton(
              onPressed: (){Navigator.pushNamed(context, AddHomeAd.id);},
              child: Text(
                'Add New home Ads',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            ),),

        ],
      ) ,
    );
  }

  Widget homeAdList(){

    return StreamBuilder<QuerySnapshot>(
      stream: loadHomeAd(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelAddHomeAd>modelAddHomeAd=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);
            modelAddHomeAd.add(ModelAddHomeAd(

              homeAdName: data['homeAdName'],
              homeAdPhoto: data['homeAdPhoto'],
             

            ));
          }
          return ListView.separated(
              separatorBuilder: (context, index)=>
                  SizedBox(width: 0,),
              itemCount: modelAddHomeAd.length,
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
                              child:Text(modelAddHomeAd[index].homeAdName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))),
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10.0),),
                              child: Image.network(modelAddHomeAd[index].homeAdPhoto,
                                width: 250,height:60,fit: BoxFit.fill,),),
                            Expanded(child: SizedBox(width: 10,)),
                            
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
                                              deleteHomeAd(modelAddHomeAd[index].homeAdName);
                                              Navigator.pushNamed(context, HomeAdDashBoard.id);
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
  Stream<QuerySnapshot> loadHomeAd() {
    return _firestore.collection('HomeAd').snapshots();
  }

  deleteHomeAd(www) {
    _firestore.collection('HomeAd').doc(www).delete();
  }
}

