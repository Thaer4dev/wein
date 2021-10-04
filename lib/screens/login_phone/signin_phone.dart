import 'package:flutter/material.dart';
import 'package:wein/login_Auth/phoneauth_service.dart';

class SigninPhoneScreen extends StatefulWidget
{
  static const String id = 'SigninPhoneScreen';
  @override
  _SigninPhoneScreenState createState() => _SigninPhoneScreenState();


}

class _SigninPhoneScreenState extends State<SigninPhoneScreen> {
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  String CountryCode = '+971';
  String counterText ='0';



  showAlertDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor,),
          ),
          SizedBox(width: 10,),
          Text('Loading.....',style: TextStyle(color: Colors.lightBlueAccent),),
        ],
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context, builder: (BuildContext context){
      return alert;
    });
  }
  PhoneAuthService _service =PhoneAuthService();




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_outlined),iconSize: 25.0,),
        title:Text('Sign in with your mobile number',style: TextStyle(color: Colors.white,fontSize: 19.0,),),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Center(
            child: Form(
              key: formKey,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login to start ordering', style:TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold)),
                  SizedBox(height: 40.0,),
                  TextFormField(
                    maxLength: 9,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    onChanged: (value){
                      setState(() {
                        counterText=value.length.toString();
                      });
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return 'you must fill your mobile number';
                      }
                      else if(value.length<9){
                        return 'your mobile number is too short';
                      }
                      return null;
                    },
                    cursorColor: Colors.lightBlueAccent,cursorHeight: 30,
                    style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: '$counterText / 9',
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlueAccent ,width: 2.0),),
                      prefixIcon: Icon(Icons.phone_iphone,color: Colors.lightBlueAccent,),
                      prefixText: '+971 ',
                      prefixStyle: TextStyle(color: Colors.lightBlueAccent,fontSize: 16,fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Center(
                    child: MaterialButton(
                        onPressed: (){
                          if(formKey.currentState!.validate())
                          {
                            String phoneWithCountryCode = '$CountryCode${phoneController.text}';

                            showAlertDialog(context);

                            _service.verifyPhoneNumber(context, phoneWithCountryCode);
                          }
                        },
                      child: Container(
                        alignment: Alignment.center,
                        width: 300,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),color: Colors.lightBlueAccent),
                        child: Text('SIGN IN', style: TextStyle(color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),),

                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}

