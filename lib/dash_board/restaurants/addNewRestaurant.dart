import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';
import 'package:wein/dash_board/restaurants/store_Restaurants.dart';

class AddNewRestaurant extends StatefulWidget {
  static const String id = 'AddNewRestaurant';


  @override
  _AddNewRestaurantState createState() => _AddNewRestaurantState();
}

class _AddNewRestaurantState extends State<AddNewRestaurant> {

  final _storeRestaurants = StoreRestaurants();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


//thaer(All image Pick)-------------------------------------------------------

//thaer(restaurantMain image Pick)---------------------------------------
  File? _restaurantMainImage ;
  final pickerRestaurantMainImage = ImagePicker();

  Future getRestaurantMainImage() async {
    final pickedFile = await pickerRestaurantMainImage.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_restaurantMainImage = File(pickedFile.path);}
    });
  }

//thaer(mainOffer image Pick)---------------------------------------
  File? _mainOfferImage;
  final pickerMainOfferImage = ImagePicker();

  Future getMainOfferImage() async {
    final pickedFile = await pickerMainOfferImage.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_mainOfferImage = File(pickedFile.path);}
    });
  }
  
// thaer(secondOffer image Pick)---------------------------------------
  File? _secondOfferImage;
  final pickerSecondOfferImage = ImagePicker();

  Future getSecondOfferImage() async {
    final pickedFile = await pickerSecondOfferImage.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_secondOfferImage = File(pickedFile.path);}
    });
  }

//thaer(thirdOffer image Pick)---------------------------------------
  File? _thirdOfferImage;
  final pickerThirdOfferImage = ImagePicker();

  Future getThirdOfferImage() async {
    final pickedFile = await pickerThirdOfferImage.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_thirdOfferImage = File(pickedFile.path);}
    });
  }

//thaer(fourthOffer image Pick)---------------------------------------
  File? _fourthOfferImage;
  final pickerFourthOfferImage = ImagePicker();

  Future getFourthOfferImage() async {
    final pickedFile = await pickerFourthOfferImage.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_fourthOfferImage = File(pickedFile.path);}
    });
  }

// thaer(fifthOffer image Pick)---------------------------------------
  File? _fifthOfferImage;
  final pickerfifthOfferImage = ImagePicker();

  Future getfifthOfferImage() async {
    final pickedFile = await pickerfifthOfferImage.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_fifthOfferImage = File(pickedFile.path);}
    });
  }

// thaer(restaurant Main elements)---------------------------------------
  var restaurantNameController = TextEditingController();
  var restaurantCodeController = TextEditingController();
  var cuisineController = TextEditingController();
  var addressController = TextEditingController();
  var latController = TextEditingController();
  var longController = TextEditingController();
  var phoneController = TextEditingController();
  var rate = false;String rateValue = '3.0';
  String openTimeDrop = '00.00';
  String closeTimeDrop = '00.00';
  var shisha = false;
  var playingCard = false;
  var nonSmoking = false;
  var liveMusic = false;
  var sportScreen = false;
  var outdoor = false;
  var acceptedCard = false;
  var kidsFriendly = false;
  var valetParking = false;
  var birthdayParty = false;

//thaer(main offer elements)---------------------------------------
  var mainOffer= false;
  var mainOfferDetailsController = TextEditingController();
  String mainOfferStartingTimeDrop = '00.00';
  String mainOfferEndTimeDrop = '00.00';
  var mainOfferDaySat = false;
  var mainOfferDaySun = false;
  var mainOfferDayMon = false;
  var mainOfferDayTus = false;
  var mainOfferDayWed = false;
  var mainOfferDayThu = false;
  var mainOfferDayFri = false;
  var mainOfferBreakfast = false;
  var mainOfferLunch = false;
  var mainOfferDinner = false;
  var mainOfferShishaOffer = false;
  var mainOfferDelivery = false;
  var mainOfferBuffet = false;
  var mainOfferWeinOffer = false;
  var mainOfferButtonTextController = TextEditingController();
  var mainOfferSellingPriceController = TextEditingController();
  var mainOfferMaxSaleController = TextEditingController();
  var mainOfferActiveStartController = TextEditingController();
  var mainOfferActiveEndController = TextEditingController();

//thaer(second offer elements)---------------------------------------
  var secondOffer= false;
  var secondOfferDetailsController = TextEditingController();
  String secondOfferStartingTimeDrop = '00.00';
  String secondOfferEndTimeDrop = '00.00';
  var secondOfferDaySat = false;
  var secondOfferDaySun = false;
  var secondOfferDayMon = false;
  var secondOfferDayTus = false;
  var secondOfferDayWed = false;
  var secondOfferDayThu = false;
  var secondOfferDayFri = false;
  var secondOfferBreakfast = false;
  var secondOfferLunch = false;
  var secondOfferDinner = false;
  var secondOfferShishaOffer = false;
  var secondOfferDelivery = false;
  var secondOfferBuffet = false;
  var secondOfferWeinOffer = false;
  var secondOfferButtonTextController = TextEditingController();
  var secondOfferSellingPriceController = TextEditingController();
  var secondOfferMaxSaleController = TextEditingController();
  var secondOfferActiveStartController = TextEditingController();
  var secondOfferActiveEndController = TextEditingController();

  //thaer(third offer elements)---------------------------------------
  var thirdOffer= false;
  var thirdOfferDetailsController = TextEditingController();
  String thirdOfferStartingTimeDrop = '00.00';
  String thirdOfferEndTimeDrop = '00.00';
  var thirdOfferDaySat = false;
  var thirdOfferDaySun = false;
  var thirdOfferDayMon = false;
  var thirdOfferDayTus = false;
  var thirdOfferDayWed = false;
  var thirdOfferDayThu = false;
  var thirdOfferDayFri = false;
  var thirdOfferBreakfast = false;
  var thirdOfferLunch = false;
  var thirdOfferDinner = false;
  var thirdOfferShishaOffer = false;
  var thirdOfferDelivery = false;
  var thirdOfferBuffet = false;
  var thirdOfferWeinOffer = false;
  var thirdOfferButtonTextController = TextEditingController();
  var thirdOfferSellingPriceController = TextEditingController();
  var thirdOfferMaxSaleController = TextEditingController();
  var thirdOfferActiveStartController = TextEditingController();
  var thirdOfferActiveEndController = TextEditingController();

//thaer(fourth offer elements)---------------------------------------
  var fourthOffer= false;
  var fourthOfferDetailsController = TextEditingController();
  String fourthOfferStartingTimeDrop = '00.00';
  String fourthOfferEndTimeDrop = '00.00';
  var fourthOfferDaySat = false;
  var fourthOfferDaySun = false;
  var fourthOfferDayMon = false;
  var fourthOfferDayTus = false;
  var fourthOfferDayWed = false;
  var fourthOfferDayThu = false;
  var fourthOfferDayFri = false;
  var fourthOfferBreakfast = false;
  var fourthOfferLunch = false;
  var fourthOfferDinner = false;
  var fourthOfferShishaOffer = false;
  var fourthOfferDelivery = false;
  var fourthOfferBuffet = false;
  var fourthOfferWeinOffer = false;
  var fourthOfferButtonTextController = TextEditingController();
  var fourthOfferSellingPriceController = TextEditingController();
  var fourthOfferMaxSaleController = TextEditingController();
  var fourthOfferActiveStartController = TextEditingController();
  var fourthOfferActiveEndController = TextEditingController();

  //thaer(fifth offer elements)---------------------------------------
  var fifthOffer= false;
  var fifthOfferDetailsController = TextEditingController();
  String fifthOfferStartingTimeDrop = '00.00';
  String fifthOfferEndTimeDrop = '00.00';
  var fifthOfferDaySat = false;
  var fifthOfferDaySun = false;
  var fifthOfferDayMon = false;
  var fifthOfferDayTus = false;
  var fifthOfferDayWed = false;
  var fifthOfferDayThu = false;
  var fifthOfferDayFri = false;
  var fifthOfferBreakfast = false;
  var fifthOfferLunch = false;
  var fifthOfferDinner = false;
  var fifthOfferShishaOffer = false;
  var fifthOfferDelivery = false;
  var fifthOfferBuffet = false;
  var fifthOfferWeinOffer = false;
  var fifthOfferButtonTextController = TextEditingController();
  var fifthOfferSellingPriceController = TextEditingController();
  var fifthOfferMaxSaleController = TextEditingController();
  var fifthOfferActiveStartController = TextEditingController();
  var fifthOfferActiveEndController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Add New Restaurant', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),),
          centerTitle: true,
        ),
        body: Form(
          key: _globalKey,
          child: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(10.0),
              child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){getRestaurantMainImage();},
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                        child:
                        _restaurantMainImage != null
                            ?
                        Image.file(_restaurantMainImage!, fit:BoxFit.fill,)
                            :
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_outlined,size: 60,color:Colors.lightBlueAccent,),
                            SizedBox(height: 20,),
                            Text('Click to select main image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),)],),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      maxLength: 27,
                      controller: restaurantNameController,
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {restaurantNameController.text = (value);},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you must fill Restaurant Name';
                        }return null;
                      },
                      cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                      style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: 'Restaurant Name',
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                        prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                    ),
                    TextFormField(
                      maxLength: 7,
                      controller: restaurantCodeController,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) {restaurantCodeController.text = (value);},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you must fill Restaurant Code';
                        }return null;
                      },
                      cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                      style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: 'Restaurant Code',
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                        prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                    ),
                    TextFormField(
                      maxLength: 10,
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) {phoneController.text = (value);},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you must fill Restaurant Phone Number';
                        }return null;
                      },
                      cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                      style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: 'ex : 04 XXXXXXX or 055 XXXXXXX',hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 14, ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                        prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                    ),
                    TextFormField(
                      maxLength: 8,
                      controller: cuisineController,
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {cuisineController.text = (value);},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you must fill the Cuisine';
                        }return null;
                      },
                      cursorColor: Colors.lightBlueAccent,
                      cursorHeight: 30,
                      style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: 'Cuisine',
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                        prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                    ),
                    TextFormField(
                      maxLength: 40,
                      controller: addressController,
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {addressController.text = (value);},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you must fill Address Details';
                        }return null;
                      },
                      cursorColor: Colors.lightBlueAccent,
                      cursorHeight: 30,
                      style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                        prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                      child: Column(
                        children: [
                          Text ('Map Location',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  maxLength: 9,
                                  controller: latController,
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (value) {latController.text = (value);},
                                  validator: (value) {
                                    if (value!.length<6) {
                                      return '6 digits minimum';
                                    }return null;
                                  },
                                  cursorColor: Colors.lightBlueAccent,
                                  cursorHeight: 20,
                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    labelText: 'Latitude',
                                    hintText: 'ex : 25.000000',hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 12, ),
                                    labelStyle: TextStyle(color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                    prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Flexible(
                                child: TextFormField(
                                  maxLength: 9,
                                  controller: longController,
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (value) {longController.text = (value);},
                                  validator: (value) {
                                    if (value!.length<6) {
                                      return '6 digits minimum';
                                    }return null;
                                  },
                                  cursorColor: Colors.lightBlueAccent,
                                  cursorHeight: 20,
                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    labelText: 'Longitude',
                                    hintText: 'ex : 55.000000',hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 12, ),
                                    labelStyle: TextStyle(color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                    prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                ),
                              ),

                            ],),
                        ],
                      ),),
                    Container(
                      alignment: Alignment.center,
                      height: 60,width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                      child: Row(
                        children: [
                          Text("Rate",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                          SizedBox(width: 5,),
                          Text("(to add it manually click)",style: TextStyle(color: Colors.grey[600],fontSize: 12),),

                          Checkbox(value: rate, onChanged: (value){setState(() {this.rate = value!;});},
                            activeColor: Colors.lightBlueAccent,),

                          Flexible(
                            fit: FlexFit.loose,
                            child:
                            rate != false
                                ?
                            DropdownButton(
                              style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                              iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                              isExpanded: false,
                              value: rateValue,
                              onChanged: (newValue){setState(() {rateValue = newValue as String;});},
                              items: restaurantRateValueList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                            )
                                :
                            SizedBox(width: 1,),
                          )
                        ],),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                      child: Row(
                        children: [
                          Icon(Icons.schedule_outlined,color: Colors.lightBlueAccent,size: 25,),
                          SizedBox(width: 10,),
                          Text("Start",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                          SizedBox(width: 5,),
                          DropdownButton(
                            style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                            iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                            isExpanded: false,
                            value: openTimeDrop,
                            onChanged: (newValue){setState(() {openTimeDrop = newValue as String;});},
                            items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                          ),
                          Expanded(child: SizedBox(width: 1,)),
                          Text("End",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                          SizedBox(width: 5,),
                          DropdownButton(
                            style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                            iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                            isExpanded: false,
                            value: closeTimeDrop,
                            onChanged: (newValue){setState(() {closeTimeDrop = newValue as String;});},
                            items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                          ),
                        ],),),
                    Container(
                      alignment: Alignment.center,
                      height: 250,width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                      child:
                      Column(
                        children: [
                          SizedBox(height: 5,),
                          Text("Restaurant Facilities",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text("Shisha",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: shisha, onChanged: (value){setState(() {this.shisha = value!;});},activeColor: Colors.lightBlueAccent,),
                              ],),
                          Row(
                            children: [
                              Text("PlayingCard",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: playingCard, onChanged: (value){setState(() {this.playingCard = value!;});},activeColor: Colors.lightBlueAccent,),
                              Expanded(child: SizedBox(width: 10,)),
                              Text("Non Smoking",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: nonSmoking, onChanged: (value){setState(() {this.nonSmoking = value!;});},activeColor: Colors.lightBlueAccent,),
                              Expanded(child: SizedBox(width: 10,)),
                              Text("LiveMusic",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: liveMusic, onChanged: (value){setState(() {this.liveMusic = value!;});},activeColor: Colors.lightBlueAccent,),
                            ],),
                          Row(
                            children: [
                              Text("Sport Screen",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: sportScreen, onChanged: (value){setState(() {this.sportScreen = value!;});},activeColor: Colors.lightBlueAccent,),
                              Expanded(child: SizedBox(width: 10,)),
                              Text("Outdoor",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: outdoor, onChanged: (value){setState(() {this.outdoor = value!;});},activeColor: Colors.lightBlueAccent,),
                              Expanded(child: SizedBox(width: 10,)),
                              Text("Accepted Card",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: acceptedCard, onChanged: (value){setState(() {this.acceptedCard = value!;});},activeColor: Colors.lightBlueAccent,),
                            ],),
                          Row(
                            children: [
                              Text("Kids Friendly",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: kidsFriendly, onChanged: (value){setState(() {this.kidsFriendly = value!;});},activeColor: Colors.lightBlueAccent,),
                              Expanded(child: SizedBox(width: 10,)),
                              Text("valet Parking",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: valetParking, onChanged: (value){setState(() {this.valetParking = value!;});},activeColor: Colors.lightBlueAccent,),
                              Expanded(child: SizedBox(width: 10,)),
                              Text("Birthday",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                              Checkbox(value: birthdayParty, onChanged: (value){setState(() {this.birthdayParty = value!;});},activeColor: Colors.lightBlueAccent,),
                            ],),
                        ],),),
//thaer (add first offer)---------------------------------
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.amber, width: 2),),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.add_circle_outlined,size: 30,color: Colors.lime,),
                                Text(" Add Offer ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                Text("(to add new offer click on check box)",style: TextStyle(color: Colors.grey,fontSize: 11),),
                                Checkbox(value: mainOffer, onChanged: (value){setState(() {this.mainOffer = value!;});},
                                  activeColor: Colors.lightBlueAccent,),
                              ],),
                            Container(
                                child:
                                mainOffer != false
                                    ?
                              Column(
                                  children: [
                                    SizedBox(height: 8,),
                                    GestureDetector(
                                      onTap: (){getMainOfferImage();},
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 150,
                                        width: 150,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                                        child:
                                        _mainOfferImage != null
                                            ?
                                        Image.file(_mainOfferImage!, fit:BoxFit.fill,)
                                            :
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image_outlined,size: 60,color:Colors.lightBlueAccent,),
                                            SizedBox(height: 20,),
                                            Text('Click to select offer image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),)],),
                                      ),
                                    ),
                                    TextFormField(
                                      maxLength: 70,
                                      maxLines: 2,
                                      controller: mainOfferDetailsController,
                                      keyboardType: TextInputType.name,
                                      onFieldSubmitted: (value) {mainOfferDetailsController.text = (value);},
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'you must fill Offer Details';
                                        }return null;
                                      },
                                      cursorColor: Colors.lightBlueAccent,
                                      cursorHeight: 30,
                                      style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                        labelText: 'Offer Details',
                                        labelStyle: TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                        prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      height: 60,width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child: Row(
                                        children: [
                                          Icon(Icons.schedule_outlined,color: Colors.lightBlueAccent,size: 25,),
                                          SizedBox(width: 10,),
                                          Text("Start",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                          SizedBox(width: 5,),
                                          DropdownButton(
                                            style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                            iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                            isExpanded: false,
                                            value: mainOfferStartingTimeDrop,
                                            onChanged: (newValue){setState(() {mainOfferStartingTimeDrop = newValue as String;});},
                                            items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                          ),
                                          Expanded(child: SizedBox(width: 1,)),
                                          Text("End",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                          SizedBox(width: 5,),
                                          DropdownButton(
                                            style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                            iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                            isExpanded: false,
                                            value: mainOfferEndTimeDrop,
                                            onChanged: (newValue){setState(() {mainOfferEndTimeDrop = newValue as String;});},
                                            items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                          ),
                                        ],),),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 100,width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_today_outlined,color: Colors.lightBlueAccent,size: 25,),
                                          Expanded(child: SizedBox(width: 1,)),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Sa",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: mainOfferDaySat, onChanged: (value){setState(() {this.mainOfferDaySat = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Su",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: mainOfferDaySun, onChanged: (value){setState(() {this.mainOfferDaySun = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Mo",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: mainOfferDayMon, onChanged: (value){setState(() {this.mainOfferDayMon = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Tu",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: mainOfferDayTus, onChanged: (value){setState(() {this.mainOfferDayTus = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                ],),
                                              Row(
                                                children: [
                                                  Text("We",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: mainOfferDayWed, onChanged: (value){setState(() {this.mainOfferDayWed = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Th",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: mainOfferDayThu, onChanged: (value){setState(() {this.mainOfferDayThu = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Fr",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: mainOfferDayFri, onChanged: (value){setState(() {this.mainOfferDayFri = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                ],),],),],),),
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child:
                                      Column(
                                        children: [
                                          SizedBox(height: 5,),
                                          Text("Offer Filters",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                          SizedBox(height: 8,),
                                          Row(
                                            children: [
                                              Text("Shisha Offer",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: mainOfferShishaOffer, onChanged: (value){setState(() {this.mainOfferShishaOffer = value!;});},activeColor: Colors.lightBlueAccent,),
                                              Expanded(child: SizedBox(width: 10,)),
                                              Text("Delivery",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: mainOfferDelivery, onChanged: (value){setState(() {this.mainOfferDelivery = value!;});},activeColor: Colors.lightBlueAccent,),
                                              Expanded(child: SizedBox(width: 10,)),
                                              Text("Buffet",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: mainOfferBuffet, onChanged: (value){setState(() {this.mainOfferBuffet = value!;});},activeColor: Colors.lightBlueAccent,),
                                            ],),
                                          Row(
                                            children: [
                                              Text("Breakfast",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: mainOfferBreakfast, onChanged: (value){setState(() {this.mainOfferBreakfast = value!;});},activeColor: Colors.lightBlueAccent,),
                                              Expanded(child: SizedBox(width: 10,)),
                                              Text("Lunch",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: mainOfferLunch, onChanged: (value){setState(() {this.mainOfferLunch = value!;});},activeColor: Colors.lightBlueAccent,),
                                              Expanded(child: SizedBox(width: 10,)),
                                              Text("Dinner",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: mainOfferDinner, onChanged: (value){setState(() {this.mainOfferDinner = value!;});},activeColor: Colors.lightBlueAccent,),
                                            ],),

                                        ],),),
//Active Time
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child: Column(
                                        children: [
                                          Text ('Active Time',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: TextFormField(
                                                  maxLength: 2,
                                                  controller: mainOfferActiveStartController,
                                                  keyboardType: TextInputType.number,
                                                  onFieldSubmitted: (value) {mainOfferActiveStartController.text = (value);},
                                                  validator: (value) {
                                                    if (value!.length<2) {
                                                      return 'you must fill 2 digits';
                                                    }return null;
                                                  },
                                                  cursorColor: Colors.lightBlueAccent,
                                                  cursorHeight: 20,
                                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                  decoration: InputDecoration(
                                                    labelText: 'Start',
                                                    labelStyle: TextStyle(color: Colors.grey),
                                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                    prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              Flexible(
                                                child: TextFormField(
                                                  maxLength: 2,
                                                  controller: mainOfferActiveEndController,
                                                  keyboardType: TextInputType.number,
                                                  onFieldSubmitted: (value) {mainOfferActiveEndController.text = (value);},
                                                  validator: (value) {
                                                    if (value!.length<2) {
                                                      return 'you must fill 2 digits';
                                                    }return null;
                                                  },
                                                  cursorColor: Colors.lightBlueAccent,
                                                  cursorHeight: 20,
                                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                  decoration: InputDecoration(
                                                    labelText: 'End',
                                                    labelStyle: TextStyle(color: Colors.grey),
                                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                    prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                                ),
                                              ),

                                            ],),
                                        ],
                                      ),),

                                    Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child: Column(
                                          children: [

                                            Row(
                                              children: [
                                                Text("Wein Offer",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                                SizedBox(width: 5,),
                                                Text("(if this offer available to sale click)",style: TextStyle(color: Colors.grey[600],fontSize: 11),),

                                                Checkbox(value: mainOfferWeinOffer, onChanged: (value){setState(() {this.mainOfferWeinOffer = value!;});},
                                                  activeColor: Colors.lightBlueAccent,),
                                              ],),
                                            Container(
                                              child:
                                              mainOfferWeinOffer != false
                                                  ?
                                              TextFormField(
                                                maxLength: 20,
                                                controller: mainOfferButtonTextController,
                                                keyboardType: TextInputType.name,
                                                onFieldSubmitted: (value) {mainOfferButtonTextController.text = (value);},
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'you must fill text showing in button';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Button Text',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              )
                                                  :
                                              SizedBox(width: 1,),
                                            ),
                                            Container(
                                              child:
                                              mainOfferWeinOffer != false
                                                  ?
                                              TextFormField(
                                                maxLength: 10,
                                                controller: mainOfferSellingPriceController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {mainOfferSellingPriceController.text = (value);},
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'you must fill Selling Price';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Price',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              )
                                                  :
                                              SizedBox(width: 1,),
                                            ),
                                            Container(
                                              child:
                                              mainOfferWeinOffer != false
                                                  ?
                                              TextFormField(
                                                maxLength: 10,
                                                controller: mainOfferMaxSaleController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {mainOfferMaxSaleController.text = (value);},
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'you must fill Max salable offers';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Max salable offers',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              )
                                                  :
                                              SizedBox(width: 1,),
                                            ),
                                          ]),

                                    ),
                                    SizedBox(height: 10,),

                                    SizedBox(height: 20,),
                                  ])
                              :SizedBox(height: 0,),
                            ),

                          ],
                        ),

                    ),
//thaer (add second offer)---------------------------------
                    mainOffer != false
                        ?
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.amber, width: 2),),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_circle_outlined,size: 30,color: Colors.lime,),
                              Text(" Add Offer ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                              Text("(to add new offer click on check box)",style: TextStyle(color: Colors.grey,fontSize: 11),),
                              Checkbox(value: secondOffer, onChanged: (value){setState(() {this.secondOffer = value!;});},
                                activeColor: Colors.lightBlueAccent,),
                            ],),
                          Container(
                              child:
                              secondOffer != false
                                  ?
                              Column(
                                  children: [
                                    SizedBox(height: 8,),
                                    GestureDetector(
                                      onTap: (){getSecondOfferImage();},
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 150,
                                        width: 150,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                                        child:
                                        _secondOfferImage != null
                                            ?
                                        Image.file(_secondOfferImage!, fit:BoxFit.fill,)
                                            :
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image_outlined,size: 60,color:Colors.lightBlueAccent,),
                                            SizedBox(height: 20,),
                                            Text('Click to select offer image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),)],),
                                      ),
                                    ),
                                    TextFormField(
                                      maxLength: 70,
                                      maxLines: 2,
                                      controller: secondOfferDetailsController,
                                      keyboardType: TextInputType.name,
                                      onFieldSubmitted: (value) {secondOfferDetailsController.text = (value);},
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'you must fill Offer Details';
                                        }return null;
                                      },
                                      cursorColor: Colors.lightBlueAccent,
                                      cursorHeight: 30,
                                      style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                        labelText: 'Offer Details',
                                        labelStyle: TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                        prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      height: 60,width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child: Row(
                                        children: [
                                          Icon(Icons.schedule_outlined,color: Colors.lightBlueAccent,size: 25,),
                                          SizedBox(width: 10,),
                                          Text("Start",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                          SizedBox(width: 5,),
                                          DropdownButton(
                                            style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                            iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                            isExpanded: false,
                                            value: secondOfferStartingTimeDrop,
                                            onChanged: (newValue){setState(() {secondOfferStartingTimeDrop = newValue as String;});},
                                            items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                          ),
                                          Expanded(child: SizedBox(width: 1,)),
                                          Text("End",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                          SizedBox(width: 5,),
                                          DropdownButton(
                                            style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                            iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                            isExpanded: false,
                                            value: secondOfferEndTimeDrop,
                                            onChanged: (newValue){setState(() {secondOfferEndTimeDrop = newValue as String;});},
                                            items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                          ),
                                        ],),),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 100,width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_today_outlined,color: Colors.lightBlueAccent,size: 25,),
                                          Expanded(child: SizedBox(width: 1,)),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Sa",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: secondOfferDaySat, onChanged: (value){setState(() {this.secondOfferDaySat = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Su",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: secondOfferDaySun, onChanged: (value){setState(() {this.secondOfferDaySun = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Mo",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: secondOfferDayMon, onChanged: (value){setState(() {this.secondOfferDayMon = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Tu",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: secondOfferDayTus, onChanged: (value){setState(() {this.secondOfferDayTus = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                ],),
                                              Row(
                                                children: [
                                                  Text("We",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: secondOfferDayWed, onChanged: (value){setState(() {this.secondOfferDayWed = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Th",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: secondOfferDayThu, onChanged: (value){setState(() {this.secondOfferDayThu = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                  Text("Fr",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                  Checkbox(value: secondOfferDayFri, onChanged: (value){setState(() {this.secondOfferDayFri = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                ],),],),],),),
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child:
                                      Column(
                                        children: [
                                          SizedBox(height: 5,),
                                          Text("Offer Filters",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                          SizedBox(height: 8,),
                                          Row(
                                            children: [
                                              Text("Shisha Offer",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: secondOfferShishaOffer, onChanged: (value){setState(() {this.secondOfferShishaOffer = value!;});},activeColor: Colors.lightBlueAccent,),
                                              Expanded(child: SizedBox(width: 10,)),
                                              Text("Delivery",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: secondOfferDelivery, onChanged: (value){setState(() {this.secondOfferDelivery = value!;});},activeColor: Colors.lightBlueAccent,),
                                              Expanded(child: SizedBox(width: 10,)),
                                              Text("Buffet",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: secondOfferBuffet, onChanged: (value){setState(() {this.secondOfferBuffet = value!;});},activeColor: Colors.lightBlueAccent,),
                                            ],),
                                          Row(
                                            children: [
                                              Text("Breakfast",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: secondOfferBreakfast, onChanged: (value){setState(() {this.secondOfferBreakfast = value!;});},activeColor: Colors.lightBlueAccent,),
                                              Expanded(child: SizedBox(width: 10,)),
                                              Text("Lunch",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: secondOfferLunch, onChanged: (value){setState(() {this.secondOfferLunch = value!;});},activeColor: Colors.lightBlueAccent,),
                                              Expanded(child: SizedBox(width: 10,)),
                                              Text("Dinner",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                              Checkbox(value: secondOfferDinner, onChanged: (value){setState(() {this.secondOfferDinner = value!;});},activeColor: Colors.lightBlueAccent,),
                                            ],),

                                        ],),),
//Active Time
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child: Column(
                                        children: [
                                          Text ('Active Time',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: TextFormField(
                                                  maxLength: 2,
                                                  controller: secondOfferActiveStartController,
                                                  keyboardType: TextInputType.number,
                                                  onFieldSubmitted: (value) {secondOfferActiveStartController.text = (value);},
                                                  validator: (value) {
                                                    if (value!.length<2) {
                                                      return 'you must fill 2 digits';
                                                    }return null;
                                                  },
                                                  cursorColor: Colors.lightBlueAccent,
                                                  cursorHeight: 20,
                                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                  decoration: InputDecoration(
                                                    labelText: 'Start',
                                                    labelStyle: TextStyle(color: Colors.grey),
                                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                    prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              Flexible(
                                                child: TextFormField(
                                                  maxLength: 2,
                                                  controller: secondOfferActiveEndController,
                                                  keyboardType: TextInputType.number,
                                                  onFieldSubmitted: (value) {secondOfferActiveEndController.text = (value);},
                                                  validator: (value) {
                                                    if (value!.length<2) {
                                                      return 'you must fill 2 digits';
                                                    }return null;
                                                  },
                                                  cursorColor: Colors.lightBlueAccent,
                                                  cursorHeight: 20,
                                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                  decoration: InputDecoration(
                                                    labelText: 'End',
                                                    labelStyle: TextStyle(color: Colors.grey),
                                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                    prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                                ),
                                              ),

                                            ],),
                                        ],
                                      ),),
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                      child: Column(
                                          children: [

                                            Row(
                                              children: [
                                                Text("Wein Offer",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                                SizedBox(width: 5,),
                                                Text("(if this offer available to sale click)",style: TextStyle(color: Colors.grey[600],fontSize: 11),),

                                                Checkbox(value: secondOfferWeinOffer, onChanged: (value){setState(() {this.secondOfferWeinOffer = value!;});},
                                                  activeColor: Colors.lightBlueAccent,),
                                              ],),
                                            Container(
                                              child:
                                              secondOfferWeinOffer != false
                                                  ?
                                              TextFormField(
                                                maxLength: 20,
                                                controller: secondOfferButtonTextController,
                                                keyboardType: TextInputType.name,
                                                onFieldSubmitted: (value) {secondOfferButtonTextController.text = (value);},
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'you must fill text showing in button';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Button Text',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              )
                                                  :
                                              SizedBox(width: 1,),
                                            ),
                                            Container(
                                              child:
                                              secondOfferWeinOffer != false
                                                  ?
                                              TextFormField(
                                                maxLength: 30,
                                                controller: secondOfferSellingPriceController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {secondOfferSellingPriceController.text = (value);},
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'you must fill Selling Price';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Price',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              )
                                                  :
                                              SizedBox(width: 1,),
                                            ),
                                            Container(
                                              child:
                                              secondOfferWeinOffer != false
                                                  ?
                                              TextFormField(
                                                maxLength: 10,
                                                controller: secondOfferMaxSaleController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {secondOfferMaxSaleController.text = (value);},
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'you must fill Max salable offers';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Max salable offers',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              )
                                                  :
                                              SizedBox(width: 1,),
                                            ),

                                          ]),

                                    ),
                                    SizedBox(height: 10,),

                                    SizedBox(height: 20,),
                                  ])
                            :SizedBox(height: 0,),
                          ),
                        ],),
                    )
                    :SizedBox(height: 0,),

//thaer (add third offer)---------------------------------
                    secondOffer != false
                        ?
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.amber, width: 2),),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_circle_outlined,size: 30,color: Colors.lime,),
                              Text(" Add Offer ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                              Text("(to add new offer click on check box)",style: TextStyle(color: Colors.grey,fontSize: 11),),
                              Checkbox(value: thirdOffer, onChanged: (value){setState(() {this.thirdOffer = value!;});},
                                activeColor: Colors.lightBlueAccent,),
                            ],),
                          Container(
                            child:
                            thirdOffer != false
                                ?
                            Column(
                                children: [
                                  SizedBox(height: 8,),
                                  GestureDetector(
                                    onTap: (){getThirdOfferImage();},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 150,
                                      width: 150,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                                      child:
                                      _thirdOfferImage != null
                                          ?
                                      Image.file(_thirdOfferImage!, fit:BoxFit.fill,)
                                          :
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image_outlined,size: 60,color:Colors.lightBlueAccent,),
                                          SizedBox(height: 20,),
                                          Text('Click to select offer image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),)],),
                                    ),
                                  ),
                                  TextFormField(
                                    maxLength: 70,
                                    maxLines: 2,
                                    controller: thirdOfferDetailsController,
                                    keyboardType: TextInputType.name,
                                    onFieldSubmitted: (value) {thirdOfferDetailsController.text = (value);},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'you must fill Offer Details';
                                      }return null;
                                    },
                                    cursorColor: Colors.lightBlueAccent,
                                    cursorHeight: 30,
                                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      labelText: 'Offer Details',
                                      labelStyle: TextStyle(color: Colors.grey),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                      prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    height: 60,width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Row(
                                      children: [
                                        Icon(Icons.schedule_outlined,color: Colors.lightBlueAccent,size: 25,),
                                        SizedBox(width: 10,),
                                        Text("Start",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(width: 5,),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                          iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                          isExpanded: false,
                                          value: thirdOfferStartingTimeDrop,
                                          onChanged: (newValue){setState(() {thirdOfferStartingTimeDrop = newValue as String;});},
                                          items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                        ),
                                        Expanded(child: SizedBox(width: 1,)),
                                        Text("End",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(width: 5,),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                          iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                          isExpanded: false,
                                          value: thirdOfferEndTimeDrop,
                                          onChanged: (newValue){setState(() {thirdOfferEndTimeDrop = newValue as String;});},
                                          items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                        ),
                                      ],),),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 100,width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today_outlined,color: Colors.lightBlueAccent,size: 25,),
                                        Expanded(child: SizedBox(width: 1,)),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Sa",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: thirdOfferDaySat, onChanged: (value){setState(() {this.thirdOfferDaySat = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Su",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: thirdOfferDaySun, onChanged: (value){setState(() {this.thirdOfferDaySun = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Mo",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: thirdOfferDayMon, onChanged: (value){setState(() {this.thirdOfferDayMon = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Tu",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: thirdOfferDayTus, onChanged: (value){setState(() {this.thirdOfferDayTus = value!;});}, activeColor: Colors.lightBlueAccent,),
                                              ],),
                                            Row(
                                              children: [
                                                Text("We",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: thirdOfferDayWed, onChanged: (value){setState(() {this.thirdOfferDayWed = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Th",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: thirdOfferDayThu, onChanged: (value){setState(() {this.thirdOfferDayThu = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Fr",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: thirdOfferDayFri, onChanged: (value){setState(() {this.thirdOfferDayFri = value!;});}, activeColor: Colors.lightBlueAccent,),
                                              ],),],),],),),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child:
                                    Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Text("Offer Filters",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(height: 8,),
                                        Row(
                                          children: [
                                            Text("Shisha Offer",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: thirdOfferShishaOffer, onChanged: (value){setState(() {this.thirdOfferShishaOffer = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Delivery",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: thirdOfferDelivery, onChanged: (value){setState(() {this.thirdOfferDelivery = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Buffet",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: thirdOfferBuffet, onChanged: (value){setState(() {this.thirdOfferBuffet = value!;});},activeColor: Colors.lightBlueAccent,),
                                          ],),
                                        Row(
                                          children: [
                                            Text("Breakfast",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: thirdOfferBreakfast, onChanged: (value){setState(() {this.thirdOfferBreakfast = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Lunch",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: thirdOfferLunch, onChanged: (value){setState(() {this.thirdOfferLunch = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Dinner",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: thirdOfferDinner, onChanged: (value){setState(() {this.thirdOfferDinner = value!;});},activeColor: Colors.lightBlueAccent,),
                                          ],),
                                      ],),),
//Active Time
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Column(
                                      children: [
                                        Text ('Active Time',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: TextFormField(
                                                maxLength: 2,
                                                controller: thirdOfferActiveStartController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {thirdOfferActiveStartController.text = (value);},
                                                validator: (value) {
                                                  if (value!.length<2) {
                                                    return 'you must fill 2 digits';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent,
                                                cursorHeight: 20,
                                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Start',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Flexible(
                                              child: TextFormField(
                                                maxLength: 2,
                                                controller: thirdOfferActiveEndController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {thirdOfferActiveEndController.text = (value);},
                                                validator: (value) {
                                                  if (value!.length<2) {
                                                    return 'you must fill 2 digits';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent,
                                                cursorHeight: 20,
                                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'End',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              ),
                                            ),

                                          ],),
                                      ],
                                    ),),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Column(
                                        children: [

                                          Row(
                                            children: [
                                              Text("Wein Offer",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                              SizedBox(width: 5,),
                                              Text("(if this offer available to sale click)",style: TextStyle(color: Colors.grey[600],fontSize: 11),),

                                              Checkbox(value: thirdOfferWeinOffer, onChanged: (value){setState(() {this.thirdOfferWeinOffer = value!;});},
                                                activeColor: Colors.lightBlueAccent,),
                                            ],),
                                          Container(
                                            child:
                                            thirdOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 20,
                                              controller: thirdOfferButtonTextController,
                                              keyboardType: TextInputType.name,
                                              onFieldSubmitted: (value) {thirdOfferButtonTextController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill text showing in button';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Button Text',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),
                                          Container(
                                            child:
                                            thirdOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 30,
                                              controller: thirdOfferSellingPriceController,
                                              keyboardType: TextInputType.number,
                                              onFieldSubmitted: (value) {thirdOfferSellingPriceController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill Selling Price';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Price',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),
                                          Container(
                                            child:
                                            thirdOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 10,
                                              controller: thirdOfferMaxSaleController,
                                              keyboardType: TextInputType.number,
                                              onFieldSubmitted: (value) {thirdOfferMaxSaleController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill Max salable offers';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Max salable offers',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),


                                        ]),

                                  ),
                                  SizedBox(height: 10,),

                                  SizedBox(height: 20,),
                                ])
                                :SizedBox(height: 0,),
                          ),

                        ],
                      ),

                    )
                        :SizedBox(height: 0,),

//thaer (add fourth offer)---------------------------------
                    thirdOffer != false
                        ?
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.amber, width: 2),),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_circle_outlined,size: 30,color: Colors.lime,),
                              Text(" Add Offer ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                              Text("(to add new offer click on check box)",style: TextStyle(color: Colors.grey,fontSize: 11),),
                              Checkbox(value: fourthOffer, onChanged: (value){setState(() {this.fourthOffer = value!;});},
                                activeColor: Colors.lightBlueAccent,),
                            ],),
                          Container(
                            child:
                            fourthOffer != false
                                ?
                            Column(
                                children: [
                                  SizedBox(height: 8,),
                                  GestureDetector(
                                    onTap: (){getFourthOfferImage();},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 150,
                                      width: 150,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                                      child:
                                      _fourthOfferImage != null
                                          ?
                                      Image.file(_fourthOfferImage!, fit:BoxFit.fill,)
                                          :
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image_outlined,size: 60,color:Colors.lightBlueAccent,),
                                          SizedBox(height: 20,),
                                          Text('Click to select offer image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),)],),
                                    ),
                                  ),
                                  TextFormField(
                                    maxLength: 70,
                                    maxLines: 2,
                                    controller: fourthOfferDetailsController,
                                    keyboardType: TextInputType.name,
                                    onFieldSubmitted: (value) {fourthOfferDetailsController.text = (value);},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'you must fill Offer Details';
                                      }return null;
                                    },
                                    cursorColor: Colors.lightBlueAccent,
                                    cursorHeight: 30,
                                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      labelText: 'Offer Details',
                                      labelStyle: TextStyle(color: Colors.grey),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                      prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    height: 60,width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Row(
                                      children: [
                                        Icon(Icons.schedule_outlined,color: Colors.lightBlueAccent,size: 25,),
                                        SizedBox(width: 10,),
                                        Text("Start",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(width: 5,),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                          iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                          isExpanded: false,
                                          value: fourthOfferStartingTimeDrop,
                                          onChanged: (newValue){setState(() {fourthOfferStartingTimeDrop = newValue as String;});},
                                          items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                        ),
                                        Expanded(child: SizedBox(width: 1,)),
                                        Text("End",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(width: 5,),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                          iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                          isExpanded: false,
                                          value: fourthOfferEndTimeDrop,
                                          onChanged: (newValue){setState(() {fourthOfferEndTimeDrop = newValue as String;});},
                                          items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                        ),
                                      ],),),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 100,width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today_outlined,color: Colors.lightBlueAccent,size: 25,),
                                        Expanded(child: SizedBox(width: 1,)),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Sa",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fourthOfferDaySat, onChanged: (value){setState(() {this.fourthOfferDaySat = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Su",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fourthOfferDaySun, onChanged: (value){setState(() {this.fourthOfferDaySun = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Mo",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fourthOfferDayMon, onChanged: (value){setState(() {this.fourthOfferDayMon = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Tu",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fourthOfferDayTus, onChanged: (value){setState(() {this.fourthOfferDayTus = value!;});}, activeColor: Colors.lightBlueAccent,),
                                              ],),
                                            Row(
                                              children: [
                                                Text("We",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fourthOfferDayWed, onChanged: (value){setState(() {this.fourthOfferDayWed = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Th",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fourthOfferDayThu, onChanged: (value){setState(() {this.fourthOfferDayThu = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Fr",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fourthOfferDayFri, onChanged: (value){setState(() {this.fourthOfferDayFri = value!;});}, activeColor: Colors.lightBlueAccent,),
                                              ],),],),],),),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child:
                                    Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Text("Offer Filters",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(height: 8,),
                                        Row(
                                          children: [
                                            Text("Shisha Offer",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fourthOfferShishaOffer, onChanged: (value){setState(() {this.fourthOfferShishaOffer = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Delivery",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fourthOfferDelivery, onChanged: (value){setState(() {this.fourthOfferDelivery = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Buffet",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fourthOfferBuffet, onChanged: (value){setState(() {this.fourthOfferBuffet = value!;});},activeColor: Colors.lightBlueAccent,),
                                          ],),
                                        Row(
                                          children: [
                                            Text("Breakfast",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fourthOfferBreakfast, onChanged: (value){setState(() {this.fourthOfferBreakfast = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Lunch",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fourthOfferLunch, onChanged: (value){setState(() {this.fourthOfferLunch = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Dinner",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fourthOfferDinner, onChanged: (value){setState(() {this.fourthOfferDinner = value!;});},activeColor: Colors.lightBlueAccent,),
                                          ],),
                                      ],),),
//Active Time
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Column(
                                      children: [
                                        Text ('Active Time',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: TextFormField(
                                                maxLength: 2,
                                                controller: fourthOfferActiveStartController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {fourthOfferActiveStartController.text = (value);},
                                                validator: (value) {
                                                  if (value!.length<2) {
                                                    return 'you must fill 2 digits';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent,
                                                cursorHeight: 20,
                                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Start',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Flexible(
                                              child: TextFormField(
                                                maxLength: 2,
                                                controller: fourthOfferActiveEndController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {fourthOfferActiveEndController.text = (value);},
                                                validator: (value) {
                                                  if (value!.length<2) {
                                                    return 'you must fill 2 digits';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent,
                                                cursorHeight: 20,
                                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'End',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              ),
                                            ),

                                          ],),
                                      ],
                                    ),),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Column(
                                        children: [

                                          Row(
                                            children: [
                                              Text("Wein Offer",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                              SizedBox(width: 5,),
                                              Text("(if this offer available to sale click)",style: TextStyle(color: Colors.grey[600],fontSize: 11),),

                                              Checkbox(value: fourthOfferWeinOffer, onChanged: (value){setState(() {this.fourthOfferWeinOffer = value!;});},
                                                activeColor: Colors.lightBlueAccent,),
                                            ],),
                                          Container(
                                            child:
                                            fourthOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 20,
                                              controller: fourthOfferButtonTextController,
                                              keyboardType: TextInputType.name,
                                              onFieldSubmitted: (value) {fourthOfferButtonTextController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill text showing in button';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Button Text',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),
                                          Container(
                                            child:
                                            fourthOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 30,
                                              controller: fourthOfferSellingPriceController,
                                              keyboardType: TextInputType.number,
                                              onFieldSubmitted: (value) {fourthOfferSellingPriceController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill Selling Price';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Price',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),
                                          Container(
                                            child:
                                            fourthOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 10,
                                              controller: fourthOfferMaxSaleController,
                                              keyboardType: TextInputType.number,
                                              onFieldSubmitted: (value) {fourthOfferMaxSaleController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill Max salable offers';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Max salable offers',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),

                                        ]),
                                  ),
                                  SizedBox(height: 10,),

                                  SizedBox(height: 20,),
                                ])
                                :SizedBox(height: 0,),
                          ),
                        ],),
                    )
                        :SizedBox(height: 0,),
//thaer (add fifth offer)---------------------------------
                    fourthOffer != false
                        ?
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.amber, width: 2),),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_circle_outlined,size: 30,color: Colors.lime,),
                              Text(" Add Offer ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                              Text("(to add new offer click on check box)",style: TextStyle(color: Colors.grey,fontSize: 11),),
                              Checkbox(value: fifthOffer, onChanged: (value){setState(() {this.fifthOffer = value!;});},
                                activeColor: Colors.lightBlueAccent,),
                            ],),
                          Container(
                            child:
                            fifthOffer != false
                                ?
                            Column(
                                children: [
                                  SizedBox(height: 8,),
                                  GestureDetector(
                                    onTap: (){getfifthOfferImage();},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 150,
                                      width: 150,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                                      child:
                                      _fifthOfferImage != null
                                          ?
                                      Image.file(_fifthOfferImage!, fit:BoxFit.fill,)
                                          :
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image_outlined,size: 60,color:Colors.lightBlueAccent,),
                                          SizedBox(height: 20,),
                                          Text('Click to select offer image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),)],),
                                    ),
                                  ),
                                  TextFormField(
                                    maxLength: 70,
                                    maxLines: 2,
                                    controller: fifthOfferDetailsController,
                                    keyboardType: TextInputType.name,
                                    onFieldSubmitted: (value) {fifthOfferDetailsController.text = (value);},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'you must fill Offer Details';
                                      }return null;
                                    },
                                    cursorColor: Colors.lightBlueAccent,
                                    cursorHeight: 30,
                                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      labelText: 'Offer Details',
                                      labelStyle: TextStyle(color: Colors.grey),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                      prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    height: 60,width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Row(
                                      children: [
                                        Icon(Icons.schedule_outlined,color: Colors.lightBlueAccent,size: 25,),
                                        SizedBox(width: 10,),
                                        Text("Start",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(width: 5,),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                          iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                          isExpanded: false,
                                          value: fifthOfferStartingTimeDrop,
                                          onChanged: (newValue){setState(() {fifthOfferStartingTimeDrop = newValue as String;});},
                                          items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                        ),
                                        Expanded(child: SizedBox(width: 1,)),
                                        Text("End",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(width: 5,),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                          iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                          isExpanded: false,
                                          value: fifthOfferEndTimeDrop,
                                          onChanged: (newValue){setState(() {fifthOfferEndTimeDrop = newValue as String;});},
                                          items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                        ),
                                      ],),),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 100,width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today_outlined,color: Colors.lightBlueAccent,size: 25,),
                                        Expanded(child: SizedBox(width: 1,)),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Sa",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDaySat, onChanged: (value){setState(() {this.fifthOfferDaySat = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Su",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDaySun, onChanged: (value){setState(() {this.fifthOfferDaySun = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Mo",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayMon, onChanged: (value){setState(() {this.fifthOfferDayMon = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Tu",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayTus, onChanged: (value){setState(() {this.fifthOfferDayTus = value!;});}, activeColor: Colors.lightBlueAccent,),
                                              ],),
                                            Row(
                                              children: [
                                                Text("We",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayWed, onChanged: (value){setState(() {this.fifthOfferDayWed = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Th",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayThu, onChanged: (value){setState(() {this.fifthOfferDayThu = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Fr",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayFri, onChanged: (value){setState(() {this.fifthOfferDayFri = value!;});}, activeColor: Colors.lightBlueAccent,),
                                              ],),],),],),),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child:
                                    Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Text("Offer Filters",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(height: 8,),
                                        Row(
                                          children: [
                                            Text("Shisha Offer",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferShishaOffer, onChanged: (value){setState(() {this.fifthOfferShishaOffer = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Delivery",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferDelivery, onChanged: (value){setState(() {this.fifthOfferDelivery = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Buffet",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferBuffet, onChanged: (value){setState(() {this.fifthOfferBuffet = value!;});},activeColor: Colors.lightBlueAccent,),
                                          ],),
                                        Row(
                                          children: [
                                            Text("Breakfast",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferBreakfast, onChanged: (value){setState(() {this.fifthOfferBreakfast = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Lunch",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferLunch, onChanged: (value){setState(() {this.fifthOfferLunch = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Dinner",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferDinner, onChanged: (value){setState(() {this.fifthOfferDinner = value!;});},activeColor: Colors.lightBlueAccent,),
                                          ],),
                                      ],),),
//Active Time
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Column(
                                      children: [
                                        Text ('Active Time',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: TextFormField(
                                                maxLength: 2,
                                                controller: fifthOfferActiveStartController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {fifthOfferActiveStartController.text = (value);},
                                                validator: (value) {
                                                  if (value!.length<2) {
                                                    return 'you must fill 2 digits';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent,
                                                cursorHeight: 20,
                                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Start',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Flexible(
                                              child: TextFormField(
                                                maxLength: 2,
                                                controller: fifthOfferActiveEndController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {fifthOfferActiveEndController.text = (value);},
                                                validator: (value) {
                                                  if (value!.length<2) {
                                                    return 'you must fill 2 digits';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent,
                                                cursorHeight: 20,
                                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'End',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              ),
                                            ),

                                          ],),
                                      ],
                                    ),),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Column(
                                        children: [

                                          Row(
                                            children: [
                                              Text("Wein Offer",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                              SizedBox(width: 5,),
                                              Text("(if this offer available to sale click)",style: TextStyle(color: Colors.grey[600],fontSize: 11),),

                                              Checkbox(value: fifthOfferWeinOffer, onChanged: (value){setState(() {this.fifthOfferWeinOffer = value!;});},
                                                activeColor: Colors.lightBlueAccent,),
                                            ],),
                                          Container(
                                            child:
                                            fifthOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 20,
                                              controller: fifthOfferButtonTextController,
                                              keyboardType: TextInputType.name,
                                              onFieldSubmitted: (value) {fifthOfferButtonTextController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill text showing in button';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Button Text',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),
                                          Container(
                                            child:
                                            fifthOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 30,
                                              controller: fifthOfferSellingPriceController,
                                              keyboardType: TextInputType.number,
                                              onFieldSubmitted: (value) {fifthOfferSellingPriceController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill Selling Price';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Price',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),
                                          Container(
                                            child:
                                            fifthOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 10,
                                              controller: fifthOfferMaxSaleController,
                                              keyboardType: TextInputType.number,
                                              onFieldSubmitted: (value) {fifthOfferMaxSaleController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill Max salable offers';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Max salable offers',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),
                                        ]),
                                  ),
                                  SizedBox(height: 10,),

                                  SizedBox(height: 20,),
                                ])
                                :SizedBox(height: 0,),
                          ),
                        ],),
                    )
                        :SizedBox(height: 0,),
//thaer (add sixth offer)---------------------------------
                    fifthOffer != false
                        ?
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.amber, width: 2),),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_circle_outlined,size: 30,color: Colors.lime,),
                              Text(" Add Offer ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                              Text("(to add new offer click on check box)",style: TextStyle(color: Colors.grey,fontSize: 11),),
                              Checkbox(value: fifthOffer, onChanged: (value){setState(() {this.fifthOffer = value!;});},
                                activeColor: Colors.lightBlueAccent,),
                            ],),
                          Container(
                            child:
                            fifthOffer != false
                                ?
                            Column(
                                children: [
                                  SizedBox(height: 8,),
                                  GestureDetector(
                                    onTap: (){getfifthOfferImage();},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 150,
                                      width: 150,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0.0), border: Border.all(color: Colors.lightBlueAccent, width: 3),),
                                      child:
                                      _fifthOfferImage != null
                                          ?
                                      Image.file(_fifthOfferImage!, fit:BoxFit.fill,)
                                          :
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image_outlined,size: 60,color:Colors.lightBlueAccent,),
                                          SizedBox(height: 20,),
                                          Text('Click to select offer image',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),)],),
                                    ),
                                  ),
                                  TextFormField(
                                    maxLength: 70,
                                    maxLines: 2,
                                    controller: fifthOfferDetailsController,
                                    keyboardType: TextInputType.name,
                                    onFieldSubmitted: (value) {fifthOfferDetailsController.text = (value);},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'you must fill Offer Details';
                                      }return null;
                                    },
                                    cursorColor: Colors.lightBlueAccent,
                                    cursorHeight: 30,
                                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      labelText: 'Offer Details',
                                      labelStyle: TextStyle(color: Colors.grey),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                      prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    height: 60,width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Row(
                                      children: [
                                        Icon(Icons.schedule_outlined,color: Colors.lightBlueAccent,size: 25,),
                                        SizedBox(width: 10,),
                                        Text("Start",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(width: 5,),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                          iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                          isExpanded: false,
                                          value: fifthOfferStartingTimeDrop,
                                          onChanged: (newValue){setState(() {fifthOfferStartingTimeDrop = newValue as String;});},
                                          items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                        ),
                                        Expanded(child: SizedBox(width: 1,)),
                                        Text("End",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(width: 5,),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                          iconSize: 50,iconEnabledColor: Colors.lightBlueAccent,
                                          isExpanded: false,
                                          value: fifthOfferEndTimeDrop,
                                          onChanged: (newValue){setState(() {fifthOfferEndTimeDrop = newValue as String;});},
                                          items: restaurantTimeList.map((valueItem) {return DropdownMenuItem(value: valueItem, child: Text(valueItem),);}).toList(),
                                        ),
                                      ],),),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 100,width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today_outlined,color: Colors.lightBlueAccent,size: 25,),
                                        Expanded(child: SizedBox(width: 1,)),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Sa",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDaySat, onChanged: (value){setState(() {this.fifthOfferDaySat = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Su",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDaySun, onChanged: (value){setState(() {this.fifthOfferDaySun = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Mo",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayMon, onChanged: (value){setState(() {this.fifthOfferDayMon = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Tu",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayTus, onChanged: (value){setState(() {this.fifthOfferDayTus = value!;});}, activeColor: Colors.lightBlueAccent,),
                                              ],),
                                            Row(
                                              children: [
                                                Text("We",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayWed, onChanged: (value){setState(() {this.fifthOfferDayWed = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Th",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayThu, onChanged: (value){setState(() {this.fifthOfferDayThu = value!;});}, activeColor: Colors.lightBlueAccent,),
                                                Text("Fr",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                                                Checkbox(value: fifthOfferDayFri, onChanged: (value){setState(() {this.fifthOfferDayFri = value!;});}, activeColor: Colors.lightBlueAccent,),
                                              ],),],),],),),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child:
                                    Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Text("Offer Filters",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        SizedBox(height: 8,),
                                        Row(
                                          children: [
                                            Text("Shisha Offer",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferShishaOffer, onChanged: (value){setState(() {this.fifthOfferShishaOffer = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Delivery",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferDelivery, onChanged: (value){setState(() {this.fifthOfferDelivery = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Buffet",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferBuffet, onChanged: (value){setState(() {this.fifthOfferBuffet = value!;});},activeColor: Colors.lightBlueAccent,),
                                          ],),
                                        Row(
                                          children: [
                                            Text("Breakfast",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferBreakfast, onChanged: (value){setState(() {this.fifthOfferBreakfast = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Lunch",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferLunch, onChanged: (value){setState(() {this.fifthOfferLunch = value!;});},activeColor: Colors.lightBlueAccent,),
                                            Expanded(child: SizedBox(width: 10,)),
                                            Text("Dinner",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                            Checkbox(value: fifthOfferDinner, onChanged: (value){setState(() {this.fifthOfferDinner = value!;});},activeColor: Colors.lightBlueAccent,),
                                          ],),
                                      ],),),
//Active Time
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Column(
                                      children: [
                                        Text ('Active Time',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: TextFormField(
                                                maxLength: 2,
                                                controller: fifthOfferActiveStartController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {fifthOfferActiveStartController.text = (value);},
                                                validator: (value) {
                                                  if (value!.length<2) {
                                                    return 'you must fill 2 digits';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent,
                                                cursorHeight: 20,
                                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'Start',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Flexible(
                                              child: TextFormField(
                                                maxLength: 2,
                                                controller: fifthOfferActiveEndController,
                                                keyboardType: TextInputType.number,
                                                onFieldSubmitted: (value) {fifthOfferActiveEndController.text = (value);},
                                                validator: (value) {
                                                  if (value!.length<2) {
                                                    return 'you must fill 2 digits';
                                                  }return null;
                                                },
                                                cursorColor: Colors.lightBlueAccent,
                                                cursorHeight: 20,
                                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(
                                                  labelText: 'End',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                  prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                              ),
                                            ),

                                          ],),
                                      ],
                                    ),),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Colors.lightBlueAccent, width: 0.5),),
                                    child: Column(
                                        children: [

                                          Row(
                                            children: [
                                              Text("Wein Offer",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                              SizedBox(width: 5,),
                                              Text("(if this offer available to sale click)",style: TextStyle(color: Colors.grey[600],fontSize: 11),),

                                              Checkbox(value: fifthOfferWeinOffer, onChanged: (value){setState(() {this.fifthOfferWeinOffer = value!;});},
                                                activeColor: Colors.lightBlueAccent,),
                                            ],),
                                          Container(
                                            child:
                                            fifthOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 20,
                                              controller: fifthOfferButtonTextController,
                                              keyboardType: TextInputType.name,
                                              onFieldSubmitted: (value) {fifthOfferButtonTextController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill text showing in button';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Button Text',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),
                                          Container(
                                            child:
                                            fifthOfferWeinOffer != false
                                                ?
                                            TextFormField(
                                              maxLength: 30,
                                              controller: fifthOfferSellingPriceController,
                                              keyboardType: TextInputType.number,
                                              onFieldSubmitted: (value) {fifthOfferSellingPriceController.text = (value);},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'you must fill Selling Price';
                                                }return null;
                                              },
                                              cursorColor: Colors.lightBlueAccent, cursorHeight: 30,
                                              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                labelText: 'Price',
                                                labelStyle: TextStyle(color: Colors.grey),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),),
                                                prefixIcon: Icon(Icons.border_color_outlined, color: Colors.lightBlueAccent,),),
                                            )
                                                :
                                            SizedBox(width: 1,),
                                          ),
                                        ]),
                                  ),
                                  SizedBox(height: 10,),

                                  SizedBox(height: 20,),
                                ])
                                :SizedBox(height: 0,),
                          ),
                        ],),
                    )
                        :SizedBox(height: 0,),

                    SizedBox(height: 20,),
                    Container(width: double.infinity, height: 60.0, color: Colors.lightBlueAccent,
                      child: MaterialButton(
                        child: Text('Add Restaurant', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
//1111111111777
                      onPressed: () async{
//thaer(validation of restaurant elements)-------------------------------------------------------------------------------
//     if (_globalKey.currentState!.validate()& (_restaurantMainImage != null) ) {

                            if (_globalKey.currentState!.validate() ) {
                            _storeRestaurants.loadingAlert(context);
                            _globalKey.currentState!.save();

//thaer(validation of restaurant main image)-------------------------------------------------------------------------------
                            final restaurantMainImageName = basename(_restaurantMainImage!.path.toString());
                            var restaurantMainImageStorageImage = FirebaseStorage.instance.ref().child('Restaurants/$restaurantMainImageName');
                            var restaurantMainImageTask = restaurantMainImageStorageImage.putFile(_restaurantMainImage!);
                            var _restaurantMainImageUrl = await (await restaurantMainImageTask).ref.getDownloadURL();

//thaer(add restaurant elements to firestore in restaurant category)-------------------------------------------------------------------------------
                            _storeRestaurants.addRestaurant(ModelRestaurants(

                              restaurantId: "",
                              restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                              restaurantMainImage: _restaurantMainImageUrl.toString(),
                              rater: rateValue.toString(),
                              cuisine : cuisineController.text,
                              address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                              openTime : openTimeDrop,
                              closeTime : closeTimeDrop,
                              shisha : shisha ,
                              playingCard : playingCard ,
                              nonSmoking :nonSmoking  ,
                              liveMusic : liveMusic,
                              sportScreen : sportScreen ,
                              outdoor : outdoor ,
                              acceptedCard : acceptedCard ,
                              kidsFriendly : kidsFriendly ,
                              valetParking :  valetParking,
                              birthdayParty : birthdayParty ,

                              mainOffer: mainOffer,
                              mainOfferImage: '',
                              mainOfferDetails: mainOfferDetailsController.text,
                              mainOfferStartingTime : mainOfferStartingTimeDrop,
                              mainOfferEndTime : mainOfferEndTimeDrop,
                              mainOfferDaySat : mainOfferDaySat,
                              mainOfferDaySun : mainOfferDaySun,
                              mainOfferDayMon :mainOfferDayMon,
                              mainOfferDayTus : mainOfferDayTus,
                              mainOfferDayWed :mainOfferDayWed,
                              mainOfferDayThu :mainOfferDayThu,
                              mainOfferDayFri : mainOfferDayFri,
                              mainOfferBreakfast :mainOfferBreakfast ,
                              mainOfferLunch :mainOfferLunch ,
                              mainOfferDinner : mainOfferDinner ,
                              mainOfferShishaOffer : mainOfferShishaOffer ,
                              mainOfferDelivery : mainOfferDelivery ,
                              mainOfferBuffet : mainOfferBuffet  ,
                              mainOfferWeinOffer: mainOfferWeinOffer,
                              mainOfferButtonText : mainOfferButtonTextController.text ,
                              mainOfferSellingPrice : mainOfferSellingPriceController.text,
                              mainOfferMaxSale : mainOfferMaxSaleController.text,
                              mainOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                              mainOfferActiveStart: mainOfferActiveStartController.text,
                              mainOfferActiveEnd: mainOfferActiveEndController.text,


                              secondOffer: secondOffer,
                              secondOfferImage: '',
                              secondOfferDetails: secondOfferDetailsController.text,
                              secondOfferStartingTime : secondOfferStartingTimeDrop,
                              secondOfferEndTime : secondOfferEndTimeDrop,
                              secondOfferDaySat : secondOfferDaySat,
                              secondOfferDaySun : secondOfferDaySun,
                              secondOfferDayMon :secondOfferDayMon,
                              secondOfferDayTus : secondOfferDayTus,
                              secondOfferDayWed :secondOfferDayWed,
                              secondOfferDayThu :secondOfferDayThu,
                              secondOfferDayFri : secondOfferDayFri,
                              secondOfferBreakfast :secondOfferBreakfast ,
                              secondOfferLunch :secondOfferLunch ,
                              secondOfferDinner : secondOfferDinner ,
                              secondOfferShishaOffer : secondOfferShishaOffer ,
                              secondOfferDelivery : secondOfferDelivery ,
                              secondOfferBuffet : secondOfferBuffet  ,
                              secondOfferWeinOffer: secondOfferWeinOffer,
                              secondOfferButtonText : secondOfferButtonTextController.text ,
                              secondOfferSellingPrice : secondOfferSellingPriceController.text,
                              secondOfferMaxSale : secondOfferMaxSaleController.text,
                              secondOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                              secondOfferActiveStart: secondOfferActiveStartController.text,
                              secondOfferActiveEnd: secondOfferActiveEndController.text,

                              thirdOffer: thirdOffer,
                              thirdOfferImage: '',
                              thirdOfferDetails: thirdOfferDetailsController.text,
                              thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                              thirdOfferEndTime : thirdOfferEndTimeDrop,
                              thirdOfferDaySat : thirdOfferDaySat,
                              thirdOfferDaySun : thirdOfferDaySun,
                              thirdOfferDayMon :thirdOfferDayMon,
                              thirdOfferDayTus : thirdOfferDayTus,
                              thirdOfferDayWed :thirdOfferDayWed,
                              thirdOfferDayThu :thirdOfferDayThu,
                              thirdOfferDayFri : thirdOfferDayFri,
                              thirdOfferBreakfast :thirdOfferBreakfast ,
                              thirdOfferLunch :thirdOfferLunch ,
                              thirdOfferDinner : thirdOfferDinner ,
                              thirdOfferShishaOffer : thirdOfferShishaOffer ,
                              thirdOfferDelivery : thirdOfferDelivery ,
                              thirdOfferBuffet : thirdOfferBuffet  ,
                              thirdOfferWeinOffer: thirdOfferWeinOffer,
                              thirdOfferButtonText : thirdOfferButtonTextController.text ,
                              thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                              fourthOffer: fourthOffer,
                              fourthOfferImage: '',
                              fourthOfferDetails: fourthOfferDetailsController.text,
                              fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                              fourthOfferEndTime : fourthOfferEndTimeDrop,
                              fourthOfferDaySat : fourthOfferDaySat,
                              fourthOfferDaySun : fourthOfferDaySun,
                              fourthOfferDayMon :fourthOfferDayMon,
                              fourthOfferDayTus : fourthOfferDayTus,
                              fourthOfferDayWed :fourthOfferDayWed,
                              fourthOfferDayThu :fourthOfferDayThu,
                              fourthOfferDayFri : fourthOfferDayFri,
                              fourthOfferBreakfast :fourthOfferBreakfast ,
                              fourthOfferLunch :fourthOfferLunch ,
                              fourthOfferDinner : fourthOfferDinner ,
                              fourthOfferShishaOffer : fourthOfferShishaOffer ,
                              fourthOfferDelivery : fourthOfferDelivery ,
                              fourthOfferBuffet : fourthOfferBuffet  ,
                              fourthOfferWeinOffer: fourthOfferWeinOffer,
                              fourthOfferButtonText : fourthOfferButtonTextController.text ,
                              fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                              fourthOfferActiveStart: fourthOfferActiveStartController.text,
                              fourthOfferActiveEnd: fourthOfferActiveEndController.text,

                            ));

                            if (mainOffer == false){_storeRestaurants.successAddAlert(context);}


//thaer(validation of main offer image)-------------------------------------------------------------------------------
                            final mainOfferImageName = basename(_mainOfferImage!.path.toString());
                            var mainOfferStorageImage = FirebaseStorage.instance.ref().child('Restaurants/$mainOfferImageName');
                            var mainOfferStorageImageTask = mainOfferStorageImage.putFile(_mainOfferImage!);
                            var _mainOfferImageUrl = await (await mainOfferStorageImageTask).ref.getDownloadURL();


//thaer(validation of second offer image)-------------------------------------------------------------------------------
                            if(_secondOfferImage==null){
//thaer(add first offer elements to firestore in offer category)-------------------------------------------------------------------------------
                              _storeRestaurants.addOffer(ModelRestaurants(

                                restaurantId: "",
                                restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                restaurantMainImage: _restaurantMainImageUrl.toString(),
                                rater: rateValue.toString(),
                                cuisine : cuisineController.text,
                                address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                openTime : openTimeDrop,
                                closeTime : closeTimeDrop,
                                shisha : shisha ,
                                playingCard : playingCard ,
                                nonSmoking :nonSmoking  ,
                                liveMusic : liveMusic,
                                sportScreen : sportScreen ,
                                outdoor : outdoor ,
                                acceptedCard : acceptedCard ,
                                kidsFriendly : kidsFriendly ,
                                valetParking :  valetParking,
                                birthdayParty : birthdayParty ,

                                mainOffer: mainOffer,
                                mainOfferImage: _mainOfferImageUrl.toString(),
                                mainOfferDetails: mainOfferDetailsController.text,
                                mainOfferStartingTime : mainOfferStartingTimeDrop,
                                mainOfferEndTime : mainOfferEndTimeDrop,
                                mainOfferDaySat : mainOfferDaySat,
                                mainOfferDaySun : mainOfferDaySun,
                                mainOfferDayMon :mainOfferDayMon,
                                mainOfferDayTus : mainOfferDayTus,
                                mainOfferDayWed :mainOfferDayWed,
                                mainOfferDayThu :mainOfferDayThu,
                                mainOfferDayFri : mainOfferDayFri,
                                mainOfferBreakfast :mainOfferBreakfast ,
                                mainOfferLunch :mainOfferLunch ,
                                mainOfferDinner : mainOfferDinner ,
                                mainOfferShishaOffer : mainOfferShishaOffer ,
                                mainOfferDelivery : mainOfferDelivery ,
                                mainOfferBuffet : mainOfferBuffet  ,
                                mainOfferWeinOffer: mainOfferWeinOffer,
                                mainOfferButtonText : mainOfferButtonTextController.text ,
                               mainOfferSellingPrice : mainOfferSellingPriceController.text,
                              mainOfferMaxSale : mainOfferMaxSaleController.text,
                              mainOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                              mainOfferActiveStart: mainOfferActiveStartController.text,
                              mainOfferActiveEnd: mainOfferActiveEndController.text,

                                secondOffer: secondOffer,
                                secondOfferImage: '',
                                secondOfferDetails: secondOfferDetailsController.text,
                                secondOfferStartingTime : secondOfferStartingTimeDrop,
                                secondOfferEndTime : secondOfferEndTimeDrop,
                                secondOfferDaySat : secondOfferDaySat,
                                secondOfferDaySun : secondOfferDaySun,
                                secondOfferDayMon :secondOfferDayMon,
                                secondOfferDayTus : secondOfferDayTus,
                                secondOfferDayWed :secondOfferDayWed,
                                secondOfferDayThu :secondOfferDayThu,
                                secondOfferDayFri : secondOfferDayFri,
                                secondOfferBreakfast :secondOfferBreakfast ,
                                secondOfferLunch :secondOfferLunch ,
                                secondOfferDinner : secondOfferDinner ,
                                secondOfferShishaOffer : secondOfferShishaOffer ,
                                secondOfferDelivery : secondOfferDelivery ,
                                secondOfferBuffet : secondOfferBuffet  ,
                                secondOfferWeinOffer: secondOfferWeinOffer,
                                secondOfferButtonText : secondOfferButtonTextController.text ,
                                secondOfferSellingPrice : secondOfferSellingPriceController.text,
                              secondOfferMaxSale : secondOfferMaxSaleController.text,
                              secondOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                              secondOfferActiveStart: secondOfferActiveStartController.text,
                              secondOfferActiveEnd: secondOfferActiveEndController.text,

                                thirdOffer: thirdOffer,
                                thirdOfferImage: '',
                                thirdOfferDetails: thirdOfferDetailsController.text,
                                thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                                thirdOfferEndTime : thirdOfferEndTimeDrop,
                                thirdOfferDaySat : thirdOfferDaySat,
                                thirdOfferDaySun : thirdOfferDaySun,
                                thirdOfferDayMon :thirdOfferDayMon,
                                thirdOfferDayTus : thirdOfferDayTus,
                                thirdOfferDayWed :thirdOfferDayWed,
                                thirdOfferDayThu :thirdOfferDayThu,
                                thirdOfferDayFri : thirdOfferDayFri,
                                thirdOfferBreakfast :thirdOfferBreakfast ,
                                thirdOfferLunch :thirdOfferLunch ,
                                thirdOfferDinner : thirdOfferDinner ,
                                thirdOfferShishaOffer : thirdOfferShishaOffer ,
                                thirdOfferDelivery : thirdOfferDelivery ,
                                thirdOfferBuffet : thirdOfferBuffet  ,
                                thirdOfferWeinOffer: thirdOfferWeinOffer,
                                thirdOfferButtonText : thirdOfferButtonTextController.text ,
                                thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                                fourthOffer: fourthOffer,
                                fourthOfferImage: '',
                                fourthOfferDetails: fourthOfferDetailsController.text,
                                fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                fourthOfferEndTime : fourthOfferEndTimeDrop,
                                fourthOfferDaySat : fourthOfferDaySat,
                                fourthOfferDaySun : fourthOfferDaySun,
                                fourthOfferDayMon :fourthOfferDayMon,
                                fourthOfferDayTus : fourthOfferDayTus,
                                fourthOfferDayWed :fourthOfferDayWed,
                                fourthOfferDayThu :fourthOfferDayThu,
                                fourthOfferDayFri : fourthOfferDayFri,
                                fourthOfferBreakfast :fourthOfferBreakfast ,
                                fourthOfferLunch :fourthOfferLunch ,
                                fourthOfferDinner : fourthOfferDinner ,
                                fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                fourthOfferDelivery : fourthOfferDelivery ,
                                fourthOfferBuffet : fourthOfferBuffet  ,
                                fourthOfferWeinOffer: fourthOfferWeinOffer,
                                fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                fourthOfferActiveEnd: fourthOfferActiveEndController.text,

                              ));
                              if (secondOffer == false){_storeRestaurants.successAddAlert(context);}

                            }else{
                            final secondOfferImageName = basename(_secondOfferImage!.path.toString());
                            var secondOfferStorageImage = FirebaseStorage.instance.ref().child('Restaurants/$secondOfferImageName');
                            var secondOfferStorageImageTask = secondOfferStorageImage.putFile(_secondOfferImage!);
                            var _secondOfferImageUrl = await (await secondOfferStorageImageTask).ref.getDownloadURL();

//thaer(add first offer elements to firestore in offer category)-------------------------------------------------------------------------------
                            _storeRestaurants.addOffer(ModelRestaurants(

                              restaurantId: "",
                              restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                              restaurantMainImage: _restaurantMainImageUrl.toString(),
                              rater: rateValue.toString(),
                              cuisine : cuisineController.text,
                              address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                              openTime : openTimeDrop,
                              closeTime : closeTimeDrop,
                              shisha : shisha ,
                              playingCard : playingCard ,
                              nonSmoking :nonSmoking  ,
                              liveMusic : liveMusic,
                              sportScreen : sportScreen ,
                              outdoor : outdoor ,
                              acceptedCard : acceptedCard ,
                              kidsFriendly : kidsFriendly ,
                              valetParking :  valetParking,
                              birthdayParty : birthdayParty ,

                              mainOffer: mainOffer,
                              mainOfferImage: _mainOfferImageUrl.toString(),
                              mainOfferDetails: mainOfferDetailsController.text,
                              mainOfferStartingTime : mainOfferStartingTimeDrop,
                              mainOfferEndTime : mainOfferEndTimeDrop,
                              mainOfferDaySat : mainOfferDaySat,
                              mainOfferDaySun : mainOfferDaySun,
                              mainOfferDayMon :mainOfferDayMon,
                              mainOfferDayTus : mainOfferDayTus,
                              mainOfferDayWed :mainOfferDayWed,
                              mainOfferDayThu :mainOfferDayThu,
                              mainOfferDayFri : mainOfferDayFri,
                              mainOfferBreakfast :mainOfferBreakfast ,
                              mainOfferLunch :mainOfferLunch ,
                              mainOfferDinner : mainOfferDinner ,
                              mainOfferShishaOffer : mainOfferShishaOffer ,
                              mainOfferDelivery : mainOfferDelivery ,
                              mainOfferBuffet : mainOfferBuffet  ,
                              mainOfferWeinOffer: mainOfferWeinOffer,
                              mainOfferButtonText : mainOfferButtonTextController.text ,
                             mainOfferSellingPrice : mainOfferSellingPriceController.text,
                              mainOfferMaxSale : mainOfferMaxSaleController.text,
                              mainOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                              mainOfferActiveStart: mainOfferActiveStartController.text,
                              mainOfferActiveEnd: mainOfferActiveEndController.text,

                              secondOffer: secondOffer,
                              secondOfferImage: _secondOfferImageUrl.toString(),
                              secondOfferDetails: secondOfferDetailsController.text,
                              secondOfferStartingTime : secondOfferStartingTimeDrop,
                              secondOfferEndTime : secondOfferEndTimeDrop,
                              secondOfferDaySat : secondOfferDaySat,
                              secondOfferDaySun : secondOfferDaySun,
                              secondOfferDayMon :secondOfferDayMon,
                              secondOfferDayTus : secondOfferDayTus,
                              secondOfferDayWed :secondOfferDayWed,
                              secondOfferDayThu :secondOfferDayThu,
                              secondOfferDayFri : secondOfferDayFri,
                              secondOfferBreakfast :secondOfferBreakfast ,
                              secondOfferLunch :secondOfferLunch ,
                              secondOfferDinner : secondOfferDinner ,
                              secondOfferShishaOffer : secondOfferShishaOffer ,
                              secondOfferDelivery : secondOfferDelivery ,
                              secondOfferBuffet : secondOfferBuffet  ,
                              secondOfferWeinOffer: secondOfferWeinOffer,
                              secondOfferButtonText : secondOfferButtonTextController.text ,
                              secondOfferSellingPrice : secondOfferSellingPriceController.text,
                              secondOfferMaxSale : secondOfferMaxSaleController.text,
                              secondOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                              secondOfferActiveStart: secondOfferActiveStartController.text,
                              secondOfferActiveEnd: secondOfferActiveEndController.text,

                              thirdOffer: thirdOffer,
                              thirdOfferImage: '',
                              thirdOfferDetails: thirdOfferDetailsController.text,
                              thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                              thirdOfferEndTime : thirdOfferEndTimeDrop,
                              thirdOfferDaySat : thirdOfferDaySat,
                              thirdOfferDaySun : thirdOfferDaySun,
                              thirdOfferDayMon :thirdOfferDayMon,
                              thirdOfferDayTus : thirdOfferDayTus,
                              thirdOfferDayWed :thirdOfferDayWed,
                              thirdOfferDayThu :thirdOfferDayThu,
                              thirdOfferDayFri : thirdOfferDayFri,
                              thirdOfferBreakfast :thirdOfferBreakfast ,
                              thirdOfferLunch :thirdOfferLunch ,
                              thirdOfferDinner : thirdOfferDinner ,
                              thirdOfferShishaOffer : thirdOfferShishaOffer ,
                              thirdOfferDelivery : thirdOfferDelivery ,
                              thirdOfferBuffet : thirdOfferBuffet  ,
                              thirdOfferWeinOffer: thirdOfferWeinOffer,
                              thirdOfferButtonText : thirdOfferButtonTextController.text ,
                              thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                              fourthOffer: fourthOffer,
                              fourthOfferImage: '',
                              fourthOfferDetails: fourthOfferDetailsController.text,
                              fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                              fourthOfferEndTime : fourthOfferEndTimeDrop,
                              fourthOfferDaySat : fourthOfferDaySat,
                              fourthOfferDaySun : fourthOfferDaySun,
                              fourthOfferDayMon :fourthOfferDayMon,
                              fourthOfferDayTus : fourthOfferDayTus,
                              fourthOfferDayWed :fourthOfferDayWed,
                              fourthOfferDayThu :fourthOfferDayThu,
                              fourthOfferDayFri : fourthOfferDayFri,
                              fourthOfferBreakfast :fourthOfferBreakfast ,
                              fourthOfferLunch :fourthOfferLunch ,
                              fourthOfferDinner : fourthOfferDinner ,
                              fourthOfferShishaOffer : fourthOfferShishaOffer ,
                              fourthOfferDelivery : fourthOfferDelivery ,
                              fourthOfferBuffet : fourthOfferBuffet  ,
                              fourthOfferWeinOffer: fourthOfferWeinOffer,
                              fourthOfferButtonText : fourthOfferButtonTextController.text ,
                              fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                              fourthOfferActiveStart: fourthOfferActiveStartController.text,
                              fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                            ));
                            if (secondOffer == false){_storeRestaurants.successAddAlert(context);}



//thaer(validation of third offer image)-------------------------------------------------------------------------------
                              if(_thirdOfferImage==null){
//thaer(add first offer elements to firestore in offer category)-------------------------------------------------------------------------------
                                _storeRestaurants.addOffer(ModelRestaurants(

                                  restaurantId: "",
                                  restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                  restaurantMainImage: _restaurantMainImageUrl.toString(),
                                  rater: rateValue.toString(),
                                  cuisine : cuisineController.text,
                                  address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                  openTime : openTimeDrop,
                                  closeTime : closeTimeDrop,
                                  shisha : shisha ,
                                  playingCard : playingCard ,
                                  nonSmoking :nonSmoking  ,
                                  liveMusic : liveMusic,
                                  sportScreen : sportScreen ,
                                  outdoor : outdoor ,
                                  acceptedCard : acceptedCard ,
                                  kidsFriendly : kidsFriendly ,
                                  valetParking :  valetParking,
                                  birthdayParty : birthdayParty ,

                                  mainOffer: mainOffer,
                                  mainOfferImage: _mainOfferImageUrl.toString(),
                                  mainOfferDetails: mainOfferDetailsController.text,
                                  mainOfferStartingTime : mainOfferStartingTimeDrop,
                                  mainOfferEndTime : mainOfferEndTimeDrop,
                                  mainOfferDaySat : mainOfferDaySat,
                                  mainOfferDaySun : mainOfferDaySun,
                                  mainOfferDayMon :mainOfferDayMon,
                                  mainOfferDayTus : mainOfferDayTus,
                                  mainOfferDayWed :mainOfferDayWed,
                                  mainOfferDayThu :mainOfferDayThu,
                                  mainOfferDayFri : mainOfferDayFri,
                                  mainOfferBreakfast :mainOfferBreakfast ,
                                  mainOfferLunch :mainOfferLunch ,
                                  mainOfferDinner : mainOfferDinner ,
                                  mainOfferShishaOffer : mainOfferShishaOffer ,
                                  mainOfferDelivery : mainOfferDelivery ,
                                  mainOfferBuffet : mainOfferBuffet  ,
                                  mainOfferWeinOffer: mainOfferWeinOffer,
                                  mainOfferButtonText : mainOfferButtonTextController.text ,
                                 mainOfferSellingPrice : mainOfferSellingPriceController.text,
                              mainOfferMaxSale : mainOfferMaxSaleController.text,
                              mainOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                              mainOfferActiveStart: mainOfferActiveStartController.text,
                              mainOfferActiveEnd: mainOfferActiveEndController.text,

                                  secondOffer: secondOffer,
                                  secondOfferImage: _secondOfferImageUrl.toString(),
                                  secondOfferDetails: secondOfferDetailsController.text,
                                  secondOfferStartingTime : secondOfferStartingTimeDrop,
                                  secondOfferEndTime : secondOfferEndTimeDrop,
                                  secondOfferDaySat : secondOfferDaySat,
                                  secondOfferDaySun : secondOfferDaySun,
                                  secondOfferDayMon :secondOfferDayMon,
                                  secondOfferDayTus : secondOfferDayTus,
                                  secondOfferDayWed :secondOfferDayWed,
                                  secondOfferDayThu :secondOfferDayThu,
                                  secondOfferDayFri : secondOfferDayFri,
                                  secondOfferBreakfast :secondOfferBreakfast ,
                                  secondOfferLunch :secondOfferLunch ,
                                  secondOfferDinner : secondOfferDinner ,
                                  secondOfferShishaOffer : secondOfferShishaOffer ,
                                  secondOfferDelivery : secondOfferDelivery ,
                                  secondOfferBuffet : secondOfferBuffet  ,
                                  secondOfferWeinOffer: secondOfferWeinOffer,
                                  secondOfferButtonText : secondOfferButtonTextController.text ,
                                  secondOfferSellingPrice : secondOfferSellingPriceController.text,
                              secondOfferMaxSale : secondOfferMaxSaleController.text,
                              secondOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                              secondOfferActiveStart: secondOfferActiveStartController.text,
                              secondOfferActiveEnd: secondOfferActiveEndController.text,

                                  thirdOffer: thirdOffer,
                                  thirdOfferImage: '',
                                  thirdOfferDetails: thirdOfferDetailsController.text,
                                  thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                                  thirdOfferEndTime : thirdOfferEndTimeDrop,
                                  thirdOfferDaySat : thirdOfferDaySat,
                                  thirdOfferDaySun : thirdOfferDaySun,
                                  thirdOfferDayMon :thirdOfferDayMon,
                                  thirdOfferDayTus : thirdOfferDayTus,
                                  thirdOfferDayWed :thirdOfferDayWed,
                                  thirdOfferDayThu :thirdOfferDayThu,
                                  thirdOfferDayFri : thirdOfferDayFri,
                                  thirdOfferBreakfast :thirdOfferBreakfast ,
                                  thirdOfferLunch :thirdOfferLunch ,
                                  thirdOfferDinner : thirdOfferDinner ,
                                  thirdOfferShishaOffer : thirdOfferShishaOffer ,
                                  thirdOfferDelivery : thirdOfferDelivery ,
                                  thirdOfferBuffet : thirdOfferBuffet  ,
                                  thirdOfferWeinOffer: thirdOfferWeinOffer,
                                  thirdOfferButtonText : thirdOfferButtonTextController.text ,
                                  thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                                  fourthOffer: fourthOffer,
                                  fourthOfferImage: '',
                                  fourthOfferDetails: fourthOfferDetailsController.text,
                                  fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                  fourthOfferEndTime : fourthOfferEndTimeDrop,
                                  fourthOfferDaySat : fourthOfferDaySat,
                                  fourthOfferDaySun : fourthOfferDaySun,
                                  fourthOfferDayMon :fourthOfferDayMon,
                                  fourthOfferDayTus : fourthOfferDayTus,
                                  fourthOfferDayWed :fourthOfferDayWed,
                                  fourthOfferDayThu :fourthOfferDayThu,
                                  fourthOfferDayFri : fourthOfferDayFri,
                                  fourthOfferBreakfast :fourthOfferBreakfast ,
                                  fourthOfferLunch :fourthOfferLunch ,
                                  fourthOfferDinner : fourthOfferDinner ,
                                  fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                  fourthOfferDelivery : fourthOfferDelivery ,
                                  fourthOfferBuffet : fourthOfferBuffet  ,
                                  fourthOfferWeinOffer: fourthOfferWeinOffer,
                                  fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                  fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                  fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                  fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                                ));
                                if (secondOffer == false){_storeRestaurants.successAddAlert(context);}

//thaer(add second offer elements to firestore in offer category)-------------------------------------------------------------------------------
                                _storeRestaurants.addOffer(ModelRestaurants(

                                  restaurantId: "",
                                  restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                  restaurantMainImage: _restaurantMainImageUrl.toString(),
                                  rater: rateValue.toString(),
                                  cuisine : cuisineController.text,
                                  address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                  openTime : openTimeDrop,
                                  closeTime : closeTimeDrop,
                                  shisha : shisha ,
                                  playingCard : playingCard ,
                                  nonSmoking :nonSmoking  ,
                                  liveMusic : liveMusic,
                                  sportScreen : sportScreen ,
                                  outdoor : outdoor ,
                                  acceptedCard : acceptedCard ,
                                  kidsFriendly : kidsFriendly ,
                                  valetParking :  valetParking,
                                  birthdayParty : birthdayParty ,

                                  mainOffer: secondOffer,
                                  mainOfferImage: _secondOfferImageUrl.toString(),
                                  mainOfferDetails: secondOfferDetailsController.text,
                                  mainOfferStartingTime : secondOfferStartingTimeDrop,
                                  mainOfferEndTime : secondOfferEndTimeDrop,
                                  mainOfferDaySat : secondOfferDaySat,
                                  mainOfferDaySun : secondOfferDaySun,
                                  mainOfferDayMon :secondOfferDayMon,
                                  mainOfferDayTus : secondOfferDayTus,
                                  mainOfferDayWed :secondOfferDayWed,
                                  mainOfferDayThu :secondOfferDayThu,
                                  mainOfferDayFri : secondOfferDayFri,
                                  mainOfferBreakfast :secondOfferBreakfast ,
                                  mainOfferLunch :secondOfferLunch ,
                                  mainOfferDinner : secondOfferDinner ,
                                  mainOfferShishaOffer : secondOfferShishaOffer ,
                                  mainOfferDelivery : secondOfferDelivery ,
                                  mainOfferBuffet : secondOfferBuffet  ,
                                  mainOfferWeinOffer: secondOfferWeinOffer,
                                  mainOfferButtonText : secondOfferButtonTextController.text ,
                                  mainOfferSellingPrice : secondOfferSellingPriceController.text,
                                  mainOfferMaxSale : secondOfferMaxSaleController.text,
                                  mainOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                                  mainOfferActiveStart: secondOfferActiveStartController.text,
                                  mainOfferActiveEnd: secondOfferActiveEndController.text,

                                  secondOffer: mainOffer,
                                  secondOfferImage: _mainOfferImageUrl.toString(),
                                  secondOfferDetails: mainOfferDetailsController.text,
                                  secondOfferStartingTime : mainOfferStartingTimeDrop,
                                  secondOfferEndTime : mainOfferEndTimeDrop,
                                  secondOfferDaySat : mainOfferDaySat,
                                  secondOfferDaySun : mainOfferDaySun,
                                  secondOfferDayMon :mainOfferDayMon,
                                  secondOfferDayTus : mainOfferDayTus,
                                  secondOfferDayWed :mainOfferDayWed,
                                  secondOfferDayThu :mainOfferDayThu,
                                  secondOfferDayFri : mainOfferDayFri,
                                  secondOfferBreakfast :mainOfferBreakfast ,
                                  secondOfferLunch :mainOfferLunch ,
                                  secondOfferDinner : mainOfferDinner ,
                                  secondOfferShishaOffer : mainOfferShishaOffer ,
                                  secondOfferDelivery : mainOfferDelivery ,
                                  secondOfferBuffet : mainOfferBuffet  ,
                                  secondOfferWeinOffer: mainOfferWeinOffer,
                                  secondOfferButtonText : mainOfferButtonTextController.text ,
                                  secondOfferSellingPrice : mainOfferSellingPriceController.text,
                                  secondOfferMaxSale : mainOfferMaxSaleController.text,
                                  secondOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                                  secondOfferActiveStart: mainOfferActiveStartController.text,
                                  secondOfferActiveEnd: mainOfferActiveEndController.text,

                                  thirdOffer: thirdOffer,
                                  thirdOfferImage: '',
                                  thirdOfferDetails: thirdOfferDetailsController.text,
                                  thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                                  thirdOfferEndTime : thirdOfferEndTimeDrop,
                                  thirdOfferDaySat : thirdOfferDaySat,
                                  thirdOfferDaySun : thirdOfferDaySun,
                                  thirdOfferDayMon :thirdOfferDayMon,
                                  thirdOfferDayTus : thirdOfferDayTus,
                                  thirdOfferDayWed :thirdOfferDayWed,
                                  thirdOfferDayThu :thirdOfferDayThu,
                                  thirdOfferDayFri : thirdOfferDayFri,
                                  thirdOfferBreakfast :thirdOfferBreakfast ,
                                  thirdOfferLunch :thirdOfferLunch ,
                                  thirdOfferDinner : thirdOfferDinner ,
                                  thirdOfferShishaOffer : thirdOfferShishaOffer ,
                                  thirdOfferDelivery : thirdOfferDelivery ,
                                  thirdOfferBuffet : thirdOfferBuffet  ,
                                  thirdOfferWeinOffer: thirdOfferWeinOffer,
                                  thirdOfferButtonText : thirdOfferButtonTextController.text ,
                                  thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                                  fourthOffer: fourthOffer,
                                  fourthOfferImage: '',
                                  fourthOfferDetails: fourthOfferDetailsController.text,
                                  fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                  fourthOfferEndTime : fourthOfferEndTimeDrop,
                                  fourthOfferDaySat : fourthOfferDaySat,
                                  fourthOfferDaySun : fourthOfferDaySun,
                                  fourthOfferDayMon :fourthOfferDayMon,
                                  fourthOfferDayTus : fourthOfferDayTus,
                                  fourthOfferDayWed :fourthOfferDayWed,
                                  fourthOfferDayThu :fourthOfferDayThu,
                                  fourthOfferDayFri : fourthOfferDayFri,
                                  fourthOfferBreakfast :fourthOfferBreakfast ,
                                  fourthOfferLunch :fourthOfferLunch ,
                                  fourthOfferDinner : fourthOfferDinner ,
                                  fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                  fourthOfferDelivery : fourthOfferDelivery ,
                                  fourthOfferBuffet : fourthOfferBuffet  ,
                                  fourthOfferWeinOffer: fourthOfferWeinOffer,
                                  fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                  fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                  fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                  fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                                ));
                                if (thirdOffer == false){_storeRestaurants.successAddAlert(context);}

                              }else{
                            final thirdOfferImageName = basename(_thirdOfferImage!.path.toString());
                            var thirdOfferStorageImage = FirebaseStorage.instance.ref().child('Restaurants/$thirdOfferImageName');
                            var thirdOfferStorageImageTask = thirdOfferStorageImage.putFile(_thirdOfferImage!);
                            var _thirdOfferImageUrl = await (await thirdOfferStorageImageTask).ref.getDownloadURL();

//thaer(add first offer elements to firestore in offer category)-------------------------------------------------------------------------------
                                _storeRestaurants.addOffer(ModelRestaurants(

                                  restaurantId: "",
                                  restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                  restaurantMainImage: _restaurantMainImageUrl.toString(),
                                  rater: rateValue.toString(),
                                  cuisine : cuisineController.text,
                                  address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                  openTime : openTimeDrop,
                                  closeTime : closeTimeDrop,
                                  shisha : shisha ,
                                  playingCard : playingCard ,
                                  nonSmoking :nonSmoking  ,
                                  liveMusic : liveMusic,
                                  sportScreen : sportScreen ,
                                  outdoor : outdoor ,
                                  acceptedCard : acceptedCard ,
                                  kidsFriendly : kidsFriendly ,
                                  valetParking :  valetParking,
                                  birthdayParty : birthdayParty ,

                                  mainOffer: mainOffer,
                                  mainOfferImage: _mainOfferImageUrl.toString(),
                                  mainOfferDetails: mainOfferDetailsController.text,
                                  mainOfferStartingTime : mainOfferStartingTimeDrop,
                                  mainOfferEndTime : mainOfferEndTimeDrop,
                                  mainOfferDaySat : mainOfferDaySat,
                                  mainOfferDaySun : mainOfferDaySun,
                                  mainOfferDayMon :mainOfferDayMon,
                                  mainOfferDayTus : mainOfferDayTus,
                                  mainOfferDayWed :mainOfferDayWed,
                                  mainOfferDayThu :mainOfferDayThu,
                                  mainOfferDayFri : mainOfferDayFri,
                                  mainOfferBreakfast :mainOfferBreakfast ,
                                  mainOfferLunch :mainOfferLunch ,
                                  mainOfferDinner : mainOfferDinner ,
                                  mainOfferShishaOffer : mainOfferShishaOffer ,
                                  mainOfferDelivery : mainOfferDelivery ,
                                  mainOfferBuffet : mainOfferBuffet  ,
                                  mainOfferWeinOffer: mainOfferWeinOffer,
                                  mainOfferButtonText : mainOfferButtonTextController.text ,
                                 mainOfferSellingPrice : mainOfferSellingPriceController.text,
                              mainOfferMaxSale : mainOfferMaxSaleController.text,
                              mainOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                              mainOfferActiveStart: mainOfferActiveStartController.text,
                              mainOfferActiveEnd: mainOfferActiveEndController.text,

                                  secondOffer: secondOffer,
                                  secondOfferImage: _secondOfferImageUrl.toString(),
                                  secondOfferDetails: secondOfferDetailsController.text,
                                  secondOfferStartingTime : secondOfferStartingTimeDrop,
                                  secondOfferEndTime : secondOfferEndTimeDrop,
                                  secondOfferDaySat : secondOfferDaySat,
                                  secondOfferDaySun : secondOfferDaySun,
                                  secondOfferDayMon :secondOfferDayMon,
                                  secondOfferDayTus : secondOfferDayTus,
                                  secondOfferDayWed :secondOfferDayWed,
                                  secondOfferDayThu :secondOfferDayThu,
                                  secondOfferDayFri : secondOfferDayFri,
                                  secondOfferBreakfast :secondOfferBreakfast ,
                                  secondOfferLunch :secondOfferLunch ,
                                  secondOfferDinner : secondOfferDinner ,
                                  secondOfferShishaOffer : secondOfferShishaOffer ,
                                  secondOfferDelivery : secondOfferDelivery ,
                                  secondOfferBuffet : secondOfferBuffet  ,
                                  secondOfferWeinOffer: secondOfferWeinOffer,
                                  secondOfferButtonText : secondOfferButtonTextController.text ,
                                  secondOfferSellingPrice : secondOfferSellingPriceController.text,
                              secondOfferMaxSale : secondOfferMaxSaleController.text,
                              secondOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                              secondOfferActiveStart: secondOfferActiveStartController.text,
                              secondOfferActiveEnd: secondOfferActiveEndController.text,

                                  thirdOffer: thirdOffer,
                                  thirdOfferImage: _thirdOfferImageUrl.toString(),
                                  thirdOfferDetails: thirdOfferDetailsController.text,
                                  thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                                  thirdOfferEndTime : thirdOfferEndTimeDrop,
                                  thirdOfferDaySat : thirdOfferDaySat,
                                  thirdOfferDaySun : thirdOfferDaySun,
                                  thirdOfferDayMon :thirdOfferDayMon,
                                  thirdOfferDayTus : thirdOfferDayTus,
                                  thirdOfferDayWed :thirdOfferDayWed,
                                  thirdOfferDayThu :thirdOfferDayThu,
                                  thirdOfferDayFri : thirdOfferDayFri,
                                  thirdOfferBreakfast :thirdOfferBreakfast ,
                                  thirdOfferLunch :thirdOfferLunch ,
                                  thirdOfferDinner : thirdOfferDinner ,
                                  thirdOfferShishaOffer : thirdOfferShishaOffer ,
                                  thirdOfferDelivery : thirdOfferDelivery ,
                                  thirdOfferBuffet : thirdOfferBuffet  ,
                                  thirdOfferWeinOffer: thirdOfferWeinOffer,
                                  thirdOfferButtonText : thirdOfferButtonTextController.text ,
                                  thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                                  fourthOffer: fourthOffer,
                                  fourthOfferImage: '',
                                  fourthOfferDetails: fourthOfferDetailsController.text,
                                  fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                  fourthOfferEndTime : fourthOfferEndTimeDrop,
                                  fourthOfferDaySat : fourthOfferDaySat,
                                  fourthOfferDaySun : fourthOfferDaySun,
                                  fourthOfferDayMon :fourthOfferDayMon,
                                  fourthOfferDayTus : fourthOfferDayTus,
                                  fourthOfferDayWed :fourthOfferDayWed,
                                  fourthOfferDayThu :fourthOfferDayThu,
                                  fourthOfferDayFri : fourthOfferDayFri,
                                  fourthOfferBreakfast :fourthOfferBreakfast ,
                                  fourthOfferLunch :fourthOfferLunch ,
                                  fourthOfferDinner : fourthOfferDinner ,
                                  fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                  fourthOfferDelivery : fourthOfferDelivery ,
                                  fourthOfferBuffet : fourthOfferBuffet  ,
                                  fourthOfferWeinOffer: fourthOfferWeinOffer,
                                  fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                  fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                  fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                  fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                                ));
                                if (secondOffer == false){_storeRestaurants.successAddAlert(context);}

//thaer(add second offer elements to firestore in offer category)-------------------------------------------------------------------------------
                              _storeRestaurants.addOffer(ModelRestaurants(

                                restaurantId: "",
                                restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                restaurantMainImage: _restaurantMainImageUrl.toString(),
                                rater: rateValue.toString(),
                                cuisine : cuisineController.text,
                                address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                openTime : openTimeDrop,
                                closeTime : closeTimeDrop,
                                shisha : shisha ,
                                playingCard : playingCard ,
                                nonSmoking :nonSmoking  ,
                                liveMusic : liveMusic,
                                sportScreen : sportScreen ,
                                outdoor : outdoor ,
                                acceptedCard : acceptedCard ,
                                kidsFriendly : kidsFriendly ,
                                valetParking :  valetParking,
                                birthdayParty : birthdayParty ,

                                mainOffer: secondOffer,
                                mainOfferImage: _secondOfferImageUrl.toString(),
                                mainOfferDetails: secondOfferDetailsController.text,
                                mainOfferStartingTime : secondOfferStartingTimeDrop,
                                mainOfferEndTime : secondOfferEndTimeDrop,
                                mainOfferDaySat : secondOfferDaySat,
                                mainOfferDaySun : secondOfferDaySun,
                                mainOfferDayMon :secondOfferDayMon,
                                mainOfferDayTus : secondOfferDayTus,
                                mainOfferDayWed :secondOfferDayWed,
                                mainOfferDayThu :secondOfferDayThu,
                                mainOfferDayFri : secondOfferDayFri,
                                mainOfferBreakfast :secondOfferBreakfast ,
                                mainOfferLunch :secondOfferLunch ,
                                mainOfferDinner : secondOfferDinner ,
                                mainOfferShishaOffer : secondOfferShishaOffer ,
                                mainOfferDelivery : secondOfferDelivery ,
                                mainOfferBuffet : secondOfferBuffet  ,
                                mainOfferWeinOffer: secondOfferWeinOffer,
                                mainOfferButtonText : secondOfferButtonTextController.text ,
                                mainOfferSellingPrice : secondOfferSellingPriceController.text,
                                mainOfferMaxSale : secondOfferMaxSaleController.text,
                                mainOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                                mainOfferActiveStart: secondOfferActiveStartController.text,
                                mainOfferActiveEnd: secondOfferActiveEndController.text,

                                secondOffer: mainOffer,
                                secondOfferImage: _mainOfferImageUrl.toString(),
                                secondOfferDetails: mainOfferDetailsController.text,
                                secondOfferStartingTime : mainOfferStartingTimeDrop,
                                secondOfferEndTime : mainOfferEndTimeDrop,
                                secondOfferDaySat : mainOfferDaySat,
                                secondOfferDaySun : mainOfferDaySun,
                                secondOfferDayMon :mainOfferDayMon,
                                secondOfferDayTus : mainOfferDayTus,
                                secondOfferDayWed :mainOfferDayWed,
                                secondOfferDayThu :mainOfferDayThu,
                                secondOfferDayFri : mainOfferDayFri,
                                secondOfferBreakfast :mainOfferBreakfast ,
                                secondOfferLunch :mainOfferLunch ,
                                secondOfferDinner : mainOfferDinner ,
                                secondOfferShishaOffer : mainOfferShishaOffer ,
                                secondOfferDelivery : mainOfferDelivery ,
                                secondOfferBuffet : mainOfferBuffet  ,
                                secondOfferWeinOffer: mainOfferWeinOffer,
                                secondOfferButtonText : mainOfferButtonTextController.text ,
                                secondOfferSellingPrice : mainOfferSellingPriceController.text,
                                secondOfferMaxSale : mainOfferMaxSaleController.text,
                                secondOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                                secondOfferActiveStart: mainOfferActiveStartController.text,
                                secondOfferActiveEnd: mainOfferActiveEndController.text,

                                thirdOffer: thirdOffer,
                                thirdOfferImage: _thirdOfferImageUrl.toString(),
                                thirdOfferDetails: thirdOfferDetailsController.text,
                                thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                                thirdOfferEndTime : thirdOfferEndTimeDrop,
                                thirdOfferDaySat : thirdOfferDaySat,
                                thirdOfferDaySun : thirdOfferDaySun,
                                thirdOfferDayMon :thirdOfferDayMon,
                                thirdOfferDayTus : thirdOfferDayTus,
                                thirdOfferDayWed :thirdOfferDayWed,
                                thirdOfferDayThu :thirdOfferDayThu,
                                thirdOfferDayFri : thirdOfferDayFri,
                                thirdOfferBreakfast :thirdOfferBreakfast ,
                                thirdOfferLunch :thirdOfferLunch ,
                                thirdOfferDinner : thirdOfferDinner ,
                                thirdOfferShishaOffer : thirdOfferShishaOffer ,
                                thirdOfferDelivery : thirdOfferDelivery ,
                                thirdOfferBuffet : thirdOfferBuffet  ,
                                thirdOfferWeinOffer: thirdOfferWeinOffer,
                                thirdOfferButtonText : thirdOfferButtonTextController.text ,
                                thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                                fourthOffer: fourthOffer,
                                fourthOfferImage: '',
                                fourthOfferDetails: fourthOfferDetailsController.text,
                                fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                fourthOfferEndTime : fourthOfferEndTimeDrop,
                                fourthOfferDaySat : fourthOfferDaySat,
                                fourthOfferDaySun : fourthOfferDaySun,
                                fourthOfferDayMon :fourthOfferDayMon,
                                fourthOfferDayTus : fourthOfferDayTus,
                                fourthOfferDayWed :fourthOfferDayWed,
                                fourthOfferDayThu :fourthOfferDayThu,
                                fourthOfferDayFri : fourthOfferDayFri,
                                fourthOfferBreakfast :fourthOfferBreakfast ,
                                fourthOfferLunch :fourthOfferLunch ,
                                fourthOfferDinner : fourthOfferDinner ,
                                fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                fourthOfferDelivery : fourthOfferDelivery ,
                                fourthOfferBuffet : fourthOfferBuffet  ,
                                fourthOfferWeinOffer: fourthOfferWeinOffer,
                                fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                              ));
                              if (thirdOffer == false){_storeRestaurants.successAddAlert(context);}

//thaer(add third offer elements to firestore in offer category)-------------------------------------------------------------------------------
                            _storeRestaurants.addOffer(ModelRestaurants(

                              restaurantId: "",
                              restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                              restaurantMainImage: _restaurantMainImageUrl.toString(),
                              rater: rateValue.toString(),
                              cuisine : cuisineController.text,
                              address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                              openTime : openTimeDrop,
                              closeTime : closeTimeDrop,
                              shisha : shisha ,
                              playingCard : playingCard ,
                              nonSmoking :nonSmoking  ,
                              liveMusic : liveMusic,
                              sportScreen : sportScreen ,
                              outdoor : outdoor ,
                              acceptedCard : acceptedCard ,
                              kidsFriendly : kidsFriendly ,
                              valetParking :  valetParking,
                              birthdayParty : birthdayParty ,

                              mainOffer: thirdOffer,
                              mainOfferImage: _thirdOfferImageUrl.toString(),
                              mainOfferDetails: thirdOfferDetailsController.text,
                              mainOfferStartingTime : thirdOfferStartingTimeDrop,
                              mainOfferEndTime : thirdOfferEndTimeDrop,
                              mainOfferDaySat : thirdOfferDaySat,
                              mainOfferDaySun : thirdOfferDaySun,
                              mainOfferDayMon :thirdOfferDayMon,
                              mainOfferDayTus : thirdOfferDayTus,
                              mainOfferDayWed :thirdOfferDayWed,
                              mainOfferDayThu :thirdOfferDayThu,
                              mainOfferDayFri : thirdOfferDayFri,
                              mainOfferBreakfast :thirdOfferBreakfast ,
                              mainOfferLunch :thirdOfferLunch ,
                              mainOfferDinner : thirdOfferDinner ,
                              mainOfferShishaOffer : thirdOfferShishaOffer ,
                              mainOfferDelivery : thirdOfferDelivery ,
                              mainOfferBuffet : thirdOfferBuffet  ,
                              mainOfferWeinOffer: thirdOfferWeinOffer,
                              mainOfferButtonText : thirdOfferButtonTextController.text ,
                              mainOfferSellingPrice : thirdOfferSellingPriceController.text,
                              mainOfferMaxSale : thirdOfferMaxSaleController.text,
                              mainOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              mainOfferActiveStart: thirdOfferActiveStartController.text,
                              mainOfferActiveEnd: thirdOfferActiveEndController.text,

                              secondOffer: mainOffer,
                              secondOfferImage: _mainOfferImageUrl.toString(),
                              secondOfferDetails: mainOfferDetailsController.text,
                              secondOfferStartingTime : mainOfferStartingTimeDrop,
                              secondOfferEndTime : mainOfferEndTimeDrop,
                              secondOfferDaySat : mainOfferDaySat,
                              secondOfferDaySun : mainOfferDaySun,
                              secondOfferDayMon :mainOfferDayMon,
                              secondOfferDayTus : mainOfferDayTus,
                              secondOfferDayWed :mainOfferDayWed,
                              secondOfferDayThu :mainOfferDayThu,
                              secondOfferDayFri : mainOfferDayFri,
                              secondOfferBreakfast :mainOfferBreakfast ,
                              secondOfferLunch :mainOfferLunch ,
                              secondOfferDinner : mainOfferDinner ,
                              secondOfferShishaOffer : mainOfferShishaOffer ,
                              secondOfferDelivery : mainOfferDelivery ,
                              secondOfferBuffet : mainOfferBuffet  ,
                              secondOfferWeinOffer: mainOfferWeinOffer,
                              secondOfferButtonText : mainOfferButtonTextController.text ,
                              secondOfferSellingPrice : mainOfferSellingPriceController.text,
                              secondOfferMaxSale : mainOfferMaxSaleController.text,
                              secondOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                              secondOfferActiveStart: mainOfferActiveStartController.text,
                              secondOfferActiveEnd: mainOfferActiveEndController.text,

                              thirdOffer: secondOffer,
                              thirdOfferImage: _secondOfferImageUrl.toString(),
                              thirdOfferDetails: secondOfferDetailsController.text,
                              thirdOfferStartingTime : secondOfferStartingTimeDrop,
                              thirdOfferEndTime : secondOfferEndTimeDrop,
                              thirdOfferDaySat : secondOfferDaySat,
                              thirdOfferDaySun : secondOfferDaySun,
                              thirdOfferDayMon :secondOfferDayMon,
                              thirdOfferDayTus : secondOfferDayTus,
                              thirdOfferDayWed :secondOfferDayWed,
                              thirdOfferDayThu :secondOfferDayThu,
                              thirdOfferDayFri : secondOfferDayFri,
                              thirdOfferBreakfast :secondOfferBreakfast ,
                              thirdOfferLunch :secondOfferLunch ,
                              thirdOfferDinner : secondOfferDinner ,
                              thirdOfferShishaOffer : secondOfferShishaOffer ,
                              thirdOfferDelivery : secondOfferDelivery ,
                              thirdOfferBuffet : secondOfferBuffet  ,
                              thirdOfferWeinOffer: secondOfferWeinOffer,
                              thirdOfferButtonText : secondOfferButtonTextController.text ,
                              thirdOfferSellingPrice : secondOfferSellingPriceController.text,
                              thirdOfferMaxSale : secondOfferMaxSaleController.text,
                              thirdOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                              thirdOfferActiveStart: secondOfferActiveStartController.text,
                              thirdOfferActiveEnd: secondOfferActiveEndController.text,

                              fourthOffer: fourthOffer,
                              fourthOfferImage: '',
                              fourthOfferDetails: fourthOfferDetailsController.text,
                              fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                              fourthOfferEndTime : fourthOfferEndTimeDrop,
                              fourthOfferDaySat : fourthOfferDaySat,
                              fourthOfferDaySun : fourthOfferDaySun,
                              fourthOfferDayMon :fourthOfferDayMon,
                              fourthOfferDayTus : fourthOfferDayTus,
                              fourthOfferDayWed :fourthOfferDayWed,
                              fourthOfferDayThu :fourthOfferDayThu,
                              fourthOfferDayFri : fourthOfferDayFri,
                              fourthOfferBreakfast :fourthOfferBreakfast ,
                              fourthOfferLunch :fourthOfferLunch ,
                              fourthOfferDinner : fourthOfferDinner ,
                              fourthOfferShishaOffer : fourthOfferShishaOffer ,
                              fourthOfferDelivery : fourthOfferDelivery ,
                              fourthOfferBuffet : fourthOfferBuffet  ,
                              fourthOfferWeinOffer: fourthOfferWeinOffer,
                              fourthOfferButtonText : fourthOfferButtonTextController.text ,
                              fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                              fourthOfferActiveStart: fourthOfferActiveStartController.text,
                              fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                            ));
                            if (fourthOffer == false){_storeRestaurants.successAddAlert(context);}

//thaer(validation of fourth offer image)-------------------------------------------------------------------------------
                                if(_fourthOfferImage==null){

//thaer(add first offer elements to firestore in offer category)-------------------------------------------------------------------------------
                                  _storeRestaurants.addOffer(ModelRestaurants(

                                    restaurantId: "",
                                    restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                    restaurantMainImage: _restaurantMainImageUrl.toString(),
                                    rater: rateValue.toString(),
                                    cuisine : cuisineController.text,
                                    address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                    openTime : openTimeDrop,
                                    closeTime : closeTimeDrop,
                                    shisha : shisha ,
                                    playingCard : playingCard ,
                                    nonSmoking :nonSmoking  ,
                                    liveMusic : liveMusic,
                                    sportScreen : sportScreen ,
                                    outdoor : outdoor ,
                                    acceptedCard : acceptedCard ,
                                    kidsFriendly : kidsFriendly ,
                                    valetParking :  valetParking,
                                    birthdayParty : birthdayParty ,

                                    mainOffer: mainOffer,
                                    mainOfferImage: _mainOfferImageUrl.toString(),
                                    mainOfferDetails: mainOfferDetailsController.text,
                                    mainOfferStartingTime : mainOfferStartingTimeDrop,
                                    mainOfferEndTime : mainOfferEndTimeDrop,
                                    mainOfferDaySat : mainOfferDaySat,
                                    mainOfferDaySun : mainOfferDaySun,
                                    mainOfferDayMon :mainOfferDayMon,
                                    mainOfferDayTus : mainOfferDayTus,
                                    mainOfferDayWed :mainOfferDayWed,
                                    mainOfferDayThu :mainOfferDayThu,
                                    mainOfferDayFri : mainOfferDayFri,
                                    mainOfferBreakfast :mainOfferBreakfast ,
                                    mainOfferLunch :mainOfferLunch ,
                                    mainOfferDinner : mainOfferDinner ,
                                    mainOfferShishaOffer : mainOfferShishaOffer ,
                                    mainOfferDelivery : mainOfferDelivery ,
                                    mainOfferBuffet : mainOfferBuffet  ,
                                    mainOfferWeinOffer: mainOfferWeinOffer,
                                    mainOfferButtonText : mainOfferButtonTextController.text ,
                                   mainOfferSellingPrice : mainOfferSellingPriceController.text,
                              mainOfferMaxSale : mainOfferMaxSaleController.text,
                              mainOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                              mainOfferActiveStart: mainOfferActiveStartController.text,
                              mainOfferActiveEnd: mainOfferActiveEndController.text,

                                    secondOffer: secondOffer,
                                    secondOfferImage: _secondOfferImageUrl.toString(),
                                    secondOfferDetails: secondOfferDetailsController.text,
                                    secondOfferStartingTime : secondOfferStartingTimeDrop,
                                    secondOfferEndTime : secondOfferEndTimeDrop,
                                    secondOfferDaySat : secondOfferDaySat,
                                    secondOfferDaySun : secondOfferDaySun,
                                    secondOfferDayMon :secondOfferDayMon,
                                    secondOfferDayTus : secondOfferDayTus,
                                    secondOfferDayWed :secondOfferDayWed,
                                    secondOfferDayThu :secondOfferDayThu,
                                    secondOfferDayFri : secondOfferDayFri,
                                    secondOfferBreakfast :secondOfferBreakfast ,
                                    secondOfferLunch :secondOfferLunch ,
                                    secondOfferDinner : secondOfferDinner ,
                                    secondOfferShishaOffer : secondOfferShishaOffer ,
                                    secondOfferDelivery : secondOfferDelivery ,
                                    secondOfferBuffet : secondOfferBuffet  ,
                                    secondOfferWeinOffer: secondOfferWeinOffer,
                                    secondOfferButtonText : secondOfferButtonTextController.text ,
                                    secondOfferSellingPrice : secondOfferSellingPriceController.text,
                              secondOfferMaxSale : secondOfferMaxSaleController.text,
                              secondOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                              secondOfferActiveStart: secondOfferActiveStartController.text,
                              secondOfferActiveEnd: secondOfferActiveEndController.text,

                                    thirdOffer: thirdOffer,
                                    thirdOfferImage: _thirdOfferImageUrl.toString(),
                                    thirdOfferDetails: thirdOfferDetailsController.text,
                                    thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                                    thirdOfferEndTime : thirdOfferEndTimeDrop,
                                    thirdOfferDaySat : thirdOfferDaySat,
                                    thirdOfferDaySun : thirdOfferDaySun,
                                    thirdOfferDayMon :thirdOfferDayMon,
                                    thirdOfferDayTus : thirdOfferDayTus,
                                    thirdOfferDayWed :thirdOfferDayWed,
                                    thirdOfferDayThu :thirdOfferDayThu,
                                    thirdOfferDayFri : thirdOfferDayFri,
                                    thirdOfferBreakfast :thirdOfferBreakfast ,
                                    thirdOfferLunch :thirdOfferLunch ,
                                    thirdOfferDinner : thirdOfferDinner ,
                                    thirdOfferShishaOffer : thirdOfferShishaOffer ,
                                    thirdOfferDelivery : thirdOfferDelivery ,
                                    thirdOfferBuffet : thirdOfferBuffet  ,
                                    thirdOfferWeinOffer: thirdOfferWeinOffer,
                                    thirdOfferButtonText : thirdOfferButtonTextController.text ,
                                    thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                                    fourthOffer: fourthOffer,
                                    fourthOfferImage: '',
                                    fourthOfferDetails: fourthOfferDetailsController.text,
                                    fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                    fourthOfferEndTime : fourthOfferEndTimeDrop,
                                    fourthOfferDaySat : fourthOfferDaySat,
                                    fourthOfferDaySun : fourthOfferDaySun,
                                    fourthOfferDayMon :fourthOfferDayMon,
                                    fourthOfferDayTus : fourthOfferDayTus,
                                    fourthOfferDayWed :fourthOfferDayWed,
                                    fourthOfferDayThu :fourthOfferDayThu,
                                    fourthOfferDayFri : fourthOfferDayFri,
                                    fourthOfferBreakfast :fourthOfferBreakfast ,
                                    fourthOfferLunch :fourthOfferLunch ,
                                    fourthOfferDinner : fourthOfferDinner ,
                                    fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                    fourthOfferDelivery : fourthOfferDelivery ,
                                    fourthOfferBuffet : fourthOfferBuffet  ,
                                    fourthOfferWeinOffer: fourthOfferWeinOffer,
                                    fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                    fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                    fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                    fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                                  ));
                                  if (secondOffer == false){_storeRestaurants.successAddAlert(context);}

//thaer(add second offer elements to firestore in offer category)-------------------------------------------------------------------------------
                                  _storeRestaurants.addOffer(ModelRestaurants(

                                    restaurantId: "",
                                    restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                    restaurantMainImage: _restaurantMainImageUrl.toString(),
                                    rater: rateValue.toString(),
                                    cuisine : cuisineController.text,
                                    address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                    openTime : openTimeDrop,
                                    closeTime : closeTimeDrop,
                                    shisha : shisha ,
                                    playingCard : playingCard ,
                                    nonSmoking :nonSmoking  ,
                                    liveMusic : liveMusic,
                                    sportScreen : sportScreen ,
                                    outdoor : outdoor ,
                                    acceptedCard : acceptedCard ,
                                    kidsFriendly : kidsFriendly ,
                                    valetParking :  valetParking,
                                    birthdayParty : birthdayParty ,

                                    mainOffer: secondOffer,
                                    mainOfferImage: _secondOfferImageUrl.toString(),
                                    mainOfferDetails: secondOfferDetailsController.text,
                                    mainOfferStartingTime : secondOfferStartingTimeDrop,
                                    mainOfferEndTime : secondOfferEndTimeDrop,
                                    mainOfferDaySat : secondOfferDaySat,
                                    mainOfferDaySun : secondOfferDaySun,
                                    mainOfferDayMon :secondOfferDayMon,
                                    mainOfferDayTus : secondOfferDayTus,
                                    mainOfferDayWed :secondOfferDayWed,
                                    mainOfferDayThu :secondOfferDayThu,
                                    mainOfferDayFri : secondOfferDayFri,
                                    mainOfferBreakfast :secondOfferBreakfast ,
                                    mainOfferLunch :secondOfferLunch ,
                                    mainOfferDinner : secondOfferDinner ,
                                    mainOfferShishaOffer : secondOfferShishaOffer ,
                                    mainOfferDelivery : secondOfferDelivery ,
                                    mainOfferBuffet : secondOfferBuffet  ,
                                    mainOfferWeinOffer: secondOfferWeinOffer,
                                    mainOfferButtonText : secondOfferButtonTextController.text ,
                                    mainOfferSellingPrice : secondOfferSellingPriceController.text,
                                    mainOfferMaxSale : secondOfferMaxSaleController.text,
                                    mainOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                                    mainOfferActiveStart: secondOfferActiveStartController.text,
                                    mainOfferActiveEnd: secondOfferActiveEndController.text,

                                    secondOffer: mainOffer,
                                    secondOfferImage: _mainOfferImageUrl.toString(),
                                    secondOfferDetails: mainOfferDetailsController.text,
                                    secondOfferStartingTime : mainOfferStartingTimeDrop,
                                    secondOfferEndTime : mainOfferEndTimeDrop,
                                    secondOfferDaySat : mainOfferDaySat,
                                    secondOfferDaySun : mainOfferDaySun,
                                    secondOfferDayMon :mainOfferDayMon,
                                    secondOfferDayTus : mainOfferDayTus,
                                    secondOfferDayWed :mainOfferDayWed,
                                    secondOfferDayThu :mainOfferDayThu,
                                    secondOfferDayFri : mainOfferDayFri,
                                    secondOfferBreakfast :mainOfferBreakfast ,
                                    secondOfferLunch :mainOfferLunch ,
                                    secondOfferDinner : mainOfferDinner ,
                                    secondOfferShishaOffer : mainOfferShishaOffer ,
                                    secondOfferDelivery : mainOfferDelivery ,
                                    secondOfferBuffet : mainOfferBuffet  ,
                                    secondOfferWeinOffer: mainOfferWeinOffer,
                                    secondOfferButtonText : mainOfferButtonTextController.text ,
                                    secondOfferSellingPrice : mainOfferSellingPriceController.text,
                                    secondOfferMaxSale : mainOfferMaxSaleController.text,
                                    secondOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                                    secondOfferActiveStart: mainOfferActiveStartController.text,
                                    secondOfferActiveEnd: mainOfferActiveEndController.text,

                                    thirdOffer: thirdOffer,
                                    thirdOfferImage: _thirdOfferImageUrl.toString(),
                                    thirdOfferDetails: thirdOfferDetailsController.text,
                                    thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                                    thirdOfferEndTime : thirdOfferEndTimeDrop,
                                    thirdOfferDaySat : thirdOfferDaySat,
                                    thirdOfferDaySun : thirdOfferDaySun,
                                    thirdOfferDayMon :thirdOfferDayMon,
                                    thirdOfferDayTus : thirdOfferDayTus,
                                    thirdOfferDayWed :thirdOfferDayWed,
                                    thirdOfferDayThu :thirdOfferDayThu,
                                    thirdOfferDayFri : thirdOfferDayFri,
                                    thirdOfferBreakfast :thirdOfferBreakfast ,
                                    thirdOfferLunch :thirdOfferLunch ,
                                    thirdOfferDinner : thirdOfferDinner ,
                                    thirdOfferShishaOffer : thirdOfferShishaOffer ,
                                    thirdOfferDelivery : thirdOfferDelivery ,
                                    thirdOfferBuffet : thirdOfferBuffet  ,
                                    thirdOfferWeinOffer: thirdOfferWeinOffer,
                                    thirdOfferButtonText : thirdOfferButtonTextController.text ,
                                    thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                                    fourthOffer: fourthOffer,
                                    fourthOfferImage: '',
                                    fourthOfferDetails: fourthOfferDetailsController.text,
                                    fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                    fourthOfferEndTime : fourthOfferEndTimeDrop,
                                    fourthOfferDaySat : fourthOfferDaySat,
                                    fourthOfferDaySun : fourthOfferDaySun,
                                    fourthOfferDayMon :fourthOfferDayMon,
                                    fourthOfferDayTus : fourthOfferDayTus,
                                    fourthOfferDayWed :fourthOfferDayWed,
                                    fourthOfferDayThu :fourthOfferDayThu,
                                    fourthOfferDayFri : fourthOfferDayFri,
                                    fourthOfferBreakfast :fourthOfferBreakfast ,
                                    fourthOfferLunch :fourthOfferLunch ,
                                    fourthOfferDinner : fourthOfferDinner ,
                                    fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                    fourthOfferDelivery : fourthOfferDelivery ,
                                    fourthOfferBuffet : fourthOfferBuffet  ,
                                    fourthOfferWeinOffer: fourthOfferWeinOffer,
                                    fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                    fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                    fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                    fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                                  ));
                                  if (thirdOffer == false){_storeRestaurants.successAddAlert(context);}

//thaer(add third offer elements to firestore in offer category)-------------------------------------------------------------------------------
                                  _storeRestaurants.addOffer(ModelRestaurants(

                                    restaurantId: "",
                                    restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                    restaurantMainImage: _restaurantMainImageUrl.toString(),
                                    rater: rateValue.toString(),
                                    cuisine : cuisineController.text,
                                    address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                    openTime : openTimeDrop,
                                    closeTime : closeTimeDrop,
                                    shisha : shisha ,
                                    playingCard : playingCard ,
                                    nonSmoking :nonSmoking  ,
                                    liveMusic : liveMusic,
                                    sportScreen : sportScreen ,
                                    outdoor : outdoor ,
                                    acceptedCard : acceptedCard ,
                                    kidsFriendly : kidsFriendly ,
                                    valetParking :  valetParking,
                                    birthdayParty : birthdayParty ,

                                    mainOffer: thirdOffer,
                                    mainOfferImage: _thirdOfferImageUrl.toString(),
                                    mainOfferDetails: thirdOfferDetailsController.text,
                                    mainOfferStartingTime : thirdOfferStartingTimeDrop,
                                    mainOfferEndTime : thirdOfferEndTimeDrop,
                                    mainOfferDaySat : thirdOfferDaySat,
                                    mainOfferDaySun : thirdOfferDaySun,
                                    mainOfferDayMon :thirdOfferDayMon,
                                    mainOfferDayTus : thirdOfferDayTus,
                                    mainOfferDayWed :thirdOfferDayWed,
                                    mainOfferDayThu :thirdOfferDayThu,
                                    mainOfferDayFri : thirdOfferDayFri,
                                    mainOfferBreakfast :thirdOfferBreakfast ,
                                    mainOfferLunch :thirdOfferLunch ,
                                    mainOfferDinner : thirdOfferDinner ,
                                    mainOfferShishaOffer : thirdOfferShishaOffer ,
                                    mainOfferDelivery : thirdOfferDelivery ,
                                    mainOfferBuffet : thirdOfferBuffet  ,
                                    mainOfferWeinOffer: thirdOfferWeinOffer,
                                    mainOfferButtonText : thirdOfferButtonTextController.text ,
                                    mainOfferSellingPrice : thirdOfferSellingPriceController.text,
                                    mainOfferMaxSale : thirdOfferMaxSaleController.text,
                                    mainOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                                    mainOfferActiveStart: thirdOfferActiveStartController.text,
                                    mainOfferActiveEnd: thirdOfferActiveEndController.text,

                                    secondOffer: mainOffer,
                                    secondOfferImage: _mainOfferImageUrl.toString(),
                                    secondOfferDetails: mainOfferDetailsController.text,
                                    secondOfferStartingTime : mainOfferStartingTimeDrop,
                                    secondOfferEndTime : mainOfferEndTimeDrop,
                                    secondOfferDaySat : mainOfferDaySat,
                                    secondOfferDaySun : mainOfferDaySun,
                                    secondOfferDayMon :mainOfferDayMon,
                                    secondOfferDayTus : mainOfferDayTus,
                                    secondOfferDayWed :mainOfferDayWed,
                                    secondOfferDayThu :mainOfferDayThu,
                                    secondOfferDayFri : mainOfferDayFri,
                                    secondOfferBreakfast :mainOfferBreakfast ,
                                    secondOfferLunch :mainOfferLunch ,
                                    secondOfferDinner : mainOfferDinner ,
                                    secondOfferShishaOffer : mainOfferShishaOffer ,
                                    secondOfferDelivery : mainOfferDelivery ,
                                    secondOfferBuffet : mainOfferBuffet  ,
                                    secondOfferWeinOffer: mainOfferWeinOffer,
                                    secondOfferButtonText : mainOfferButtonTextController.text ,
                                    secondOfferSellingPrice : mainOfferSellingPriceController.text,
                                    secondOfferMaxSale : mainOfferMaxSaleController.text,
                                    secondOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                                    secondOfferActiveStart: mainOfferActiveStartController.text,
                                    secondOfferActiveEnd: mainOfferActiveEndController.text,

                                    thirdOffer: secondOffer,
                                    thirdOfferImage: _secondOfferImageUrl.toString(),
                                    thirdOfferDetails: secondOfferDetailsController.text,
                                    thirdOfferStartingTime : secondOfferStartingTimeDrop,
                                    thirdOfferEndTime : secondOfferEndTimeDrop,
                                    thirdOfferDaySat : secondOfferDaySat,
                                    thirdOfferDaySun : secondOfferDaySun,
                                    thirdOfferDayMon :secondOfferDayMon,
                                    thirdOfferDayTus : secondOfferDayTus,
                                    thirdOfferDayWed :secondOfferDayWed,
                                    thirdOfferDayThu :secondOfferDayThu,
                                    thirdOfferDayFri : secondOfferDayFri,
                                    thirdOfferBreakfast :secondOfferBreakfast ,
                                    thirdOfferLunch :secondOfferLunch ,
                                    thirdOfferDinner : secondOfferDinner ,
                                    thirdOfferShishaOffer : secondOfferShishaOffer ,
                                    thirdOfferDelivery : secondOfferDelivery ,
                                    thirdOfferBuffet : secondOfferBuffet  ,
                                    thirdOfferWeinOffer: secondOfferWeinOffer,
                                    thirdOfferButtonText : secondOfferButtonTextController.text ,
                                    thirdOfferSellingPrice : secondOfferSellingPriceController.text,
                                    thirdOfferMaxSale : secondOfferMaxSaleController.text,
                                    thirdOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                                    thirdOfferActiveStart: secondOfferActiveStartController.text,
                                    thirdOfferActiveEnd: secondOfferActiveEndController.text,

                                    fourthOffer: fourthOffer,
                                    fourthOfferImage: '',
                                    fourthOfferDetails: fourthOfferDetailsController.text,
                                    fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                    fourthOfferEndTime : fourthOfferEndTimeDrop,
                                    fourthOfferDaySat : fourthOfferDaySat,
                                    fourthOfferDaySun : fourthOfferDaySun,
                                    fourthOfferDayMon :fourthOfferDayMon,
                                    fourthOfferDayTus : fourthOfferDayTus,
                                    fourthOfferDayWed :fourthOfferDayWed,
                                    fourthOfferDayThu :fourthOfferDayThu,
                                    fourthOfferDayFri : fourthOfferDayFri,
                                    fourthOfferBreakfast :fourthOfferBreakfast ,
                                    fourthOfferLunch :fourthOfferLunch ,
                                    fourthOfferDinner : fourthOfferDinner ,
                                    fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                    fourthOfferDelivery : fourthOfferDelivery ,
                                    fourthOfferBuffet : fourthOfferBuffet  ,
                                    fourthOfferWeinOffer: fourthOfferWeinOffer,
                                    fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                    fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                                    fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                    fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                    fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                                  ));
                                  if (fourthOffer == false){_storeRestaurants.successAddAlert(context);}

                                }else{
                            final fourthOfferImageName = basename(_fourthOfferImage!.path.toString());
                            var fourthOfferStorageImage = FirebaseStorage.instance.ref().child('Restaurants/$fourthOfferImageName');
                            var fourthOfferStorageImageTask = fourthOfferStorageImage.putFile(_fourthOfferImage!);
                            var _fourthOfferImageUrl = await (await fourthOfferStorageImageTask).ref.getDownloadURL();


//thaer(add first offer elements to firestore in offer category)-------------------------------------------------------------------------------
                                  _storeRestaurants.addOffer(ModelRestaurants(

                                    restaurantId: "",
                                    restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                    restaurantMainImage: _restaurantMainImageUrl.toString(),
                                    rater: rateValue.toString(),
                                    cuisine : cuisineController.text,
                                    address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                    openTime : openTimeDrop,
                                    closeTime : closeTimeDrop,
                                    shisha : shisha ,
                                    playingCard : playingCard ,
                                    nonSmoking :nonSmoking  ,
                                    liveMusic : liveMusic,
                                    sportScreen : sportScreen ,
                                    outdoor : outdoor ,
                                    acceptedCard : acceptedCard ,
                                    kidsFriendly : kidsFriendly ,
                                    valetParking :  valetParking,
                                    birthdayParty : birthdayParty ,

                                    mainOffer: mainOffer,
                                    mainOfferImage: _mainOfferImageUrl.toString(),
                                    mainOfferDetails: mainOfferDetailsController.text,
                                    mainOfferStartingTime : mainOfferStartingTimeDrop,
                                    mainOfferEndTime : mainOfferEndTimeDrop,
                                    mainOfferDaySat : mainOfferDaySat,
                                    mainOfferDaySun : mainOfferDaySun,
                                    mainOfferDayMon :mainOfferDayMon,
                                    mainOfferDayTus : mainOfferDayTus,
                                    mainOfferDayWed :mainOfferDayWed,
                                    mainOfferDayThu :mainOfferDayThu,
                                    mainOfferDayFri : mainOfferDayFri,
                                    mainOfferBreakfast :mainOfferBreakfast ,
                                    mainOfferLunch :mainOfferLunch ,
                                    mainOfferDinner : mainOfferDinner ,
                                    mainOfferShishaOffer : mainOfferShishaOffer ,
                                    mainOfferDelivery : mainOfferDelivery ,
                                    mainOfferBuffet : mainOfferBuffet  ,
                                    mainOfferWeinOffer: mainOfferWeinOffer,
                                    mainOfferButtonText : mainOfferButtonTextController.text ,
                                   mainOfferSellingPrice : mainOfferSellingPriceController.text,
                              mainOfferMaxSale : mainOfferMaxSaleController.text,
                              mainOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                              mainOfferActiveStart: mainOfferActiveStartController.text,
                              mainOfferActiveEnd: mainOfferActiveEndController.text,

                                    secondOffer: secondOffer,
                                    secondOfferImage: _secondOfferImageUrl.toString(),
                                    secondOfferDetails: secondOfferDetailsController.text,
                                    secondOfferStartingTime : secondOfferStartingTimeDrop,
                                    secondOfferEndTime : secondOfferEndTimeDrop,
                                    secondOfferDaySat : secondOfferDaySat,
                                    secondOfferDaySun : secondOfferDaySun,
                                    secondOfferDayMon :secondOfferDayMon,
                                    secondOfferDayTus : secondOfferDayTus,
                                    secondOfferDayWed :secondOfferDayWed,
                                    secondOfferDayThu :secondOfferDayThu,
                                    secondOfferDayFri : secondOfferDayFri,
                                    secondOfferBreakfast :secondOfferBreakfast ,
                                    secondOfferLunch :secondOfferLunch ,
                                    secondOfferDinner : secondOfferDinner ,
                                    secondOfferShishaOffer : secondOfferShishaOffer ,
                                    secondOfferDelivery : secondOfferDelivery ,
                                    secondOfferBuffet : secondOfferBuffet  ,
                                    secondOfferWeinOffer: secondOfferWeinOffer,
                                    secondOfferButtonText : secondOfferButtonTextController.text ,
                                    secondOfferSellingPrice : secondOfferSellingPriceController.text,
                              secondOfferMaxSale : secondOfferMaxSaleController.text,
                              secondOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                              secondOfferActiveStart: secondOfferActiveStartController.text,
                              secondOfferActiveEnd: secondOfferActiveEndController.text,

                                    thirdOffer: thirdOffer,
                                    thirdOfferImage: _thirdOfferImageUrl.toString(),
                                    thirdOfferDetails: thirdOfferDetailsController.text,
                                    thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                                    thirdOfferEndTime : thirdOfferEndTimeDrop,
                                    thirdOfferDaySat : thirdOfferDaySat,
                                    thirdOfferDaySun : thirdOfferDaySun,
                                    thirdOfferDayMon :thirdOfferDayMon,
                                    thirdOfferDayTus : thirdOfferDayTus,
                                    thirdOfferDayWed :thirdOfferDayWed,
                                    thirdOfferDayThu :thirdOfferDayThu,
                                    thirdOfferDayFri : thirdOfferDayFri,
                                    thirdOfferBreakfast :thirdOfferBreakfast ,
                                    thirdOfferLunch :thirdOfferLunch ,
                                    thirdOfferDinner : thirdOfferDinner ,
                                    thirdOfferShishaOffer : thirdOfferShishaOffer ,
                                    thirdOfferDelivery : thirdOfferDelivery ,
                                    thirdOfferBuffet : thirdOfferBuffet  ,
                                    thirdOfferWeinOffer: thirdOfferWeinOffer,
                                    thirdOfferButtonText : thirdOfferButtonTextController.text ,
                                    thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
                                    thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                                    fourthOffer: fourthOffer,
                                    fourthOfferImage: _fourthOfferImageUrl.toString(),
                                    fourthOfferDetails: fourthOfferDetailsController.text,
                                    fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                    fourthOfferEndTime : fourthOfferEndTimeDrop,
                                    fourthOfferDaySat : fourthOfferDaySat,
                                    fourthOfferDaySun : fourthOfferDaySun,
                                    fourthOfferDayMon :fourthOfferDayMon,
                                    fourthOfferDayTus : fourthOfferDayTus,
                                    fourthOfferDayWed :fourthOfferDayWed,
                                    fourthOfferDayThu :fourthOfferDayThu,
                                    fourthOfferDayFri : fourthOfferDayFri,
                                    fourthOfferBreakfast :fourthOfferBreakfast ,
                                    fourthOfferLunch :fourthOfferLunch ,
                                    fourthOfferDinner : fourthOfferDinner ,
                                    fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                    fourthOfferDelivery : fourthOfferDelivery ,
                                    fourthOfferBuffet : fourthOfferBuffet  ,
                                    fourthOfferWeinOffer: fourthOfferWeinOffer,
                                    fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                    fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                    fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                    fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                                  ));
                                  if (secondOffer == false){_storeRestaurants.successAddAlert(context);}

//thaer(add second offer elements to firestore in offer category)-------------------------------------------------------------------------------
                                  _storeRestaurants.addOffer(ModelRestaurants(

                                    restaurantId: "",
                                    restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                    restaurantMainImage: _restaurantMainImageUrl.toString(),
                                    rater: rateValue.toString(),
                                    cuisine : cuisineController.text,
                                    address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                    openTime : openTimeDrop,
                                    closeTime : closeTimeDrop,
                                    shisha : shisha ,
                                    playingCard : playingCard ,
                                    nonSmoking :nonSmoking  ,
                                    liveMusic : liveMusic,
                                    sportScreen : sportScreen ,
                                    outdoor : outdoor ,
                                    acceptedCard : acceptedCard ,
                                    kidsFriendly : kidsFriendly ,
                                    valetParking :  valetParking,
                                    birthdayParty : birthdayParty ,

                                    mainOffer: secondOffer,
                                    mainOfferImage: _secondOfferImageUrl.toString(),
                                    mainOfferDetails: secondOfferDetailsController.text,
                                    mainOfferStartingTime : secondOfferStartingTimeDrop,
                                    mainOfferEndTime : secondOfferEndTimeDrop,
                                    mainOfferDaySat : secondOfferDaySat,
                                    mainOfferDaySun : secondOfferDaySun,
                                    mainOfferDayMon :secondOfferDayMon,
                                    mainOfferDayTus : secondOfferDayTus,
                                    mainOfferDayWed :secondOfferDayWed,
                                    mainOfferDayThu :secondOfferDayThu,
                                    mainOfferDayFri : secondOfferDayFri,
                                    mainOfferBreakfast :secondOfferBreakfast ,
                                    mainOfferLunch :secondOfferLunch ,
                                    mainOfferDinner : secondOfferDinner ,
                                    mainOfferShishaOffer : secondOfferShishaOffer ,
                                    mainOfferDelivery : secondOfferDelivery ,
                                    mainOfferBuffet : secondOfferBuffet  ,
                                    mainOfferWeinOffer: secondOfferWeinOffer,
                                    mainOfferButtonText : secondOfferButtonTextController.text ,
                                    mainOfferSellingPrice : secondOfferSellingPriceController.text,
                                    mainOfferMaxSale : secondOfferMaxSaleController.text,
                                    mainOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                                    mainOfferActiveStart: secondOfferActiveStartController.text,
                                    mainOfferActiveEnd: secondOfferActiveEndController.text,

                                    secondOffer: mainOffer,
                                    secondOfferImage: _mainOfferImageUrl.toString(),
                                    secondOfferDetails: mainOfferDetailsController.text,
                                    secondOfferStartingTime : mainOfferStartingTimeDrop,
                                    secondOfferEndTime : mainOfferEndTimeDrop,
                                    secondOfferDaySat : mainOfferDaySat,
                                    secondOfferDaySun : mainOfferDaySun,
                                    secondOfferDayMon :mainOfferDayMon,
                                    secondOfferDayTus : mainOfferDayTus,
                                    secondOfferDayWed :mainOfferDayWed,
                                    secondOfferDayThu :mainOfferDayThu,
                                    secondOfferDayFri : mainOfferDayFri,
                                    secondOfferBreakfast :mainOfferBreakfast ,
                                    secondOfferLunch :mainOfferLunch ,
                                    secondOfferDinner : mainOfferDinner ,
                                    secondOfferShishaOffer : mainOfferShishaOffer ,
                                    secondOfferDelivery : mainOfferDelivery ,
                                    secondOfferBuffet : mainOfferBuffet  ,
                                    secondOfferWeinOffer: mainOfferWeinOffer,
                                    secondOfferButtonText : mainOfferButtonTextController.text ,
                                    secondOfferSellingPrice : mainOfferSellingPriceController.text,
                                    secondOfferMaxSale : mainOfferMaxSaleController.text,
                                    secondOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                                    secondOfferActiveStart: mainOfferActiveStartController.text,
                                    secondOfferActiveEnd: mainOfferActiveEndController.text,

                                    thirdOffer: thirdOffer,
                                    thirdOfferImage: _thirdOfferImageUrl.toString(),
                                    thirdOfferDetails: thirdOfferDetailsController.text,
                                    thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                                    thirdOfferEndTime : thirdOfferEndTimeDrop,
                                    thirdOfferDaySat : thirdOfferDaySat,
                                    thirdOfferDaySun : thirdOfferDaySun,
                                    thirdOfferDayMon :thirdOfferDayMon,
                                    thirdOfferDayTus : thirdOfferDayTus,
                                    thirdOfferDayWed :thirdOfferDayWed,
                                    thirdOfferDayThu :thirdOfferDayThu,
                                    thirdOfferDayFri : thirdOfferDayFri,
                                    thirdOfferBreakfast :thirdOfferBreakfast ,
                                    thirdOfferLunch :thirdOfferLunch ,
                                    thirdOfferDinner : thirdOfferDinner ,
                                    thirdOfferShishaOffer : thirdOfferShishaOffer ,
                                    thirdOfferDelivery : thirdOfferDelivery ,
                                    thirdOfferBuffet : thirdOfferBuffet  ,
                                    thirdOfferWeinOffer: thirdOfferWeinOffer,
                                    thirdOfferButtonText : thirdOfferButtonTextController.text ,
                                    thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                                    fourthOffer: fourthOffer,
                                    fourthOfferImage: _fourthOfferImageUrl.toString(),
                                    fourthOfferDetails: fourthOfferDetailsController.text,
                                    fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                    fourthOfferEndTime : fourthOfferEndTimeDrop,
                                    fourthOfferDaySat : fourthOfferDaySat,
                                    fourthOfferDaySun : fourthOfferDaySun,
                                    fourthOfferDayMon :fourthOfferDayMon,
                                    fourthOfferDayTus : fourthOfferDayTus,
                                    fourthOfferDayWed :fourthOfferDayWed,
                                    fourthOfferDayThu :fourthOfferDayThu,
                                    fourthOfferDayFri : fourthOfferDayFri,
                                    fourthOfferBreakfast :fourthOfferBreakfast ,
                                    fourthOfferLunch :fourthOfferLunch ,
                                    fourthOfferDinner : fourthOfferDinner ,
                                    fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                    fourthOfferDelivery : fourthOfferDelivery ,
                                    fourthOfferBuffet : fourthOfferBuffet  ,
                                    fourthOfferWeinOffer: fourthOfferWeinOffer,
                                    fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                    fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                    fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                    fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                                  ));
                                  if (thirdOffer == false){_storeRestaurants.successAddAlert(context);}

//thaer(add third offer elements to firestore in offer category)-------------------------------------------------------------------------------
                                  _storeRestaurants.addOffer(ModelRestaurants(

                                    restaurantId: "",
                                    restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                                    restaurantMainImage: _restaurantMainImageUrl.toString(),
                                    rater: rateValue.toString(),
                                    cuisine : cuisineController.text,
                                    address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                                    openTime : openTimeDrop,
                                    closeTime : closeTimeDrop,
                                    shisha : shisha ,
                                    playingCard : playingCard ,
                                    nonSmoking :nonSmoking  ,
                                    liveMusic : liveMusic,
                                    sportScreen : sportScreen ,
                                    outdoor : outdoor ,
                                    acceptedCard : acceptedCard ,
                                    kidsFriendly : kidsFriendly ,
                                    valetParking :  valetParking,
                                    birthdayParty : birthdayParty ,

                                    mainOffer: thirdOffer,
                                    mainOfferImage: _thirdOfferImageUrl.toString(),
                                    mainOfferDetails: thirdOfferDetailsController.text,
                                    mainOfferStartingTime : thirdOfferStartingTimeDrop,
                                    mainOfferEndTime : thirdOfferEndTimeDrop,
                                    mainOfferDaySat : thirdOfferDaySat,
                                    mainOfferDaySun : thirdOfferDaySun,
                                    mainOfferDayMon :thirdOfferDayMon,
                                    mainOfferDayTus : thirdOfferDayTus,
                                    mainOfferDayWed :thirdOfferDayWed,
                                    mainOfferDayThu :thirdOfferDayThu,
                                    mainOfferDayFri : thirdOfferDayFri,
                                    mainOfferBreakfast :thirdOfferBreakfast ,
                                    mainOfferLunch :thirdOfferLunch ,
                                    mainOfferDinner : thirdOfferDinner ,
                                    mainOfferShishaOffer : thirdOfferShishaOffer ,
                                    mainOfferDelivery : thirdOfferDelivery ,
                                    mainOfferBuffet : thirdOfferBuffet  ,
                                    mainOfferWeinOffer: thirdOfferWeinOffer,
                                    mainOfferButtonText : thirdOfferButtonTextController.text ,
                                    mainOfferSellingPrice : thirdOfferSellingPriceController.text,
                                    mainOfferMaxSale : thirdOfferMaxSaleController.text,
                                    mainOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                                    mainOfferActiveStart: thirdOfferActiveStartController.text,
                                    mainOfferActiveEnd: thirdOfferActiveEndController.text,

                                    secondOffer: mainOffer,
                                    secondOfferImage: _mainOfferImageUrl.toString(),
                                    secondOfferDetails: mainOfferDetailsController.text,
                                    secondOfferStartingTime : mainOfferStartingTimeDrop,
                                    secondOfferEndTime : mainOfferEndTimeDrop,
                                    secondOfferDaySat : mainOfferDaySat,
                                    secondOfferDaySun : mainOfferDaySun,
                                    secondOfferDayMon :mainOfferDayMon,
                                    secondOfferDayTus : mainOfferDayTus,
                                    secondOfferDayWed :mainOfferDayWed,
                                    secondOfferDayThu :mainOfferDayThu,
                                    secondOfferDayFri : mainOfferDayFri,
                                    secondOfferBreakfast :mainOfferBreakfast ,
                                    secondOfferLunch :mainOfferLunch ,
                                    secondOfferDinner : mainOfferDinner ,
                                    secondOfferShishaOffer : mainOfferShishaOffer ,
                                    secondOfferDelivery : mainOfferDelivery ,
                                    secondOfferBuffet : mainOfferBuffet  ,
                                    secondOfferWeinOffer: mainOfferWeinOffer,
                                    secondOfferButtonText : mainOfferButtonTextController.text ,
                                    secondOfferSellingPrice : mainOfferSellingPriceController.text,
                                    secondOfferMaxSale : mainOfferMaxSaleController.text,
                                    secondOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                                    secondOfferActiveStart: mainOfferActiveStartController.text,
                                    secondOfferActiveEnd: mainOfferActiveEndController.text,

                                    thirdOffer: secondOffer,
                                    thirdOfferImage: _secondOfferImageUrl.toString(),
                                    thirdOfferDetails: secondOfferDetailsController.text,
                                    thirdOfferStartingTime : secondOfferStartingTimeDrop,
                                    thirdOfferEndTime : secondOfferEndTimeDrop,
                                    thirdOfferDaySat : secondOfferDaySat,
                                    thirdOfferDaySun : secondOfferDaySun,
                                    thirdOfferDayMon :secondOfferDayMon,
                                    thirdOfferDayTus : secondOfferDayTus,
                                    thirdOfferDayWed :secondOfferDayWed,
                                    thirdOfferDayThu :secondOfferDayThu,
                                    thirdOfferDayFri : secondOfferDayFri,
                                    thirdOfferBreakfast :secondOfferBreakfast ,
                                    thirdOfferLunch :secondOfferLunch ,
                                    thirdOfferDinner : secondOfferDinner ,
                                    thirdOfferShishaOffer : secondOfferShishaOffer ,
                                    thirdOfferDelivery : secondOfferDelivery ,
                                    thirdOfferBuffet : secondOfferBuffet  ,
                                    thirdOfferWeinOffer: secondOfferWeinOffer,
                                    thirdOfferButtonText : secondOfferButtonTextController.text ,
                                    thirdOfferSellingPrice : secondOfferSellingPriceController.text,
                                    thirdOfferMaxSale : secondOfferMaxSaleController.text,
                                    thirdOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                                    thirdOfferActiveStart: secondOfferActiveStartController.text,
                                    thirdOfferActiveEnd: secondOfferActiveEndController.text,

                                    fourthOffer: fourthOffer,
                                    fourthOfferImage: _fourthOfferImageUrl.toString(),
                                    fourthOfferDetails: fourthOfferDetailsController.text,
                                    fourthOfferStartingTime : fourthOfferStartingTimeDrop,
                                    fourthOfferEndTime : fourthOfferEndTimeDrop,
                                    fourthOfferDaySat : fourthOfferDaySat,
                                    fourthOfferDaySun : fourthOfferDaySun,
                                    fourthOfferDayMon :fourthOfferDayMon,
                                    fourthOfferDayTus : fourthOfferDayTus,
                                    fourthOfferDayWed :fourthOfferDayWed,
                                    fourthOfferDayThu :fourthOfferDayThu,
                                    fourthOfferDayFri : fourthOfferDayFri,
                                    fourthOfferBreakfast :fourthOfferBreakfast ,
                                    fourthOfferLunch :fourthOfferLunch ,
                                    fourthOfferDinner : fourthOfferDinner ,
                                    fourthOfferShishaOffer : fourthOfferShishaOffer ,
                                    fourthOfferDelivery : fourthOfferDelivery ,
                                    fourthOfferBuffet : fourthOfferBuffet  ,
                                    fourthOfferWeinOffer: fourthOfferWeinOffer,
                                    fourthOfferButtonText : fourthOfferButtonTextController.text ,
                                    fourthOfferSellingPrice : fourthOfferSellingPriceController.text,
                              fourthOfferMaxSale : fourthOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                                    fourthOfferActiveStart: fourthOfferActiveStartController.text,
                                    fourthOfferActiveEnd: fourthOfferActiveEndController.text,
                                  ));
                                  if (fourthOffer == false){_storeRestaurants.successAddAlert(context);}


//thaer(add fourth offer elements to firestore in offer category)-------------------------------------------------------------------------------
                            _storeRestaurants.addOffer(ModelRestaurants(

                              restaurantId: "",
                              restaurantName: restaurantNameController.text,
                              restaurantCode: restaurantCodeController.text,
                              restaurantMainImage: _restaurantMainImageUrl.toString(),
                              rater: rateValue.toString(),
                              cuisine : cuisineController.text,
                              address: addressController.text,
                              lat: latController.text,
                              long: longController.text,
                              phone: phoneController.text,
                              openTime : openTimeDrop,
                              closeTime : closeTimeDrop,
                              shisha : shisha ,
                              playingCard : playingCard ,
                              nonSmoking :nonSmoking  ,
                              liveMusic : liveMusic,
                              sportScreen : sportScreen ,
                              outdoor : outdoor ,
                              acceptedCard : acceptedCard ,
                              kidsFriendly : kidsFriendly ,
                              valetParking :  valetParking,
                              birthdayParty : birthdayParty ,

                              mainOffer: fourthOffer,
                              mainOfferImage: _fourthOfferImageUrl.toString(),
                              mainOfferDetails: fourthOfferDetailsController.text,
                              mainOfferStartingTime : fourthOfferStartingTimeDrop,
                              mainOfferEndTime : fourthOfferEndTimeDrop,
                              mainOfferDaySat : fourthOfferDaySat,
                              mainOfferDaySun : fourthOfferDaySun,
                              mainOfferDayMon :fourthOfferDayMon,
                              mainOfferDayTus : fourthOfferDayTus,
                              mainOfferDayWed :fourthOfferDayWed,
                              mainOfferDayThu :fourthOfferDayThu,
                              mainOfferDayFri : fourthOfferDayFri,
                              mainOfferBreakfast :fourthOfferBreakfast ,
                              mainOfferLunch :fourthOfferLunch ,
                              mainOfferDinner : fourthOfferDinner ,
                              mainOfferShishaOffer : fourthOfferShishaOffer ,
                              mainOfferDelivery : fourthOfferDelivery ,
                              mainOfferBuffet : fourthOfferBuffet  ,
                              mainOfferWeinOffer: fourthOfferWeinOffer,
                              mainOfferButtonText : fourthOfferButtonTextController.text ,
                              mainOfferSellingPrice : fourthOfferSellingPriceController.text,
                              mainOfferMaxSale : fourthOfferMaxSaleController.text,
                              mainOfferMaxSaleFirst : fourthOfferMaxSaleController.text,
                              mainOfferActiveStart: fourthOfferActiveStartController.text,
                              mainOfferActiveEnd: fourthOfferActiveEndController.text,

                              secondOffer: mainOffer,
                              secondOfferImage: _mainOfferImageUrl.toString(),
                              secondOfferDetails: mainOfferDetailsController.text,
                              secondOfferStartingTime : mainOfferStartingTimeDrop,
                              secondOfferEndTime : mainOfferEndTimeDrop,
                              secondOfferDaySat : mainOfferDaySat,
                              secondOfferDaySun : mainOfferDaySun,
                              secondOfferDayMon :mainOfferDayMon,
                              secondOfferDayTus : mainOfferDayTus,
                              secondOfferDayWed :mainOfferDayWed,
                              secondOfferDayThu :mainOfferDayThu,
                              secondOfferDayFri : mainOfferDayFri,
                              secondOfferBreakfast :mainOfferBreakfast ,
                              secondOfferLunch :mainOfferLunch ,
                              secondOfferDinner : mainOfferDinner ,
                              secondOfferShishaOffer : mainOfferShishaOffer ,
                              secondOfferDelivery : mainOfferDelivery ,
                              secondOfferBuffet : mainOfferBuffet  ,
                              secondOfferWeinOffer: mainOfferWeinOffer,
                              secondOfferButtonText : mainOfferButtonTextController.text ,
                              secondOfferSellingPrice : mainOfferSellingPriceController.text,
                              secondOfferMaxSale : mainOfferMaxSaleController.text,
                              secondOfferMaxSaleFirst : mainOfferMaxSaleController.text,
                              secondOfferActiveStart: mainOfferActiveStartController.text,
                              secondOfferActiveEnd: mainOfferActiveEndController.text,

                              thirdOffer: thirdOffer,
                              thirdOfferImage: _thirdOfferImageUrl.toString(),
                              thirdOfferDetails: thirdOfferDetailsController.text,
                              thirdOfferStartingTime : thirdOfferStartingTimeDrop,
                              thirdOfferEndTime : thirdOfferEndTimeDrop,
                              thirdOfferDaySat : thirdOfferDaySat,
                              thirdOfferDaySun : thirdOfferDaySun,
                              thirdOfferDayMon :thirdOfferDayMon,
                              thirdOfferDayTus : thirdOfferDayTus,
                              thirdOfferDayWed :thirdOfferDayWed,
                              thirdOfferDayThu :thirdOfferDayThu,
                              thirdOfferDayFri : thirdOfferDayFri,
                              thirdOfferBreakfast :thirdOfferBreakfast ,
                              thirdOfferLunch :thirdOfferLunch ,
                              thirdOfferDinner : thirdOfferDinner ,
                              thirdOfferShishaOffer : thirdOfferShishaOffer ,
                              thirdOfferDelivery : thirdOfferDelivery ,
                              thirdOfferBuffet : thirdOfferBuffet  ,
                              thirdOfferWeinOffer: thirdOfferWeinOffer,
                              thirdOfferButtonText : thirdOfferButtonTextController.text ,
                              thirdOfferSellingPrice : thirdOfferSellingPriceController.text,
                              thirdOfferMaxSale : thirdOfferMaxSaleController.text,
thirdOfferMaxSaleFirst : thirdOfferMaxSaleController.text,
                              thirdOfferActiveStart: thirdOfferActiveStartController.text,
                              thirdOfferActiveEnd: thirdOfferActiveEndController.text,

                              fourthOffer: secondOffer,
                              fourthOfferImage: _secondOfferImageUrl.toString(),
                              fourthOfferDetails: secondOfferDetailsController.text,
                              fourthOfferStartingTime : secondOfferStartingTimeDrop,
                              fourthOfferEndTime : secondOfferEndTimeDrop,
                              fourthOfferDaySat : secondOfferDaySat,
                              fourthOfferDaySun : secondOfferDaySun,
                              fourthOfferDayMon :secondOfferDayMon,
                              fourthOfferDayTus : secondOfferDayTus,
                              fourthOfferDayWed :secondOfferDayWed,
                              fourthOfferDayThu :secondOfferDayThu,
                              fourthOfferDayFri : secondOfferDayFri,
                              fourthOfferBreakfast :secondOfferBreakfast ,
                              fourthOfferLunch :secondOfferLunch ,
                              fourthOfferDinner : secondOfferDinner ,
                              fourthOfferShishaOffer : secondOfferShishaOffer ,
                              fourthOfferDelivery : secondOfferDelivery ,
                              fourthOfferBuffet : secondOfferBuffet  ,
                              fourthOfferWeinOffer: secondOfferWeinOffer,
                              fourthOfferButtonText : secondOfferButtonTextController.text ,
                              fourthOfferSellingPrice : secondOfferSellingPriceController.text,
                              fourthOfferMaxSale : secondOfferMaxSaleController.text,
                              fourthOfferMaxSaleFirst : secondOfferMaxSaleController.text,
                              fourthOfferActiveStart: secondOfferActiveStartController.text,
                              fourthOfferActiveEnd: secondOfferActiveEndController.text,
                            ));}}}

// thaer(rest of adding proses)-------------------------------------------------------------------------------
                            _storeRestaurants.successAddAlert(context);
                            _globalKey.currentState!.reset();
                          }else{
                            _storeRestaurants.noSelectedImageAlert(context);}
                          },
                      ),),
                  ]),


            ),),)
    );
  }
}
