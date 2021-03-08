import 'dart:convert';
import "dart:async" show Future;
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class Cryptocurrency{
  String name;
  String imagePath;
  String pricePlaceValue;
  String marketCapPlaceValue;
  String guidePath;
  //TODO: Convert this into a map which contains different guides depending on the OS with the OS being the key
  Map steps;
  double marketCap;
  double price;

  Cryptocurrency(String name, String imagePath, String guidePath){
    this.name = name;
    this.imagePath = imagePath;
    this.price = -1;
    this.marketCap = -1;
    this.pricePlaceValue = "";
    this.marketCapPlaceValue = "";
    this.guidePath = guidePath;
    updateInfo();
    loadSteps();
  }


  void updateInfo() async {
    Response response = await get("https://api.coingecko.com/api/v3/simple/price?ids=" + name + "&vs_currencies=usd&include_market_cap=true");
    Map data = jsonDecode(response.body);
    marketCap = data[name.toLowerCase()]["usd_market_cap"].toDouble();
    price = data[name.toLowerCase()]["usd"].toDouble();
    adjustPlaceValues();
  }

  void loadSteps() async{
     String guideString = await rootBundle.loadString(guidePath);
     Map guideMap = jsonDecode(guideString);
     steps = guideMap;

  }

  void adjustPlaceValues(){
    int million = 1000000;
    int billion = 1000000000;
    int trillion = 1000000000000;

    if(price > (million/10)) {
      pricePlaceValue = "million";
      price = (price ~/ (million/100) * (million/100)).toDouble();
      price /= million;
    }

    if(marketCap > (trillion/10)) {
      marketCapPlaceValue = "trillion";
      marketCap = (marketCap ~/ (trillion / 100) * (trillion / 100)).toDouble();
      marketCap /= trillion;
    } else if(marketCap > (billion/10)){
      marketCapPlaceValue = "billion";
      marketCap = (marketCap~/(billion/ 100) * (billion/ 100)).toDouble();
      marketCap /= billion;
    } else if(marketCap > (million/10)) {
      marketCapPlaceValue = "million";
      marketCap = (marketCap ~/ (million/100) * (million/100)).toDouble();
      marketCap /= million;
    }

  }



}