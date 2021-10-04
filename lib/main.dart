import 'package:flutter/material.dart';
import 'package:wein/dash_board/Notifications/add%20_notification.dart';
import 'package:wein/dash_board/Notifications/notifications_dash_board.dart';
import 'package:wein/dash_board/add_menu/restaurant_menu.dart';
import 'package:wein/dash_board/homeAd/add_home_ad.dart';
import 'package:wein/dash_board/homeAd/homeAd_dashBoard.dart';
import 'package:wein/dash_board/purchaseDAshBoard.dart';
import 'package:wein/dash_board/reviews/add_review_admin.dart';
import 'package:wein/dash_board/reviews/reviews_dash_board.dart';
import 'package:wein/dash_board/soldVouchers.dart';
import 'package:wein/dash_board/users.dart';
import 'package:wein/dash_board/welcomeAd/add_welcome_ad.dart';
import 'package:wein/dash_board/welcomeAd/welcomeAd_dashBoard.dart';
import 'package:wein/screens/aboutWeinApp.dart';
import 'package:wein/screens/add_review.dart';
import 'package:wein/screens/getHelp.dart';
import 'package:wein/screens/login_phone/signin_phone.dart';
import 'package:wein/screens/menu_screen.dart';
import 'package:wein/screens/notifications.dart';
import 'package:wein/screens/payment/myPurchase.dart';
import 'package:wein/screens/payment/paymentScreen.dart';
import 'package:wein/screens/restaurant_page2.dart';
import 'package:wein/screens/start_menu_screen.dart';
import 'package:wein/screens/termsConditions.dart';
import 'package:wein/dash_board/dash_board.dart';
import 'package:wein/dash_board/how_to_use/add_how_to_use.dart';
import 'package:wein/dash_board/how_to_use/how_to_use.dart';
import 'package:wein/dash_board/restaurants/addNewRestaurant.dart';
import 'package:wein/dash_board/restaurants/dashBoardRestaurants.dart';
import 'package:wein/screens/On_Boarding.dart';
import 'package:wein/screens/home.dart';
import 'package:wein/screens/login_screen.dart';
import 'package:wein/screens/map_list.dart';
import 'package:wein/screens/offers_list.dart';
import 'package:wein/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dash_board/offers_dashboard.dart';
import 'screens/ad_screen.dart';

// Future<void> main()
// async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           primaryColor: Colors.lightBlueAccent),
//       home: AdScreen(),
//       routes: {
//         LoginScreen.id: (context) => LoginScreen(),
//         SigninPhoneScreen.id: (context) => SigninPhoneScreen(),
//         Logout.id: (context) => Logout(),
//         AdScreen.id: (context) => AdScreen(),
//         OnBoarding.id: (context) => OnBoarding(),
//         Home.id: (context) => Home(),
//         DashBoard.id: (context) => DashBoard(),
//         HowToUse.id: (context) => HowToUse(),
//         AddHowToUse.id: (context) => AddHowToUse(),
//         OffersList.id: (context) => OffersList(),
//         DashBoardOffersList.id: (context) => DashBoardOffersList(),
//         DashBoardRestaurants.id: (context) => DashBoardRestaurants(),
//         AddNewRestaurant.id: (context) =>AddNewRestaurant(),
//         RestaurantScreen2.id: (context) =>RestaurantScreen2(),
//         MapList.id: (context) =>MapList(),
//         Notifications.id: (context) =>Notifications(),
//         NotificationsDashBoard.id: (context) =>NotificationsDashBoard(),
//         AddNotification.id: (context) =>AddNotification(),
//         OffersDashboard.id: (context) =>OffersDashboard(),
//         AddMenu.id: (context) =>AddMenu(),
//         MenuScreen.id: (context) =>MenuScreen(),
//         StartMenuScreen.id: (context) =>StartMenuScreen(),
//         AddReview.id: (context) =>AddReview(),
//         ReviewsDashBoard.id: (context) =>ReviewsDashBoard(),
//         AddReviewAdmin.id: (context) =>AddReviewAdmin(),
//         AddWelcomeAd.id: (context) =>AddWelcomeAd(),
//         WelcomeAdDashBoard.id: (context) =>WelcomeAdDashBoard(),
//         AddHomeAd.id: (context) =>AddHomeAd(),
//         HomeAdDashBoard.id: (context) =>HomeAdDashBoard(),
//         GetHelp.id: (context) =>GetHelp(),
//         TermsConditions.id: (context) =>TermsConditions(),
//         AboutWeinApp.id: (context) =>AboutWeinApp(),
//         PaymentScreen.id: (context) =>PaymentScreen(),
//         MyPurchase.id: (context) =>MyPurchase(),
//         SoldVouchers.id: (context) =>SoldVouchers(),
//
//
//       },
//     );
//   }
// }


//thaer(وقفناه موقتا لحتى نخلص بناء ونحل مشكلة السبلاش سكلرين
// وقت بدك ترجعها متل أول بتمحي الموجود كله من  من عند امبورت
//وبتنسخ الموجود هون كامل
// لاتنسى تضيف الصفحات الجديدة على routes
//--------------------------------------------------------------------


Future<void> main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: 9000)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: Colors.lightBlueAccent),
              home: SplashScreen());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.lightBlueAccent),
            home: AdScreen(),
            routes: {
              // SplashScreen.id: (context) =>SplashScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              SigninPhoneScreen.id: (context) => SigninPhoneScreen(),
              AdScreen.id: (context) => AdScreen(),
              OnBoarding.id: (context) => OnBoarding(),
              Home.id: (context) => Home(),
              DashBoard.id: (context) => DashBoard(),
              HowToUse.id: (context) => HowToUse(),
              AddHowToUse.id: (context) => AddHowToUse(),
              OffersList.id: (context) => OffersList(),
              DashBoardRestaurants.id: (context) => DashBoardRestaurants(),
              UsersDashBoard.id: (context) => UsersDashBoard(),
              PurchaseDshBoard.id: (context) => PurchaseDshBoard(),
              AddNewRestaurant.id: (context) =>AddNewRestaurant(),
              RestaurantScreen2.id: (context) =>RestaurantScreen2(),
              MapList.id: (context) =>MapList(),
              Notifications.id: (context) =>Notifications(),
              NotificationsDashBoard.id: (context) =>NotificationsDashBoard(),
              AddNotification.id: (context) =>AddNotification(),
              OffersDashboard.id: (context) =>OffersDashboard(),
              AddMenu.id: (context) =>AddMenu(),
              MenuScreen.id: (context) =>MenuScreen(),
              StartMenuScreen.id: (context) =>StartMenuScreen(),
              AddReview.id: (context) =>AddReview(),
              ReviewsDashBoard.id: (context) =>ReviewsDashBoard(),
              AddReviewAdmin.id: (context) =>AddReviewAdmin(),
              AddWelcomeAd.id: (context) =>AddWelcomeAd(),
              WelcomeAdDashBoard.id: (context) =>WelcomeAdDashBoard(),
              AddHomeAd.id: (context) =>AddHomeAd(),
              HomeAdDashBoard.id: (context) =>HomeAdDashBoard(),
              GetHelp.id: (context) =>GetHelp(),
              TermsConditions.id: (context) =>TermsConditions(),
              AboutWeinApp.id: (context) =>AboutWeinApp(),
              PaymentScreen.id: (context) =>PaymentScreen(),
              MyPurchase.id: (context) =>MyPurchase(),
              SoldVouchers.id: (context) =>SoldVouchers(),


            },
          );
        }
      },
    );
  }
}
