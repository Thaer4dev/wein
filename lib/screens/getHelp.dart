import 'package:flutter/material.dart';
import 'package:wein/screens/home.dart';

class GetHelp extends StatefulWidget {
  static const String id = 'GetHelp';

  @override
  _GetHelpState createState() => _GetHelpState();
}
class _GetHelpState extends State<GetHelp> {
  var firstQ = false;
  var secondQ = false;
  var thirdQ = false;
  var fourthQ = false;
  var fifthQ = false;
  var sixthQ = false;
  var seventhQ = false;
  var eighthQ = false;
  var ninthQ = false;
  var tenthQ = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Home.id);
          },
          icon: Icon(Icons.arrow_back_outlined,),
          color: Colors.black,
          iconSize: 30,),
        title: Text('Get Help',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),),
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              color: Colors.grey[700],
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.support_agent_outlined, size: 35,
                        color: Colors.amber,),
                      Text('Our support team is ready to help you 24/7',
                        style: TextStyle(color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,),),
                    ],),
                  Text('for any complaints : support@wein.com',
                    style: TextStyle(color: Colors.white, fontSize: 12.0,),),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: firstQ, onChanged: (value) {
                            setState(() {
                              this.firstQ = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: firstQ != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: secondQ, onChanged: (value) {
                            setState(() {
                              this.secondQ = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: secondQ != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: thirdQ, onChanged: (value) {
                            setState(() {
                              this.thirdQ = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: thirdQ != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: fourthQ , onChanged: (value) {
                            setState(() {
                              this.fourthQ  = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: fourthQ  != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: fifthQ, onChanged: (value) {
                            setState(() {
                              this.fifthQ = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: fifthQ != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: sixthQ, onChanged: (value) {
                            setState(() {
                              this.sixthQ = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: sixthQ != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: seventhQ, onChanged: (value) {
                            setState(() {
                              this.seventhQ = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: seventhQ != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: eighthQ, onChanged: (value) {
                            setState(() {
                              this.eighthQ = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: eighthQ != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: ninthQ, onChanged: (value) {
                            setState(() {
                              this.ninthQ = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: ninthQ != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.amber, width: 3),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              'What is the difference car car between the ',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis, maxLines: 10,),
                          ),

                          Expanded(child: SizedBox(width: 0,)),
                          Checkbox(value: tenthQ, onChanged: (value) {
                            setState(() {
                              this.tenthQ = value!;
                            });
                          },
                            activeColor: Colors.amber,),
                        ],),
                      Container(
                          child: tenthQ != false ?
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                'Our Mobile Apps are native Apps that can be downloaded and installed on your compatible mobile device, while the Mobile Website is a web portal that runs directly in the mobile browser on your smart phone or other mobile device. Both the native Apps and the Mobile Website allow you to access your account information, view news releases, report an outage, or contact car directly from your mobile device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12),
                                overflow: TextOverflow.ellipsis, maxLines: 20,),
                              SizedBox(height: 5,),
                            ],) : SizedBox(width: 0,))
                    ],),
                ),


              ],
            ),

          ],
        ),
      ),
    );
  }
}