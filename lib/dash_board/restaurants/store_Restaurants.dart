import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wein/dash_board/restaurants/dashBoardRestaurants.dart';
import 'package:wein/dash_board/restaurants/modelRestaurants.dart';

class StoreRestaurants {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addRestaurant(ModelRestaurants modelRestaurants) async {
    await _firestore.collection('Restaurants List').doc(modelRestaurants.restaurantName).set(
        {

// thaer(restaurant Main elements)---------------------------------------
          "restaurantName": modelRestaurants.restaurantName,
          "restaurantCode": modelRestaurants.restaurantCode,
          "RestaurantMainImage": modelRestaurants.restaurantMainImage,
          "rater": modelRestaurants.rater,
          "cuisine": modelRestaurants.cuisine,
          "address": modelRestaurants.address,
          "lat": modelRestaurants.lat,
          "long": modelRestaurants.long,
          "phone": modelRestaurants.phone,
          "openTime": modelRestaurants.openTime,
          "closeTime": modelRestaurants.closeTime,
          "shisha": modelRestaurants.shisha,
          "playingCard": modelRestaurants.playingCard,
          "nonSmoking": modelRestaurants.nonSmoking,
          "liveMusic": modelRestaurants.liveMusic,
          "sportScreen": modelRestaurants.sportScreen,
          "outdoor": modelRestaurants.outdoor,
          "acceptedCard": modelRestaurants.acceptedCard,
          "kidsFriendly": modelRestaurants.kidsFriendly,
          "valetParking": modelRestaurants.valetParking,
          "birthdayParty": modelRestaurants.birthdayParty,

//thaer(main offer elements)---------------------------------------
          "mainOffer": modelRestaurants.mainOffer,
          "mainOfferImage": modelRestaurants.mainOfferImage,
          "mainOfferDetails": modelRestaurants.mainOfferDetails,
          "mainOfferStartingTime": modelRestaurants.mainOfferStartingTime,
          "mainOfferEndTime": modelRestaurants.mainOfferEndTime,
          "mainOfferDaySat": modelRestaurants.mainOfferDaySat,
          "mainOfferDaySun": modelRestaurants.mainOfferDaySun,
          "mainOfferDayMon": modelRestaurants.mainOfferDayMon,
          "mainOfferDayTus": modelRestaurants.mainOfferDayTus,
          "mainOfferDayWed": modelRestaurants.mainOfferDayWed,
          "mainOfferDayThu": modelRestaurants.mainOfferDayThu,
          "mainOfferDayFri": modelRestaurants.mainOfferDayFri,
          "mainOfferBreakfast": modelRestaurants.mainOfferBreakfast,
          "mainOfferLunch": modelRestaurants.mainOfferLunch,
          "mainOfferDinner": modelRestaurants.mainOfferDinner,
          "mainOfferShishaOffer": modelRestaurants.mainOfferShishaOffer,
          "mainOfferDelivery": modelRestaurants.mainOfferDelivery,
          "mainOfferBuffet": modelRestaurants.mainOfferBuffet,
          "mainOfferWeinOffer" : modelRestaurants.mainOfferWeinOffer,
          "mainOfferButtonText": modelRestaurants.mainOfferButtonText,
          "mainOfferSellingPrice": modelRestaurants.mainOfferSellingPrice,
          "mainOfferMaxSale": modelRestaurants.mainOfferMaxSale,
          "mainOfferActiveStart" : modelRestaurants.mainOfferActiveStart,
          "mainOfferActiveEnd" : modelRestaurants.mainOfferActiveEnd,



//thaer(second offer elements)---------------------------------------
          "secondOffer": modelRestaurants.secondOffer,
          "secondOfferImage": modelRestaurants.secondOfferImage,
          "secondOfferDetails": modelRestaurants.secondOfferDetails,
          "secondOfferStartingTime": modelRestaurants.secondOfferStartingTime,
          "secondOfferEndTime": modelRestaurants.secondOfferEndTime,
          "secondOfferDaySat": modelRestaurants.secondOfferDaySat,
          "secondOfferDaySun": modelRestaurants.secondOfferDaySun,
          "secondOfferDayMon": modelRestaurants.secondOfferDayMon,
          "secondOfferDayTus": modelRestaurants.secondOfferDayTus,
          "secondOfferDayWed": modelRestaurants.secondOfferDayWed,
          "secondOfferDayThu": modelRestaurants.secondOfferDayThu,
          "secondOfferDayFri": modelRestaurants.secondOfferDayFri,
          "secondOfferBreakfast": modelRestaurants.secondOfferBreakfast,
          "secondOfferLunch": modelRestaurants.secondOfferLunch,
          "secondOfferDinner": modelRestaurants.secondOfferDinner,
          "secondOfferShishaOffer": modelRestaurants.secondOfferShishaOffer,
          "secondOfferDelivery": modelRestaurants.secondOfferDelivery,
          "secondOfferBuffet": modelRestaurants.secondOfferBuffet,
          "secondOfferWeinOffer" : modelRestaurants.secondOfferWeinOffer,
          "secondOfferButtonText": modelRestaurants.secondOfferButtonText,
          "secondOfferSellingPrice": modelRestaurants.secondOfferSellingPrice,
          "secondOfferMaxSale" : modelRestaurants.secondOfferMaxSale,
          "secondOfferActiveStart" : modelRestaurants.secondOfferActiveStart,
          "secondOfferActiveEnd" : modelRestaurants.secondOfferActiveEnd,

          //thaer(third offer elements)---------------------------------------
          "thirdOffer": modelRestaurants.thirdOffer,
          "thirdOfferImage": modelRestaurants.thirdOfferImage,
          "thirdOfferDetails": modelRestaurants.thirdOfferDetails,
          "thirdOfferStartingTime": modelRestaurants.thirdOfferStartingTime,
          "thirdOfferEndTime": modelRestaurants.thirdOfferEndTime,
          "thirdOfferDaySat": modelRestaurants.thirdOfferDaySat,
          "thirdOfferDaySun": modelRestaurants.thirdOfferDaySun,
          "thirdOfferDayMon": modelRestaurants.thirdOfferDayMon,
          "thirdOfferDayTus": modelRestaurants.thirdOfferDayTus,
          "thirdOfferDayWed": modelRestaurants.thirdOfferDayWed,
          "thirdOfferDayThu": modelRestaurants.thirdOfferDayThu,
          "thirdOfferDayFri": modelRestaurants.thirdOfferDayFri,
          "thirdOfferBreakfast": modelRestaurants.thirdOfferBreakfast,
          "thirdOfferLunch": modelRestaurants.thirdOfferLunch,
          "thirdOfferDinner": modelRestaurants.thirdOfferDinner,
          "thirdOfferShishaOffer": modelRestaurants.thirdOfferShishaOffer,
          "thirdOfferDelivery": modelRestaurants.thirdOfferDelivery,
          "thirdOfferBuffet": modelRestaurants.thirdOfferBuffet,
          "thirdOfferWeinOffer" : modelRestaurants.thirdOfferWeinOffer,
          "thirdOfferButtonText": modelRestaurants.thirdOfferButtonText,
          "thirdOfferSellingPrice": modelRestaurants.thirdOfferSellingPrice,
          "thirdOfferMaxSale": modelRestaurants.thirdOfferMaxSale,
          "thirdOfferActiveStart" : modelRestaurants.thirdOfferActiveStart,
          "thirdOfferActiveEnd" : modelRestaurants.thirdOfferActiveEnd,

          //thaer(fourth offer elements)---------------------------------------
          "fourthOffer": modelRestaurants.fourthOffer,
          "fourthOfferImage": modelRestaurants.fourthOfferImage,
          "fourthOfferDetails": modelRestaurants.fourthOfferDetails,
          "fourthOfferStartingTime": modelRestaurants.fourthOfferStartingTime,
          "fourthOfferEndTime": modelRestaurants.fourthOfferEndTime,
          "fourthOfferDaySat": modelRestaurants.fourthOfferDaySat,
          "fourthOfferDaySun": modelRestaurants.fourthOfferDaySun,
          "fourthOfferDayMon": modelRestaurants.fourthOfferDayMon,
          "fourthOfferDayTus": modelRestaurants.fourthOfferDayTus,
          "fourthOfferDayWed": modelRestaurants.fourthOfferDayWed,
          "fourthOfferDayThu": modelRestaurants.fourthOfferDayThu,
          "fourthOfferDayFri": modelRestaurants.fourthOfferDayFri,
          "fourthOfferBreakfast": modelRestaurants.fourthOfferBreakfast,
          "fourthOfferLunch": modelRestaurants.fourthOfferLunch,
          "fourthOfferDinner": modelRestaurants.fourthOfferDinner,
          "fourthOfferShishaOffer": modelRestaurants.fourthOfferShishaOffer,
          "fourthOfferDelivery": modelRestaurants.fourthOfferDelivery,
          "fourthOfferBuffet": modelRestaurants.fourthOfferBuffet,
          "fourthOfferWeinOffer" : modelRestaurants.fourthOfferWeinOffer,
          "fourthOfferButtonText": modelRestaurants.fourthOfferButtonText,
          "fourthOfferSellingPrice": modelRestaurants.fourthOfferSellingPrice,
          "fourthOfferMaxSale": modelRestaurants.fourthOfferMaxSale,
          "fourthOfferActiveStart" : modelRestaurants.fourthOfferActiveStart,
          "fourthOfferActiveEnd" : modelRestaurants.fourthOfferActiveEnd,

        });
  }

  Stream<QuerySnapshot> loadRestaurant() {
    return _firestore.collection('Restaurants List').snapshots();
  }

  Stream<QuerySnapshot> loadOffers() {
    return _firestore.collection('Offers List').snapshots();
  }

  deleteRestaurant(ooo) {
    _firestore.collection('Restaurants List').doc(ooo).delete();
  }

  deleteOffer(fff) {
    _firestore.collection('Offers List').doc(fff).delete();
  }

    editOffer(docName,data) {
    _firestore.collection('Offers List').doc(docName).update(data);
  }

  addOffer(ModelRestaurants modelRestaurants) async {
    await _firestore.collection('Offers List').doc(modelRestaurants.mainOfferDetails).set(
        {

// thaer(restaurant Main elements)---------------------------------------
          "restaurantName": modelRestaurants.restaurantName,
          "restaurantCode": modelRestaurants.restaurantCode,
          "RestaurantMainImage": modelRestaurants.restaurantMainImage,
          "rater": modelRestaurants.rater,
          "cuisine": modelRestaurants.cuisine,
          "address": modelRestaurants.address,
          "lat": modelRestaurants.lat,
          "long": modelRestaurants.long,
          "phone": modelRestaurants.phone,
          "openTime": modelRestaurants.openTime,
          "closeTime": modelRestaurants.closeTime,
          "shisha": modelRestaurants.shisha,
          "playingCard": modelRestaurants.playingCard,
          "nonSmoking": modelRestaurants.nonSmoking,
          "liveMusic": modelRestaurants.liveMusic,
          "sportScreen": modelRestaurants.sportScreen,
          "outdoor": modelRestaurants.outdoor,
          "acceptedCard": modelRestaurants.acceptedCard,
          "kidsFriendly": modelRestaurants.kidsFriendly,
          "valetParking": modelRestaurants.valetParking,
          "birthdayParty": modelRestaurants.birthdayParty,

//thaer(main offer elements)---------------------------------------
          "mainOffer": modelRestaurants.mainOffer,
          "mainOfferImage": modelRestaurants.mainOfferImage,
          "mainOfferDetails": modelRestaurants.mainOfferDetails,
          "mainOfferStartingTime": modelRestaurants.mainOfferStartingTime,
          "mainOfferEndTime": modelRestaurants.mainOfferEndTime,
          "mainOfferDaySat": modelRestaurants.mainOfferDaySat,
          "mainOfferDaySun": modelRestaurants.mainOfferDaySun,
          "mainOfferDayMon": modelRestaurants.mainOfferDayMon,
          "mainOfferDayTus": modelRestaurants.mainOfferDayTus,
          "mainOfferDayWed": modelRestaurants.mainOfferDayWed,
          "mainOfferDayThu": modelRestaurants.mainOfferDayThu,
          "mainOfferDayFri": modelRestaurants.mainOfferDayFri,
          "mainOfferBreakfast": modelRestaurants.mainOfferBreakfast,
          "mainOfferLunch": modelRestaurants.mainOfferLunch,
          "mainOfferDinner": modelRestaurants.mainOfferDinner,
          "mainOfferShishaOffer": modelRestaurants.mainOfferShishaOffer,
          "mainOfferDelivery": modelRestaurants.mainOfferDelivery,
          "mainOfferBuffet": modelRestaurants.mainOfferBuffet,
          "mainOfferWeinOffer" : modelRestaurants.mainOfferWeinOffer,
          "mainOfferButtonText": modelRestaurants.mainOfferButtonText,
          "mainOfferSellingPrice": modelRestaurants.mainOfferSellingPrice,
          "mainOfferMaxSale": modelRestaurants.mainOfferMaxSale,
          "mainOfferMaxSaleFirst": modelRestaurants.mainOfferMaxSale,
          "mainOfferActiveStart" : modelRestaurants.mainOfferActiveStart,
          "mainOfferActiveEnd" : modelRestaurants.mainOfferActiveEnd,



//thaer(second offer elements)---------------------------------------
          "secondOffer": modelRestaurants.secondOffer,
          "secondOfferImage": modelRestaurants.secondOfferImage,
          "secondOfferDetails": modelRestaurants.secondOfferDetails,
          "secondOfferStartingTime": modelRestaurants.secondOfferStartingTime,
          "secondOfferEndTime": modelRestaurants.secondOfferEndTime,
          "secondOfferDaySat": modelRestaurants.secondOfferDaySat,
          "secondOfferDaySun": modelRestaurants.secondOfferDaySun,
          "secondOfferDayMon": modelRestaurants.secondOfferDayMon,
          "secondOfferDayTus": modelRestaurants.secondOfferDayTus,
          "secondOfferDayWed": modelRestaurants.secondOfferDayWed,
          "secondOfferDayThu": modelRestaurants.secondOfferDayThu,
          "secondOfferDayFri": modelRestaurants.secondOfferDayFri,
          "secondOfferBreakfast": modelRestaurants.secondOfferBreakfast,
          "secondOfferLunch": modelRestaurants.secondOfferLunch,
          "secondOfferDinner": modelRestaurants.secondOfferDinner,
          "secondOfferShishaOffer": modelRestaurants.secondOfferShishaOffer,
          "secondOfferDelivery": modelRestaurants.secondOfferDelivery,
          "secondOfferBuffet": modelRestaurants.secondOfferBuffet,
          "secondOfferWeinOffer" : modelRestaurants.secondOfferWeinOffer,
          "secondOfferButtonText": modelRestaurants.secondOfferButtonText,
          "secondOfferSellingPrice": modelRestaurants.secondOfferSellingPrice,
          "secondOfferMaxSale" : modelRestaurants.secondOfferMaxSale,
          "secondOfferMaxSaleFirst": modelRestaurants.secondOfferMaxSale,
          "secondOfferActiveStart" : modelRestaurants.secondOfferActiveStart,
          "secondOfferActiveEnd" : modelRestaurants.secondOfferActiveEnd,

          //thaer(third offer elements)---------------------------------------
          "thirdOffer": modelRestaurants.thirdOffer,
          "thirdOfferImage": modelRestaurants.thirdOfferImage,
          "thirdOfferDetails": modelRestaurants.thirdOfferDetails,
          "thirdOfferStartingTime": modelRestaurants.thirdOfferStartingTime,
          "thirdOfferEndTime": modelRestaurants.thirdOfferEndTime,
          "thirdOfferDaySat": modelRestaurants.thirdOfferDaySat,
          "thirdOfferDaySun": modelRestaurants.thirdOfferDaySun,
          "thirdOfferDayMon": modelRestaurants.thirdOfferDayMon,
          "thirdOfferDayTus": modelRestaurants.thirdOfferDayTus,
          "thirdOfferDayWed": modelRestaurants.thirdOfferDayWed,
          "thirdOfferDayThu": modelRestaurants.thirdOfferDayThu,
          "thirdOfferDayFri": modelRestaurants.thirdOfferDayFri,
          "thirdOfferBreakfast": modelRestaurants.thirdOfferBreakfast,
          "thirdOfferLunch": modelRestaurants.thirdOfferLunch,
          "thirdOfferDinner": modelRestaurants.thirdOfferDinner,
          "thirdOfferShishaOffer": modelRestaurants.thirdOfferShishaOffer,
          "thirdOfferDelivery": modelRestaurants.thirdOfferDelivery,
          "thirdOfferBuffet": modelRestaurants.thirdOfferBuffet,
          "thirdOfferWeinOffer" : modelRestaurants.thirdOfferWeinOffer,
          "thirdOfferButtonText": modelRestaurants.thirdOfferButtonText,
          "thirdOfferSellingPrice": modelRestaurants.thirdOfferSellingPrice,
          "thirdOfferMaxSale": modelRestaurants.thirdOfferMaxSale,
          "thirdOfferMaxSaleFirst": modelRestaurants.thirdOfferMaxSale,
          "thirdOfferActiveStart" : modelRestaurants.thirdOfferActiveStart,
          "thirdOfferActiveEnd" : modelRestaurants.thirdOfferActiveEnd,

          //thaer(fourth offer elements)---------------------------------------
          "fourthOffer": modelRestaurants.fourthOffer,
          "fourthOfferImage": modelRestaurants.fourthOfferImage,
          "fourthOfferDetails": modelRestaurants.fourthOfferDetails,
          "fourthOfferStartingTime": modelRestaurants.fourthOfferStartingTime,
          "fourthOfferEndTime": modelRestaurants.fourthOfferEndTime,
          "fourthOfferDaySat": modelRestaurants.fourthOfferDaySat,
          "fourthOfferDaySun": modelRestaurants.fourthOfferDaySun,
          "fourthOfferDayMon": modelRestaurants.fourthOfferDayMon,
          "fourthOfferDayTus": modelRestaurants.fourthOfferDayTus,
          "fourthOfferDayWed": modelRestaurants.fourthOfferDayWed,
          "fourthOfferDayThu": modelRestaurants.fourthOfferDayThu,
          "fourthOfferDayFri": modelRestaurants.fourthOfferDayFri,
          "fourthOfferBreakfast": modelRestaurants.fourthOfferBreakfast,
          "fourthOfferLunch": modelRestaurants.fourthOfferLunch,
          "fourthOfferDinner": modelRestaurants.fourthOfferDinner,
          "fourthOfferShishaOffer": modelRestaurants.fourthOfferShishaOffer,
          "fourthOfferDelivery": modelRestaurants.fourthOfferDelivery,
          "fourthOfferBuffet": modelRestaurants.fourthOfferBuffet,
          "fourthOfferWeinOffer" : modelRestaurants.fourthOfferWeinOffer,
          "fourthOfferButtonText": modelRestaurants.fourthOfferButtonText,
          "fourthOfferSellingPrice": modelRestaurants.fourthOfferSellingPrice,
          "fourthOfferMaxSale": modelRestaurants.fourthOfferMaxSale,
          "fourthOfferMaxSaleFirst": modelRestaurants.fourthOfferMaxSale,
          "fourthOfferActiveStart" : modelRestaurants.fourthOfferActiveStart,
          "fourthOfferActiveEnd" : modelRestaurants.fourthOfferActiveEnd,

        });
  }


  addFirstOffer(ModelRestaurants modelRestaurants) async {
    await _firestore.collection('Offers List').doc(modelRestaurants.mainOfferDetails).set(
        {

// thaer(restaurant Main elements)---------------------------------------
          "restaurantName": modelRestaurants.restaurantName,
          "RestaurantMainImage": modelRestaurants.restaurantMainImage,
          "rater": modelRestaurants.rater,
          "cuisine": modelRestaurants.cuisine,
          "address": modelRestaurants.address,
          "openTime": modelRestaurants.openTime,
          "closeTime": modelRestaurants.closeTime,
          "shisha": modelRestaurants.shisha,
          "playingCard": modelRestaurants.playingCard,
          "nonSmoking": modelRestaurants.nonSmoking,
          "liveMusic": modelRestaurants.liveMusic,
          "sportScreen": modelRestaurants.sportScreen,
          "outdoor": modelRestaurants.outdoor,
          "acceptedCard": modelRestaurants.acceptedCard,
          "kidsFriendly": modelRestaurants.kidsFriendly,
          "valetParking": modelRestaurants.valetParking,
          "birthdayParty": modelRestaurants.birthdayParty,

//thaer(main offer elements)---------------------------------------
          "mainOffer": modelRestaurants.mainOffer,
          "mainOfferImage": modelRestaurants.mainOfferImage,
          "mainOfferDetails": modelRestaurants.mainOfferDetails,
          "mainOfferStartingTime": modelRestaurants.mainOfferStartingTime,
          "mainOfferEndTime": modelRestaurants.mainOfferEndTime,
          "mainOfferDaySat": modelRestaurants.mainOfferDaySat,
          "mainOfferDaySun": modelRestaurants.mainOfferDaySun,
          "mainOfferDayMon": modelRestaurants.mainOfferDayMon,
          "mainOfferDayTus": modelRestaurants.mainOfferDayTus,
          "mainOfferDayWed": modelRestaurants.mainOfferDayWed,
          "mainOfferDayThu": modelRestaurants.mainOfferDayThu,
          "mainOfferDayFri": modelRestaurants.mainOfferDayFri,
          "mainOfferBreakfast": modelRestaurants.mainOfferBreakfast,
          "mainOfferLunch": modelRestaurants.mainOfferLunch,
          "mainOfferDinner": modelRestaurants.mainOfferDinner,
          "mainOfferShishaOffer": modelRestaurants.mainOfferShishaOffer,
          "mainOfferDelivery": modelRestaurants.mainOfferDelivery,
          "mainOfferBuffet": modelRestaurants.mainOfferBuffet,
          "mainOfferWeinOffer" : modelRestaurants.mainOfferWeinOffer,
          "mainOfferButtonText": modelRestaurants.mainOfferButtonText,
          "mainOfferSellingPrice": modelRestaurants.mainOfferSellingPrice,

//thaer(second offer elements)---------------------------------------
          "secondOffer": modelRestaurants.secondOffer,
          "secondOfferImage": modelRestaurants.secondOfferImage,
          "secondOfferDetails": modelRestaurants.secondOfferDetails,
          "secondOfferStartingTime": modelRestaurants.secondOfferStartingTime,
          "secondOfferEndTime": modelRestaurants.secondOfferEndTime,
          "secondOfferDaySat": modelRestaurants.secondOfferDaySat,
          "secondOfferDaySun": modelRestaurants.secondOfferDaySun,
          "secondOfferDayMon": modelRestaurants.secondOfferDayMon,
          "secondOfferDayTus": modelRestaurants.secondOfferDayTus,
          "secondOfferDayWed": modelRestaurants.secondOfferDayWed,
          "secondOfferDayThu": modelRestaurants.secondOfferDayThu,
          "secondOfferDayFri": modelRestaurants.secondOfferDayFri,
          "secondOfferBreakfast": modelRestaurants.secondOfferBreakfast,
          "secondOfferLunch": modelRestaurants.secondOfferLunch,
          "secondOfferDinner": modelRestaurants.secondOfferDinner,
          "secondOfferShishaOffer": modelRestaurants.secondOfferShishaOffer,
          "secondOfferDelivery": modelRestaurants.secondOfferDelivery,
          "secondOfferBuffet": modelRestaurants.secondOfferBuffet,
          "secondOfferWeinOffer" : modelRestaurants.secondOfferWeinOffer,
          "secondOfferButtonText": modelRestaurants.secondOfferButtonText,
          "secondOfferSellingPrice": modelRestaurants.secondOfferSellingPrice,

          //thaer(third offer elements)---------------------------------------
          "thirdOffer": modelRestaurants.thirdOffer,
          "thirdOfferImage": modelRestaurants.thirdOfferImage,
          "thirdOfferDetails": modelRestaurants.thirdOfferDetails,
          "thirdOfferStartingTime": modelRestaurants.thirdOfferStartingTime,
          "thirdOfferEndTime": modelRestaurants.thirdOfferEndTime,
          "thirdOfferDaySat": modelRestaurants.thirdOfferDaySat,
          "thirdOfferDaySun": modelRestaurants.thirdOfferDaySun,
          "thirdOfferDayMon": modelRestaurants.thirdOfferDayMon,
          "thirdOfferDayTus": modelRestaurants.thirdOfferDayTus,
          "thirdOfferDayWed": modelRestaurants.thirdOfferDayWed,
          "thirdOfferDayThu": modelRestaurants.thirdOfferDayThu,
          "thirdOfferDayFri": modelRestaurants.thirdOfferDayFri,
          "thirdOfferBreakfast": modelRestaurants.thirdOfferBreakfast,
          "thirdOfferLunch": modelRestaurants.thirdOfferLunch,
          "thirdOfferDinner": modelRestaurants.thirdOfferDinner,
          "thirdOfferShishaOffer": modelRestaurants.thirdOfferShishaOffer,
          "thirdOfferDelivery": modelRestaurants.thirdOfferDelivery,
          "thirdOfferBuffet": modelRestaurants.thirdOfferBuffet,
          "thirdOfferWeinOffer" : modelRestaurants.thirdOfferWeinOffer,
          "thirdOfferButtonText": modelRestaurants.thirdOfferButtonText,
          "thirdOfferSellingPrice": modelRestaurants.thirdOfferSellingPrice,

          //thaer(fourth offer elements)---------------------------------------
          "fourthOffer": modelRestaurants.fourthOffer,
          "fourthOfferImage": modelRestaurants.fourthOfferImage,
          "fourthOfferDetails": modelRestaurants.fourthOfferDetails,
          "fourthOfferStartingTime": modelRestaurants.fourthOfferStartingTime,
          "fourthOfferEndTime": modelRestaurants.fourthOfferEndTime,
          "fourthOfferDaySat": modelRestaurants.fourthOfferDaySat,
          "fourthOfferDaySun": modelRestaurants.fourthOfferDaySun,
          "fourthOfferDayMon": modelRestaurants.fourthOfferDayMon,
          "fourthOfferDayTus": modelRestaurants.fourthOfferDayTus,
          "fourthOfferDayWed": modelRestaurants.fourthOfferDayWed,
          "fourthOfferDayThu": modelRestaurants.fourthOfferDayThu,
          "fourthOfferDayFri": modelRestaurants.fourthOfferDayFri,
          "fourthOfferBreakfast": modelRestaurants.fourthOfferBreakfast,
          "fourthOfferLunch": modelRestaurants.fourthOfferLunch,
          "fourthOfferDinner": modelRestaurants.fourthOfferDinner,
          "fourthOfferShishaOffer": modelRestaurants.fourthOfferShishaOffer,
          "fourthOfferDelivery": modelRestaurants.fourthOfferDelivery,
          "fourthOfferBuffet": modelRestaurants.fourthOfferBuffet,
          "fourthOfferWeinOffer" : modelRestaurants.fourthOfferWeinOffer,
          "fourthOfferButtonText": modelRestaurants.fourthOfferButtonText,
          "fourthOfferSellingPrice": modelRestaurants.fourthOfferSellingPrice,

        });
  }

  addSecondOffer(ModelRestaurants modelRestaurants) async {
    await _firestore.collection('Offers List').doc(modelRestaurants.secondOfferDetails).set(
        {

// thaer(restaurant Main elements)---------------------------------------
          "restaurantName": modelRestaurants.restaurantName,
          "RestaurantMainImage": modelRestaurants.restaurantMainImage,
          "rater": modelRestaurants.rater,
          "cuisine": modelRestaurants.cuisine,
          "address": modelRestaurants.address,
          "openTime": modelRestaurants.openTime,
          "closeTime": modelRestaurants.closeTime,
          "shisha": modelRestaurants.shisha,
          "playingCard": modelRestaurants.playingCard,
          "nonSmoking": modelRestaurants.nonSmoking,
          "liveMusic": modelRestaurants.liveMusic,
          "sportScreen": modelRestaurants.sportScreen,
          "outdoor": modelRestaurants.outdoor,
          "acceptedCard": modelRestaurants.acceptedCard,
          "kidsFriendly": modelRestaurants.kidsFriendly,
          "valetParking": modelRestaurants.valetParking,
          "birthdayParty": modelRestaurants.birthdayParty,

//thaer(second offer elements)---------------------------------------
          "secondOffer": modelRestaurants.mainOffer,
          "secondOfferImage": modelRestaurants.mainOfferImage,
          "secondOfferDetails": modelRestaurants.mainOfferDetails,
          "secondOfferStartingTime": modelRestaurants.mainOfferStartingTime,
          "secondOfferEndTime": modelRestaurants.mainOfferEndTime,
          "secondOfferDaySat": modelRestaurants.mainOfferDaySat,
          "secondOfferDaySun": modelRestaurants.mainOfferDaySun,
          "secondOfferDayMon": modelRestaurants.mainOfferDayMon,
          "secondOfferDayTus": modelRestaurants.mainOfferDayTus,
          "secondOfferDayWed": modelRestaurants.mainOfferDayWed,
          "secondOfferDayThu": modelRestaurants.mainOfferDayThu,
          "secondOfferDayFri": modelRestaurants.mainOfferDayFri,
          "secondOfferBreakfast": modelRestaurants.mainOfferBreakfast,
          "secondOfferLunch": modelRestaurants.mainOfferLunch,
          "secondOfferDinner": modelRestaurants.mainOfferDinner,
          "secondOfferShishaOffer": modelRestaurants.mainOfferShishaOffer,
          "secondOfferDelivery": modelRestaurants.mainOfferDelivery,
          "secondOfferBuffet": modelRestaurants.mainOfferBuffet,
          "secondOfferWeinOffer" : modelRestaurants.mainOfferWeinOffer,
          "secondOfferButtonText": modelRestaurants.mainOfferButtonText,
          "secondOfferSellingPrice": modelRestaurants.mainOfferSellingPrice,

//thaer(main offer elements)---------------------------------------
          "mainOffer": modelRestaurants.secondOffer,
          "mainOfferImage": modelRestaurants.secondOfferImage,
          "mainOfferDetails": modelRestaurants.secondOfferDetails,
          "mainOfferStartingTime": modelRestaurants.secondOfferStartingTime,
          "mainOfferEndTime": modelRestaurants.secondOfferEndTime,
          "mainOfferDaySat": modelRestaurants.secondOfferDaySat,
          "mainOfferDaySun": modelRestaurants.secondOfferDaySun,
          "mainOfferDayMon": modelRestaurants.secondOfferDayMon,
          "mainOfferDayTus": modelRestaurants.secondOfferDayTus,
          "mainOfferDayWed": modelRestaurants.secondOfferDayWed,
          "mainOfferDayThu": modelRestaurants.secondOfferDayThu,
          "mainOfferDayFri": modelRestaurants.secondOfferDayFri,
          "mainOfferBreakfast": modelRestaurants.secondOfferBreakfast,
          "mainOfferLunch": modelRestaurants.secondOfferLunch,
          "mainOfferDinner": modelRestaurants.secondOfferDinner,
          "mainOfferShishaOffer": modelRestaurants.secondOfferShishaOffer,
          "mainOfferDelivery": modelRestaurants.secondOfferDelivery,
          "mainOfferBuffet": modelRestaurants.secondOfferBuffet,
          "mainOfferWeinOffer" : modelRestaurants.secondOfferWeinOffer,
          "mainOfferButtonText": modelRestaurants.secondOfferButtonText,
          "mainOfferSellingPrice": modelRestaurants.secondOfferSellingPrice,

          //thaer(third offer elements)---------------------------------------
          "thirdOffer": modelRestaurants.thirdOffer,
          "thirdOfferImage": modelRestaurants.thirdOfferImage,
          "thirdOfferDetails": modelRestaurants.thirdOfferDetails,
          "thirdOfferStartingTime": modelRestaurants.thirdOfferStartingTime,
          "thirdOfferEndTime": modelRestaurants.thirdOfferEndTime,
          "thirdOfferDaySat": modelRestaurants.thirdOfferDaySat,
          "thirdOfferDaySun": modelRestaurants.thirdOfferDaySun,
          "thirdOfferDayMon": modelRestaurants.thirdOfferDayMon,
          "thirdOfferDayTus": modelRestaurants.thirdOfferDayTus,
          "thirdOfferDayWed": modelRestaurants.thirdOfferDayWed,
          "thirdOfferDayThu": modelRestaurants.thirdOfferDayThu,
          "thirdOfferDayFri": modelRestaurants.thirdOfferDayFri,
          "thirdOfferBreakfast": modelRestaurants.thirdOfferBreakfast,
          "thirdOfferLunch": modelRestaurants.thirdOfferLunch,
          "thirdOfferDinner": modelRestaurants.thirdOfferDinner,
          "thirdOfferShishaOffer": modelRestaurants.thirdOfferShishaOffer,
          "thirdOfferDelivery": modelRestaurants.thirdOfferDelivery,
          "thirdOfferBuffet": modelRestaurants.thirdOfferBuffet,
          "thirdOfferWeinOffer" : modelRestaurants.thirdOfferWeinOffer,
          "thirdOfferButtonText": modelRestaurants.thirdOfferButtonText,
          "thirdOfferSellingPrice": modelRestaurants.thirdOfferSellingPrice,

          //thaer(fourth offer elements)---------------------------------------
          "fourthOffer": modelRestaurants.fourthOffer,
          "fourthOfferImage": modelRestaurants.fourthOfferImage,
          "fourthOfferDetails": modelRestaurants.fourthOfferDetails,
          "fourthOfferStartingTime": modelRestaurants.fourthOfferStartingTime,
          "fourthOfferEndTime": modelRestaurants.fourthOfferEndTime,
          "fourthOfferDaySat": modelRestaurants.fourthOfferDaySat,
          "fourthOfferDaySun": modelRestaurants.fourthOfferDaySun,
          "fourthOfferDayMon": modelRestaurants.fourthOfferDayMon,
          "fourthOfferDayTus": modelRestaurants.fourthOfferDayTus,
          "fourthOfferDayWed": modelRestaurants.fourthOfferDayWed,
          "fourthOfferDayThu": modelRestaurants.fourthOfferDayThu,
          "fourthOfferDayFri": modelRestaurants.fourthOfferDayFri,
          "fourthOfferBreakfast": modelRestaurants.fourthOfferBreakfast,
          "fourthOfferLunch": modelRestaurants.fourthOfferLunch,
          "fourthOfferDinner": modelRestaurants.fourthOfferDinner,
          "fourthOfferShishaOffer": modelRestaurants.fourthOfferShishaOffer,
          "fourthOfferDelivery": modelRestaurants.fourthOfferDelivery,
          "fourthOfferBuffet": modelRestaurants.fourthOfferBuffet,
          "fourthOfferWeinOffer" : modelRestaurants.fourthOfferWeinOffer,
          "fourthOfferButtonText": modelRestaurants.fourthOfferButtonText,
          "fourthOfferSellingPrice": modelRestaurants.fourthOfferSellingPrice,

        });
  }

  addThirdOffer(ModelRestaurants modelRestaurants) async {
    await _firestore.collection('Offers List').doc(modelRestaurants.thirdOfferDetails).set(
        {

// thaer(restaurant Main elements)---------------------------------------
          "restaurantName": modelRestaurants.restaurantName,
          "RestaurantMainImage": modelRestaurants.restaurantMainImage,
          "rater": modelRestaurants.rater,
          "cuisine": modelRestaurants.cuisine,
          "address": modelRestaurants.address,
          "openTime": modelRestaurants.openTime,
          "closeTime": modelRestaurants.closeTime,
          "shisha": modelRestaurants.shisha,
          "playingCard": modelRestaurants.playingCard,
          "nonSmoking": modelRestaurants.nonSmoking,
          "liveMusic": modelRestaurants.liveMusic,
          "sportScreen": modelRestaurants.sportScreen,
          "outdoor": modelRestaurants.outdoor,
          "acceptedCard": modelRestaurants.acceptedCard,
          "kidsFriendly": modelRestaurants.kidsFriendly,
          "valetParking": modelRestaurants.valetParking,
          "birthdayParty": modelRestaurants.birthdayParty,

//thaer(third offer elements)---------------------------------------
          "thirdOffer": modelRestaurants.mainOffer,
          "thirdOfferImage": modelRestaurants.mainOfferImage,
          "thirdOfferDetails": modelRestaurants.mainOfferDetails,
          "thirdOfferStartingTime": modelRestaurants.mainOfferStartingTime,
          "thirdOfferEndTime": modelRestaurants.mainOfferEndTime,
          "thirdOfferDaySat": modelRestaurants.mainOfferDaySat,
          "thirdOfferDaySun": modelRestaurants.mainOfferDaySun,
          "thirdOfferDayMon": modelRestaurants.mainOfferDayMon,
          "thirdOfferDayTus": modelRestaurants.mainOfferDayTus,
          "thirdOfferDayWed": modelRestaurants.mainOfferDayWed,
          "thirdOfferDayThu": modelRestaurants.mainOfferDayThu,
          "thirdOfferDayFri": modelRestaurants.mainOfferDayFri,
          "thirdOfferBreakfast": modelRestaurants.mainOfferBreakfast,
          "thirdOfferLunch": modelRestaurants.mainOfferLunch,
          "thirdOfferDinner": modelRestaurants.mainOfferDinner,
          "thirdOfferShishaOffer": modelRestaurants.mainOfferShishaOffer,
          "thirdOfferDelivery": modelRestaurants.mainOfferDelivery,
          "thirdOfferBuffet": modelRestaurants.mainOfferBuffet,
          "thirdOfferWeinOffer" : modelRestaurants.mainOfferWeinOffer,
          "thirdOfferButtonText": modelRestaurants.mainOfferButtonText,
          "thirdOfferSellingPrice": modelRestaurants.mainOfferSellingPrice,

//thaer(second offer elements)---------------------------------------
          "secondOffer": modelRestaurants.secondOffer,
          "secondOfferImage": modelRestaurants.secondOfferImage,
          "secondOfferDetails": modelRestaurants.secondOfferDetails,
          "secondOfferStartingTime": modelRestaurants.secondOfferStartingTime,
          "secondOfferEndTime": modelRestaurants.secondOfferEndTime,
          "secondOfferDaySat": modelRestaurants.secondOfferDaySat,
          "secondOfferDaySun": modelRestaurants.secondOfferDaySun,
          "secondOfferDayMon": modelRestaurants.secondOfferDayMon,
          "secondOfferDayTus": modelRestaurants.secondOfferDayTus,
          "secondOfferDayWed": modelRestaurants.secondOfferDayWed,
          "secondOfferDayThu": modelRestaurants.secondOfferDayThu,
          "secondOfferDayFri": modelRestaurants.secondOfferDayFri,
          "secondOfferBreakfast": modelRestaurants.secondOfferBreakfast,
          "secondOfferLunch": modelRestaurants.secondOfferLunch,
          "secondOfferDinner": modelRestaurants.secondOfferDinner,
          "secondOfferShishaOffer": modelRestaurants.secondOfferShishaOffer,
          "secondOfferDelivery": modelRestaurants.secondOfferDelivery,
          "secondOfferBuffet": modelRestaurants.secondOfferBuffet,
          "secondOfferWeinOffer" : modelRestaurants.secondOfferWeinOffer,
          "secondOfferButtonText": modelRestaurants.secondOfferButtonText,
          "secondOfferSellingPrice": modelRestaurants.secondOfferSellingPrice,

          //thaer(main offer elements)---------------------------------------
          "mainOffer": modelRestaurants.thirdOffer,
          "mainOfferImage": modelRestaurants.thirdOfferImage,
          "mainOfferDetails": modelRestaurants.thirdOfferDetails,
          "mainOfferStartingTime": modelRestaurants.thirdOfferStartingTime,
          "mainOfferEndTime": modelRestaurants.thirdOfferEndTime,
          "mainOfferDaySat": modelRestaurants.thirdOfferDaySat,
          "mainOfferDaySun": modelRestaurants.thirdOfferDaySun,
          "mainOfferDayMon": modelRestaurants.thirdOfferDayMon,
          "mainOfferDayTus": modelRestaurants.thirdOfferDayTus,
          "mainOfferDayWed": modelRestaurants.thirdOfferDayWed,
          "mainOfferDayThu": modelRestaurants.thirdOfferDayThu,
          "mainOfferDayFri": modelRestaurants.thirdOfferDayFri,
          "mainOfferBreakfast": modelRestaurants.thirdOfferBreakfast,
          "mainOfferLunch": modelRestaurants.thirdOfferLunch,
          "mainOfferDinner": modelRestaurants.thirdOfferDinner,
          "mainOfferShishaOffer": modelRestaurants.thirdOfferShishaOffer,
          "mainOfferDelivery": modelRestaurants.thirdOfferDelivery,
          "mainOfferBuffet": modelRestaurants.thirdOfferBuffet,
          "mainOfferWeinOffer" : modelRestaurants.thirdOfferWeinOffer,
          "mainOfferButtonText": modelRestaurants.thirdOfferButtonText,
          "mainOfferSellingPrice": modelRestaurants.thirdOfferSellingPrice,

//thaer(fourth offer elements)---------------------------------------
          "fourthOffer": modelRestaurants.fourthOffer,
          "fourthOfferImage": modelRestaurants.fourthOfferImage,
          "fourthOfferDetails": modelRestaurants.fourthOfferDetails,
          "fourthOfferStartingTime": modelRestaurants.fourthOfferStartingTime,
          "fourthOfferEndTime": modelRestaurants.fourthOfferEndTime,
          "fourthOfferDaySat": modelRestaurants.fourthOfferDaySat,
          "fourthOfferDaySun": modelRestaurants.fourthOfferDaySun,
          "fourthOfferDayMon": modelRestaurants.fourthOfferDayMon,
          "fourthOfferDayTus": modelRestaurants.fourthOfferDayTus,
          "fourthOfferDayWed": modelRestaurants.fourthOfferDayWed,
          "fourthOfferDayThu": modelRestaurants.fourthOfferDayThu,
          "fourthOfferDayFri": modelRestaurants.fourthOfferDayFri,
          "fourthOfferBreakfast": modelRestaurants.fourthOfferBreakfast,
          "fourthOfferLunch": modelRestaurants.fourthOfferLunch,
          "fourthOfferDinner": modelRestaurants.fourthOfferDinner,
          "fourthOfferShishaOffer": modelRestaurants.fourthOfferShishaOffer,
          "fourthOfferDelivery": modelRestaurants.fourthOfferDelivery,
          "fourthOfferBuffet": modelRestaurants.fourthOfferBuffet,
          "fourthOfferWeinOffer" : modelRestaurants.fourthOfferWeinOffer,
          "fourthOfferButtonText": modelRestaurants.fourthOfferButtonText,
          "fourthOfferSellingPrice": modelRestaurants.fourthOfferSellingPrice,

        });
  }

  addFourthOffer(ModelRestaurants modelRestaurants) async {
    await _firestore.collection('Offers List').doc(modelRestaurants.fourthOfferDetails).set(
        {

// thaer(restaurant Main elements)---------------------------------------
          "restaurantName": modelRestaurants.restaurantName,
          "RestaurantMainImage": modelRestaurants.restaurantMainImage,
          "rater": modelRestaurants.rater,
          "cuisine": modelRestaurants.cuisine,
          "address": modelRestaurants.address,
          "openTime": modelRestaurants.openTime,
          "closeTime": modelRestaurants.closeTime,
          "shisha": modelRestaurants.shisha,
          "playingCard": modelRestaurants.playingCard,
          "nonSmoking": modelRestaurants.nonSmoking,
          "liveMusic": modelRestaurants.liveMusic,
          "sportScreen": modelRestaurants.sportScreen,
          "outdoor": modelRestaurants.outdoor,
          "acceptedCard": modelRestaurants.acceptedCard,
          "kidsFriendly": modelRestaurants.kidsFriendly,
          "valetParking": modelRestaurants.valetParking,
          "birthdayParty": modelRestaurants.birthdayParty,

//thaer(fourth offer elements)---------------------------------------
          "fourthOffer": modelRestaurants.mainOffer,
          "fourthOfferImage": modelRestaurants.mainOfferImage,
          "fourthOfferDetails": modelRestaurants.mainOfferDetails,
          "fourthOfferStartingTime": modelRestaurants.mainOfferStartingTime,
          "fourthOfferEndTime": modelRestaurants.mainOfferEndTime,
          "fourthOfferDaySat": modelRestaurants.mainOfferDaySat,
          "fourthOfferDaySun": modelRestaurants.mainOfferDaySun,
          "fourthOfferDayMon": modelRestaurants.mainOfferDayMon,
          "fourthOfferDayTus": modelRestaurants.mainOfferDayTus,
          "fourthOfferDayWed": modelRestaurants.mainOfferDayWed,
          "fourthOfferDayThu": modelRestaurants.mainOfferDayThu,
          "fourthOfferDayFri": modelRestaurants.mainOfferDayFri,
          "fourthOfferBreakfast": modelRestaurants.mainOfferBreakfast,
          "fourthOfferLunch": modelRestaurants.mainOfferLunch,
          "fourthOfferDinner": modelRestaurants.mainOfferDinner,
          "fourthOfferShishaOffer": modelRestaurants.mainOfferShishaOffer,
          "fourthOfferDelivery": modelRestaurants.mainOfferDelivery,
          "fourthOfferBuffet": modelRestaurants.mainOfferBuffet,
          "fourthOfferWeinOffer" : modelRestaurants.mainOfferWeinOffer,
          "fourthOfferButtonText": modelRestaurants.mainOfferButtonText,
          "fourthOfferSellingPrice": modelRestaurants.mainOfferSellingPrice,

//thaer(second offer elements)---------------------------------------
          "secondOffer": modelRestaurants.secondOffer,
          "secondOfferImage": modelRestaurants.secondOfferImage,
          "secondOfferDetails": modelRestaurants.secondOfferDetails,
          "secondOfferStartingTime": modelRestaurants.secondOfferStartingTime,
          "secondOfferEndTime": modelRestaurants.secondOfferEndTime,
          "secondOfferDaySat": modelRestaurants.secondOfferDaySat,
          "secondOfferDaySun": modelRestaurants.secondOfferDaySun,
          "secondOfferDayMon": modelRestaurants.secondOfferDayMon,
          "secondOfferDayTus": modelRestaurants.secondOfferDayTus,
          "secondOfferDayWed": modelRestaurants.secondOfferDayWed,
          "secondOfferDayThu": modelRestaurants.secondOfferDayThu,
          "secondOfferDayFri": modelRestaurants.secondOfferDayFri,
          "secondOfferBreakfast": modelRestaurants.secondOfferBreakfast,
          "secondOfferLunch": modelRestaurants.secondOfferLunch,
          "secondOfferDinner": modelRestaurants.secondOfferDinner,
          "secondOfferShishaOffer": modelRestaurants.secondOfferShishaOffer,
          "secondOfferDelivery": modelRestaurants.secondOfferDelivery,
          "secondOfferBuffet": modelRestaurants.secondOfferBuffet,
          "secondOfferWeinOffer" : modelRestaurants.secondOfferWeinOffer,
          "secondOfferButtonText": modelRestaurants.secondOfferButtonText,
          "secondOfferSellingPrice": modelRestaurants.secondOfferSellingPrice,

          //thaer(third offer elements)---------------------------------------
          "thirdOffer": modelRestaurants.thirdOffer,
          "thirdOfferImage": modelRestaurants.thirdOfferImage,
          "thirdOfferDetails": modelRestaurants.thirdOfferDetails,
          "thirdOfferStartingTime": modelRestaurants.thirdOfferStartingTime,
          "thirdOfferEndTime": modelRestaurants.thirdOfferEndTime,
          "thirdOfferDaySat": modelRestaurants.thirdOfferDaySat,
          "thirdOfferDaySun": modelRestaurants.thirdOfferDaySun,
          "thirdOfferDayMon": modelRestaurants.thirdOfferDayMon,
          "thirdOfferDayTus": modelRestaurants.thirdOfferDayTus,
          "thirdOfferDayWed": modelRestaurants.thirdOfferDayWed,
          "thirdOfferDayThu": modelRestaurants.thirdOfferDayThu,
          "thirdOfferDayFri": modelRestaurants.thirdOfferDayFri,
          "thirdOfferBreakfast": modelRestaurants.thirdOfferBreakfast,
          "thirdOfferLunch": modelRestaurants.thirdOfferLunch,
          "thirdOfferDinner": modelRestaurants.thirdOfferDinner,
          "thirdOfferShishaOffer": modelRestaurants.thirdOfferShishaOffer,
          "thirdOfferDelivery": modelRestaurants.thirdOfferDelivery,
          "thirdOfferBuffet": modelRestaurants.thirdOfferBuffet,
          "thirdOfferWeinOffer" : modelRestaurants.thirdOfferWeinOffer,
          "thirdOfferButtonText": modelRestaurants.thirdOfferButtonText,
          "thirdOfferSellingPrice": modelRestaurants.thirdOfferSellingPrice,

          //thaer(main offer elements)---------------------------------------
          "mainOffer": modelRestaurants.fourthOffer,
          "mainOfferImage": modelRestaurants.fourthOfferImage,
          "mainOfferDetails": modelRestaurants.fourthOfferDetails,
          "mainOfferStartingTime": modelRestaurants.fourthOfferStartingTime,
          "mainOfferEndTime": modelRestaurants.fourthOfferEndTime,
          "mainOfferDaySat": modelRestaurants.fourthOfferDaySat,
          "mainOfferDaySun": modelRestaurants.fourthOfferDaySun,
          "mainOfferDayMon": modelRestaurants.fourthOfferDayMon,
          "mainOfferDayTus": modelRestaurants.fourthOfferDayTus,
          "mainOfferDayWed": modelRestaurants.fourthOfferDayWed,
          "mainOfferDayThu": modelRestaurants.fourthOfferDayThu,
          "mainOfferDayFri": modelRestaurants.fourthOfferDayFri,
          "mainOfferBreakfast": modelRestaurants.fourthOfferBreakfast,
          "mainOfferLunch": modelRestaurants.fourthOfferLunch,
          "mainOfferDinner": modelRestaurants.fourthOfferDinner,
          "mainOfferShishaOffer": modelRestaurants.fourthOfferShishaOffer,
          "mainOfferDelivery": modelRestaurants.fourthOfferDelivery,
          "mainOfferBuffet": modelRestaurants.fourthOfferBuffet,
          "mainOfferWeinOffer" : modelRestaurants.fourthOfferWeinOffer,
          "mainOfferButtonText": modelRestaurants.fourthOfferButtonText,
          "mainOfferSellingPrice": modelRestaurants.fourthOfferSellingPrice,

        });
  }













  successAddAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Added successfully',style: TextStyle(color: Colors.lightBlueAccent),),
      actions: <Widget>[
        Row(
          children: [
            TextButton(
                child: Text('Done',style: TextStyle(color: Colors.blue[750],fontWeight: FontWeight.bold),),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, DashBoardRestaurants.id);
                }),
          ],
        )
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
  loadingAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Loading.....',style: TextStyle(color: Colors.lightBlueAccent),),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  noSelectedImageAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Should fill all fields and add all Images',style: TextStyle(color: Colors.lightBlueAccent),),
      actions: <Widget>[
        TextButton(
            child: Text('Back',style: TextStyle(color: Colors.red[600]),),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
