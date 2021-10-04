import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/add_menu/model_menu.dart';
import 'package:wein/dash_board/add_menu/store_menu.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';
import 'package:wein/screens/menu_screen.dart';

class StartMenuScreen extends StatefulWidget {
  static const String id = 'StartMenuScreen';

  @override
  _StartMenuScreenState createState() => _StartMenuScreenState();
}

class _StartMenuScreenState extends State<StartMenuScreen> {
  final _storeMenu = StoreMenu();


  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: _storeMenu.loadMenu(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<ModelMenu>modelMenu=[];
          for (var doc in snapshot.data!.docs) {
            var data = (doc.data() as dynamic);
            modelMenu.add(ModelMenu(

              restaurantCode :  data["restaurantCode"],
              restaurantName :  data["restaurantName"],
              menuPhoto1 :  data["menuPhoto1"],
              menuPhoto2 :  data["menuPhoto2"],
              menuPhoto3 :  data["menuPhoto3"],
              menuPhoto4 :  data["menuPhoto4"],
              menuPhoto5 :  data["menuPhoto5"],
              menuPhoto6 :  data["menuPhoto6"],
              menuPhoto7 :  data["menuPhoto7"],
              menuPhoto8 :  data["menuPhoto8"],
              menuPhoto9 :  data["menuPhoto9"],
              menuPhoto10 :  data["menuPhoto10"],
              menuPhoto11 :  data["menuPhoto11"],
              menuPhoto12 :  data["menuPhoto12"],
              menuPhoto13 :  data["menuPhoto13"],
              menuPhoto14 :  data["menuPhoto14"],
              menuPhoto15 :  data["menuPhoto15"],

            ));}

          ModelRestaurants? modelRestaurants = ModalRoute.of(context)!.settings.arguments as ModelRestaurants?;
          var rCode = double.parse(modelRestaurants!.restaurantCode);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              // leading:IconButton(
              //   onPressed: () {Navigator.pushNamed(context, RestaurantScreen2.id);},
              //   icon: Icon(Icons.arrow_back_outlined,),color: Colors.black,iconSize: 30,),

            ),

            body: Container(

              margin: EdgeInsets.fromLTRB(10, 60, 10, 10),
              child: ListView.separated(
                  separatorBuilder: (context, index)=>SizedBox(width: 0,), itemCount:modelMenu.length, itemBuilder: (context, index) =>
                  Container(alignment: Alignment.center,
                    child:
                    double.parse(modelMenu[index].restaurantCode)==rCode?
                    MaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context,MenuScreen.id,arguments: modelMenu[index]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.70,
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),color: Colors.grey.shade300, border: Border.all(color: Colors.grey.shade700, width: 8),),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(modelMenu[index].restaurantName,style: TextStyle(fontSize: 30,color: Colors.grey.shade700,fontWeight: FontWeight.bold,fontFamily:'Raleway'),),
                            SizedBox(height: 10,),
                            Text('Menu',style: TextStyle(fontSize: 30,color: Colors.grey.shade700,fontWeight: FontWeight.bold,fontFamily:'Raleway'),),
                            SizedBox(height: 30,),
                            Icon(Icons.restaurant_menu_outlined,size:120,color:Colors.grey.shade700 ,),
                            SizedBox(height: 150,),
                            Text('Press to Open',style: TextStyle(fontSize: 24,color: Colors.amber,fontWeight: FontWeight.bold),),

                          ],
                        ),
                      ),
                    ):SizedBox(width: 0,),
                  ),),
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
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor,),),),),]);}},
    );}


}
