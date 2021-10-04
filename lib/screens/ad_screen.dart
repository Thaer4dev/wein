import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/screens/On_Boarding.dart';
import 'package:wein/dash_board/welcomeAd/add_welcome_ad.dart';
import 'package:wein/screens/skipAd.dart';


class AdScreen extends StatefulWidget {
  static const String id = 'AdScreen';
  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  double mainIconHeight = 0;
  var s = 'skip in 5 s';
  double w = 0;
  bool start = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 5000)).then((value) => setState(() {
      start = true;
    }));

    Future.delayed(Duration(milliseconds: 10000)).then((value) => setState(() {
      mainIconHeight = 120;
      s = 'skip';
      w = 160;
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: welcomeAdList()),
          ),
          //  Positioned(
          //  bottom: MediaQuery.of(context).padding.bottom,
          //  right: MediaQuery.of(context).padding.right,
          //  child:
          //   Container(
          //    child: SkipAd(),
          // ),),

            Stack(
              children: [

                Row(
                  children: [

                    Expanded(child: SizedBox(width: 1,)),
                    start == true ?
                    Container(
                      child: SkipAd(),
                    ):SizedBox(width: 1,),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: SizedBox(width: 1,)),
                    Container(
                      color: Colors.lightBlue,
                      width:w,
                      height: 42,
                      margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                      child: ElevatedButton(
                          child: Text('Skip',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, OnBoarding.id);
                          }
                      ),
                    ),
                  ],
                ),

              ],
            ),


        ],
      ) ,
    );
  }
  var time = DateTime.now().hour;
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
            padding: EdgeInsets.zero,
              separatorBuilder: (context, index)=>
                  SizedBox(width: 0,),
              itemCount:modelAddWelcomeAd.length,
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>

              int.parse(modelAddWelcomeAd[index].welcomeAdActiveStart) < time && int.parse(modelAddWelcomeAd[index].welcomeAdActiveEnd) > time ?
              Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: Image.network(modelAddWelcomeAd[index].welcomeAdPhoto,
                            width: MediaQuery.of(context).size.width,
                            height:MediaQuery.of(context).size.height*0.95,
                            fit: BoxFit.fill,),),
                      ],),
                  ):SizedBox(width: 0,),
          );
        } else {
          return Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome in Wein App',style: TextStyle(color: Colors.grey,fontSize: 20.0,fontWeight:FontWeight.bold,)),
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





  // Widget welcomeAdList(){
  //
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: loadWelcomeAd2(),
  //     builder: (context,snapshot) {
  //       if (snapshot.hasData) {
  //         List<ModelAddWelcomeAd>modelAddWelcomeAd=[];
  //         for (var doc in snapshot.data!.docs) {
  //           var data = (doc.data() as dynamic);
  //           modelAddWelcomeAd.add(ModelAddWelcomeAd(
  //
  //             welcomeAdName: data['welcomeAdName'],
  //             welcomeAdPhoto: data['welcomeAdPhoto'],
  //             welcomeAdActiveStart: data['welcomeAdActiveStart'],
  //             welcomeAdActiveEnd: data['welcomeAdActiveEnd'],
  //
  //           ));
  //         }
  //         return ListView.separated(
  //             separatorBuilder: (context, index)=>
  //                 SizedBox(width: 0,),
  //             itemCount: modelAddWelcomeAd.length,
  //             itemBuilder: (context, index) =>
  //                 Container(
  //                   child: Container(
  //                     child: Image.network(modelAddWelcomeAd[index].welcomeAdPhoto,
  //                       width: MediaQuery.of(context).size.width,
  //                       height:100,
  //                       // MediaQuery.of(context).size.height*0.85,
  //                       fit: BoxFit.fill,),
  //                   ),
  //                 )
  //
  //         );
  //       } else {
  //         return Container(
  //           height: 100,color: Colors.white,width: double.infinity,
  //           child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text('Loading....',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20.0,fontWeight:FontWeight.bold,)),
  //                 SizedBox(height: 20,),
  //                 Align(
  //                   alignment: Alignment.center,
  //                   child: SizedBox(width: 200, height: 10,
  //                     child:LinearProgressIndicator(
  //                       backgroundColor: Colors.grey.shade200,
  //                       valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor,),
  //
  //                     ),
  //                   ),
  //                 ),
  //               ]),
  //         );
  //       }
  //     },
  //   );
  // }
  //
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   Stream<QuerySnapshot> loadWelcomeAd2() {
  //   return _firestore.collection('WelcomeAd').snapshots();
  //   }
  //

//   Widget welcomeAdList1(){
//
//     return StreamBuilder<QuerySnapshot>(
//       stream: loadWelcomeAd(),
//       builder: (context,snapshot) {
//         if (snapshot.hasData) {
//           List<ModelAddWelcomeAd>modelAddWelcomeAd=[];
//           for (var doc in snapshot.data!.docs) {
//             var data = (doc.data() as dynamic);
//             modelAddWelcomeAd.add(ModelAddWelcomeAd(
//
//               welcomeAdName: data['welcomeAdName'],
//               welcomeAdPhoto: data['welcomeAdPhoto'],
//               welcomeAdActiveStart: data['welcomeAdActiveStart'],
//               welcomeAdActiveEnd: data['welcomeAdActiveEnd'],
//
//             ));
//           }
//           return ListView.separated(
//               separatorBuilder: (context, index)=>
//                   SizedBox(width: 0,),
//               itemCount: modelAddWelcomeAd.length,
//               itemBuilder: (context, index) =>
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(child: Text(modelAddWelcomeAd[index].welcomeAdName,style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 20))),
//                             IconButton(
//                               onPressed: (){
//                                 AlertDialog alert = AlertDialog(
//                                   title: Text('Do you want delete this review?',style: TextStyle(color: Colors.grey),),
//                                   actions: <Widget>[
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Container(height: 40, width: 140,
//                                           decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.all(Radius.circular(15.0)),color: Colors.red),
//                                           child: MaterialButton(
//                                             onPressed: (){
//                                               deleteWelcomeAd(modelAddWelcomeAd[index].welcomeAdName);
//                                               Navigator.pushNamed(context, WelcomeAdDashBoard.id);
//                                             },
//                                             child: Text('Delete', style: TextStyle(color: Colors.white,
//                                                 fontSize: 16, fontWeight: FontWeight.bold),),),
//                                         ),
//
//                                         TextButton(
//                                             child: Text('Cancel',style: TextStyle(color: Colors.grey,fontSize: 16)),
//                                             onPressed: (){Navigator.pop(context);}),
//                                       ],
//                                     )
//                                   ],
//                                 );
//                                 showDialog(
//                                     barrierDismissible: true,
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return alert;
//                                     });
//                               },
//                               icon: Icon(Icons.delete_outlined,color: Colors.red[600],size: 30,
//                               ),),
//
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.all(Radius.circular(10.0),),
//                               child: Image.network(modelAddWelcomeAd[index].welcomeAdPhoto,
//                                 width: 60,height:60,fit: BoxFit.fill,),),
//                             SizedBox(width: 10,),
//                             Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text('Start :  ',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14)),
//                                     Text(modelAddWelcomeAd[index].welcomeAdActiveStart,style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14)),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text('End :  ',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14)),
//                                     Text(modelAddWelcomeAd[index].welcomeAdActiveEnd,style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14)),
//                                   ],
//                                 ),
//
//                               ],
//                             ),
//                           ],
//                         ),
//                         Divider(height: 1,color: Colors.grey,thickness: 0.3,),
//
//
//                       ],),
//                   )
//
//           );
//         } else {
//           return Container(
//             height: 100,color: Colors.white,width: double.infinity,
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Loading....',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20.0,fontWeight:FontWeight.bold,)),
//                   SizedBox(height: 20,),
//                   Align(
//                     alignment: Alignment.center,
//                     child: SizedBox(width: 200, height: 10,
//                       child:LinearProgressIndicator(
//                         backgroundColor: Colors.grey.shade200,
//                         valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor,),
//
//                       ),
//                     ),
//                   ),
//                 ]),
//           );
//         }
//       },
//     );
//   }
//
//
//
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Stream<QuerySnapshot> loadWelcomeAd() {
//     return _firestore.collection('WelcomeAd').snapshots();
//   }
//
//   deleteWelcomeAd(www) {
//     _firestore.collection('WelcomeAd').doc(www).delete();
//   }
// }



