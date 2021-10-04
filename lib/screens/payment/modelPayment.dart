class ModelPayment{

// thaer(restaurant Main elements)---------------------------------------
  String restaurantName;
  String restaurantCode;

//thaer(main offer elements)---------------------------------------
  String mainOfferDetails;
  String mainOfferStartingTime;
  String mainOfferEndTime;
  bool mainOfferDaySat;
  bool mainOfferDaySun;
  bool mainOfferDayMon;
  bool mainOfferDayTus;
  bool mainOfferDayWed;
  bool mainOfferDayThu;
  bool mainOfferDayFri;
  String mainOfferSellingPrice;


  //thaer(payment elements)---------------------------------------
  String paymentDate;
  String paymentExpireDate;
  String voucherId;
  bool paymentAvailable;
  bool paymentUsed;
  String fullDateRedeem;
  String fullDatePayment;
  String token;



  ModelPayment({

// thaer(restaurant Main elements)---------------------------------------

    required this.restaurantName,
    required this.restaurantCode,

//thaer(main offer elements)---------------------------------------
    required this.mainOfferDetails,
    required this.mainOfferStartingTime,
    required this.mainOfferEndTime,
    required this.mainOfferDaySat,
    required this.mainOfferDaySun,
    required this.mainOfferDayMon,
    required this.mainOfferDayTus,
    required this.mainOfferDayWed,
    required this.mainOfferDayThu,
    required this.mainOfferDayFri,
    required this.mainOfferSellingPrice,


//thaer(payment elements)---------------------------------------
    required this. paymentDate,
    required this. paymentExpireDate,
    required this. voucherId,
    required this. paymentAvailable,
    required this. paymentUsed,
    required this. fullDateRedeem,
    required this. fullDatePayment,
    required this. token,

  });
}
