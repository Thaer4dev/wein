import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/dash_board/how_to_use/add_how_to_use.dart';
import 'package:wein/screens/On_Boarding.dart';
import 'package:wein/dash_board/how_to_use/model_how_to_use.dart';
import 'package:wein/dash_board/how_to_use/store_how_to_use.dart';

class HowToUse extends StatefulWidget {
  static const String id = 'HowToUse';




  @override
  _HowToUseState createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar:AppBar(
          backgroundColor: Colors.lightBlueAccent,
        leading:IconButton(
          onPressed: () {Navigator.pushNamed(context, DashBoard.id);},
          icon: Icon(Icons.arrow_back_outlined,),color: Colors.black,iconSize: 30,),

        title:Text('How To Use',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
          centerTitle: true,
          actions:[IconButton(
            icon: Icon(Icons.login_outlined, size: 30,color: Colors.black,),
            onPressed: (){Navigator.pushReplacementNamed(context, OnBoarding.id);},
          )],),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text('List of how to use pages',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold,),),
          SizedBox(height: 20,),
          Expanded(
            child: Container(
                color: Colors.grey[300],
                // margin:EdgeInsets.only(left: 10,right: 10) ,
                child: howToUsePagesList()),
          ),
          Container(
            width: double.infinity,
            height: 60.0,
            margin:EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10) ,
            decoration:BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.lightBlueAccent,) ,
            child: MaterialButton(
              onPressed: (){Navigator.pushNamed(context, AddHowToUse.id);},
              child: Text(
                'Add New Page',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            ),),
        ],
      ) ,
    );
  }
}
final _store = Store();
Widget howToUsePagesList(){

  return StreamBuilder<QuerySnapshot>(
    stream: _store.loadHowToUse(),
    builder: (context,snapshot) {
      if (snapshot.hasData) {
        List<ModelHowToUse>modelHowToUse=[];
        for (var doc in snapshot.data!.docs) {
          var data = (doc.data() as dynamic);

          modelHowToUse.add(ModelHowToUse(
            htuId:doc.id,
            title: data['Title'],
            descriptions: data['Descriptions'],
            image: data['Image'],
          ));
        }
        return ListView.separated(
          separatorBuilder: (context, index)=> SizedBox(height: 15,),padding: EdgeInsets.only(top: 15,bottom: 15),
          itemCount: modelHowToUse.length,
          itemBuilder: (context, index) =>
              Container(
                height: 180,
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
                                child: Text(modelHowToUse[index].title,style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20.0,fontWeight:FontWeight.bold,),overflow: TextOverflow.ellipsis))),
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
                                            _store.deleteHowToUse(modelHowToUse[index].htuId);
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

                            // _store.deleteHowToUse(modelHowToUse[index].htuId);

                            icon: Icon(Icons.cancel_outlined,color: Colors.red,size: 35,),),),

                      ],
                    ),
                    SizedBox(height: 5,),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          SizedBox(width: 10,),
                        Container(
                            decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                          child:Image(image: NetworkImage(modelHowToUse[index].image), width: 110,height:100,fit: BoxFit.cover,
                          ),),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Container(
                            // width: 110,height:100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin:EdgeInsets.only(right: 20) ,
                                      child: Text(modelHowToUse[index].descriptions,style: TextStyle(color: Colors.grey,fontSize: 12.0,),textAlign: TextAlign.left,maxLines: 7,overflow: TextOverflow.ellipsis,)),
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