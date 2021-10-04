import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/dash_board/reviews/add_review_admin.dart';
import 'package:wein/screens/add_review.dart';
import 'package:wein/screens/offers_list.dart';

class ReviewsDashBoard extends StatefulWidget {
  static const String id = 'ReviewsDashBoard';

  @override
  _ReviewsDashBoardState createState() => _ReviewsDashBoardState();
}


class _ReviewsDashBoardState extends State<ReviewsDashBoard> {



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
          onPressed: (){Navigator.pushNamed(context, OffersList.id);},
        )],
        title:Text('Manage Reviews',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
        centerTitle: true,),

      body: Column(
        children: <Widget>[
          Container(
              width: double.infinity,height:50,color: Colors.grey[700],alignment: Alignment.center,
              child: Text('List of Reviews',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold,),)),
          Expanded(
            child: Container(
                // margin:EdgeInsets.only(left: 10,right: 10) ,
                child: reviewList()),
          ),
          Divider(height: 10,color: Colors.grey.shade700,thickness: 8,),
          Container(
            width: double.infinity,
            height: 60.0,
            margin:EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10) ,
            decoration:BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.lightBlueAccent,) ,
            child: MaterialButton(
              onPressed: (){Navigator.pushNamed(context, AddReviewAdmin.id);},
              child: Text(
                'Add Admin Review',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            ),),

        ],
      ) ,
    );
  }

  Widget reviewList(){

    return StreamBuilder<QuerySnapshot>(
      stream: loadReviews(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelAddReview>modelAddReview=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);
            modelAddReview.add(ModelAddReview(

              reviewId:doc.id,
              restaurantName: data['restaurantName'],
              userName: data['userName'],
              review: data['review'],
              reviewDate: data['reviewDate'],
            ));
          }
          return ListView.separated(
            separatorBuilder: (context, index)=>
                SizedBox(width: 0,),
            itemCount: modelAddReview.length,
            itemBuilder: (context, index) =>
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(modelAddReview[index].restaurantName,style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 14))),
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
                                        deleteReview(modelAddReview[index].reviewId);
                                        Navigator.pushNamed(context, ReviewsDashBoard.id);
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
                  Row(
                    children: [
                      Expanded(child: Text(modelAddReview[index].userName,style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14))),
                      Text(modelAddReview[index].reviewDate,style: TextStyle(color: Colors.amber,fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Text(modelAddReview[index].review,
                    style: TextStyle(color: Colors.grey,fontSize: 13,),maxLines: 3,),
                  Divider(height: 1,color: Colors.grey,thickness: 0.3,),


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
  Stream<QuerySnapshot> loadReviews() {
    return _firestore.collection('Reviews').snapshots();
  }

  deleteReview(vvv) {
    _firestore.collection('Reviews').doc(vvv).delete();
  }
}
