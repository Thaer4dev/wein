import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wein/screens/home.dart';
import 'package:wein/screens/login_screen.dart';
import 'package:wein/dash_board/how_to_use/model_how_to_use.dart';
import 'package:wein/dash_board/how_to_use/store_how_to_use.dart';


class OnBoarding extends StatefulWidget {
  static const String id = 'OnBoarding';

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController = PageController();
  bool isLast = false;

  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else
            return StreamBuilder<QuerySnapshot>(
              stream: _store.loadHowToUse(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ModelHowToUse>modelHowToUse = [];
                  for (var doc in snapshot.data!.docs) {
                    var data = (doc.data() as dynamic);

                    modelHowToUse.add(ModelHowToUse(
                      htuId: doc.id,
                      title: data['Title'],
                      descriptions: data['Descriptions'],
                      image: data['Image'],
                    ));
                  }
                  return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        actions: [TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context,
                                LoginScreen.id);
                          },
                          child: Text('Skip', style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),),)
                        ],
                        elevation: 0,
                      ),
                      body: Container(
                        padding: EdgeInsets.all(30), color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView.builder(
                                physics: BouncingScrollPhysics(),
                                controller: boardController,
                                onPageChanged: (int index) {
                                  if (index == modelHowToUse.length - 1) {
                                    setState(() {
                                      isLast = true;
                                    });
                                  }
                                  else {
                                    setState(() {
                                      isLast = false;
                                    });
                                  }
                                },
                                itemBuilder: (context, index) =>
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(width: double.infinity,height: MediaQuery.of(context).size.height*0.45,
                                          child: Image(image: NetworkImage(
                                              modelHowToUse[index].image),fit: BoxFit.contain,),
                                        ),
                                        SizedBox(height: 20,),
                                        Container(color: Colors.white,
                                          child: Text(modelHowToUse[index].title,
                                              style: TextStyle(fontSize: 25,
                                                  color: Colors.lightBlueAccent,
                                                  fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis),
                                        ),
                                        SizedBox(
                                          height: 25,),
                                        Container(color: Colors.white,
                                          child: Text(modelHowToUse[index].descriptions,
                                              style: TextStyle(fontSize: 18,
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.bold),maxLines: 7,overflow: TextOverflow.ellipsis,),
                                        ),



                                      ],
                                    ),
                                itemCount: modelHowToUse.length,
                              ),
                            ),
                            Row(
                              children: [
                                SmoothPageIndicator(
                                  controller: boardController,
                                  effect: ExpandingDotsEffect(
                                    dotColor: Colors.grey,
                                    activeDotColor: Colors.lightBlueAccent,
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    spacing: 10,
                                    expansionFactor: 4,

                                  ),
                                  count: modelHowToUse.length,
                                ),
                                Spacer(),
                                FloatingActionButton(

                                  backgroundColor: Colors.lightBlueAccent,
                                  onPressed: () {
                                    if (isLast) {
                                      Navigator.pushReplacementNamed(
                                          context, LoginScreen.id);
                                    }
                                    else {
                                      boardController.nextPage(
                                        duration: Duration(milliseconds: 750),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                      );
                                    }
                                  },
                                  child: Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey[600],),
                                ),
                              ],
                            )
                          ],
                        ),
                      )

                  );
                } else {
                  return Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Loading....',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20.0,fontWeight:FontWeight.bold,)),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(width: 200, height: 10,
                              child:LinearProgressIndicator(
                                  backgroundColor: Colors.grey.shade200,
                                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor,)
                              ),
                            ),
                          ),
                        ]),
                  );


                }
              },
            );
        });
  }

  // Widget buildBorderItems (ModelHowToUse model)=>Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Expanded(
  //       child: Image(
  //           image: AssetImage('${model.image}')),
  //     ),
  //     SizedBox(
  //       height: 5,),
  //     Text
  //       ('${model.title}',style:TextStyle(fontSize: 25,color: Colors.lime,fontWeight:FontWeight.bold)),
  //     SizedBox(
  //       height: 25,),
  //     Text
  //       ('${model.descriptions}',style:TextStyle(fontSize: 18,color: Colors.grey[600],fontWeight:FontWeight.bold)),
  //     SizedBox(
  //       height: 140,),
  //
  //
  //
  //   ],
  // );
}
