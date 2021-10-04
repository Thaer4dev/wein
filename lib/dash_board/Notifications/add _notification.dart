import 'package:flutter/material.dart';
import 'package:wein/dash_board/Notifications/model_notifications.dart';
import 'package:wein/dash_board/Notifications/store_notifications.dart';

class AddNotification extends StatefulWidget {
  static const String id = 'AddNotification';

  @override
  _AddNotificationState createState() => _AddNotificationState();
}

var titleController = TextEditingController();
var bodyController = TextEditingController();
final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

class _AddNotificationState extends State<AddNotification> {
  final _store = StoreNotification();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Notifications',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _globalKey,
        child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextFormField(
            maxLength: 30,
            controller: titleController,
            keyboardType: TextInputType.name,
            onFieldSubmitted: (value) {
              titleController.text = (value);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'you must fill the title';
              }
              return null;
            },
            cursorColor: Colors.lightBlueAccent,
            cursorHeight: 30,
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              ),
              prefixIcon: Icon(
                Icons.border_color_outlined,
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
          TextFormField(
            maxLength: 150,
            maxLines: 2,
            controller: bodyController,
            keyboardType: TextInputType.name,
            onFieldSubmitted: (value) {
              bodyController.text = (value);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'you must fill the Message';
              }
              return null;
            },
            cursorColor: Colors.lightBlueAccent,
            cursorHeight: 30,
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              labelText: 'Message',
              labelStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              ),
              prefixIcon: Icon(
                Icons.border_color_outlined,
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity, height: 50.0,
            margin: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), color: Colors.lightBlueAccent,),
            child: MaterialButton(
              onPressed: () async {
                if (_globalKey.currentState!.validate()) {
                  _store.loadingAlert(context);
                  _globalKey.currentState!.save();

                  _store.addNotification(ModelNotification(
                    notificationId: "",
                    title: titleController.text,
                    body: bodyController.text,
                  ));
                  _store.successAddAlert(context);
                  _globalKey.currentState!.reset();
                }
              },
              child: Text('Add New Notification', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
