import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/reviews/reviews_dash_board.dart';
import 'package:wein/screens/add_review.dart';
import 'package:intl/intl.dart';


class AddReviewAdmin extends StatefulWidget {
  static const String id = 'AddReviewAdmin';

  @override
  _AddReviewAdminState createState() => _AddReviewAdminState();
}
// class ModelAddReview {
//   String reviewId;
//   String restaurantName;
//   String userName;
//   String review;
//   String reviewDate;
//
//   ModelAddReview({
//     required this.reviewId,
//     required this.restaurantName,
//     required this.userName,
//     required this.review,
//     required this.reviewDate,
//   });
// }
var userNameController=TextEditingController();
var userReviewController=TextEditingController();
var restaurantNameController=TextEditingController();
var reviewDateController=TextEditingController();
final GlobalKey<FormState> _globalKeyReviews = GlobalKey<FormState>();

var date = DateFormat('dd/MMM/yy').format(DateTime.now());

class _AddReviewAdminState extends State<AddReviewAdmin> {
  @override


  Widget build(BuildContext context) {
    // ModelRestaurants? modelRestaurants = ModalRoute.of(context)!.settings.arguments as ModelRestaurants?;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Add Your Review', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),),
        centerTitle: true,
      ),
      body: Form(
        key: _globalKeyReviews,
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text('Should attention to the following:',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),),
                Text('1-Restaurant Name must be exactly the same',
                  style: TextStyle(color: Colors.red, fontSize: 12),),
                Text('2-Date must be entered in the form dd/Mmm/yy',
                  style: TextStyle(color: Colors.red, fontSize: 12),),
                Text('example 01/Mar/21',
                  style: TextStyle(color: Colors.red, fontSize: 12),),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    maxLength: 25,
                    controller: restaurantNameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {restaurantNameController.text = (value);},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'you must fill restaurant name';
                      }return null;
                    },
                    cursorColor: Colors.amber, cursorHeight: 30,
                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Restaurant Name',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber, width: 3.0),),
                      prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.amber,),),
                  ),),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    maxLength: 27,
                    controller: userNameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {userNameController.text = (value);},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'you must fill User Name';
                      }return null;
                    },
                    cursorColor: Colors.amber, cursorHeight: 30,
                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber, width: 3.0),),
                      prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.amber,),),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    maxLength: 130,
                    maxLines: 2,
                    controller: userReviewController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {userReviewController.text = (value);},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'you must fill your review';
                      }return null;
                    },
                    cursorColor: Colors.amber, cursorHeight: 30,
                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Your Review',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber, width: 3.0),),
                      prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.amber,),),
                  ),),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    maxLength: 9,
                    controller: reviewDateController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {reviewDateController.text = (value);},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'you must fill date';
                      }return null;
                    },
                    cursorColor: Colors.amber, cursorHeight: 30,
                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Date dd/Mmm/yy ',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber, width: 3.0),),
                      prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.amber,),),
                  ),),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.amber,
                    borderRadius: BorderRadius.circular(40.0), border: Border.all(color:Colors.lime,width: 0.5),),
                  child: MaterialButton(
                    child:
                    Text('Add Your Review',style: TextStyle(color: Colors.white,fontSize: 16,)),
                    onPressed: () async {
                      if (_globalKeyReviews.currentState!.validate()) {
                        // loadingAlert(context);
                        _globalKeyReviews.currentState!.save();

                        addReview(ModelAddReview(
                          reviewId: "",
                          restaurantName: restaurantNameController.text,
                          userName: userNameController.text,
                          review:userReviewController.text,
                          reviewDate:reviewDateController.text

                        ));
                        successAddAlert(context);
                        _globalKeyReviews.currentState!.reset();
                      }
                    },
                  ),),

              ],
            ),),
        ),
      ),

    );
  }
  successAddAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Thank You ,Your review has been added',style: TextStyle(color: Colors.grey),maxLines: 2,),
      actions: <Widget>[
        TextButton(
            child: Text('Done',style: TextStyle(color: Colors.blue[750],fontWeight: FontWeight.bold),),
            onPressed: (){Navigator.pushReplacementNamed(context, ReviewsDashBoard.id);}),
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addReview(ModelAddReview modelAddReview)async{
    await _firestore.collection('Reviews').add(
        {
          'restaurantName': modelAddReview.restaurantName,
          'userName' : modelAddReview.userName,
          'review' : modelAddReview.review,
          'reviewDate' : modelAddReview.reviewDate,

        });
  }

  Stream<QuerySnapshot> loadReviews() {
    return _firestore.collection('Reviews').snapshots();
  }

  deleteReview(vvv) {
    _firestore.collection('Reviews').doc(vvv).delete();
  }

}
