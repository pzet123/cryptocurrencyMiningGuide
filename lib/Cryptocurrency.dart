import 'dart:convert';

import 'package:http/http.dart';

class Cryptocurrency{
  String name;
  String imagePath;
  String pricePlaceValue;
  String marketCapPlaceValue;
  List<List<String>> steps;
  double marketCap;
  double price;

  Cryptocurrency(String name, String imagePath, List<List<String>> steps){
    this.name = name;
    this.imagePath = imagePath;
    this.steps = steps;
    this.price = -1;
    this.marketCap = -1;
    this.pricePlaceValue = "";
    this.marketCapPlaceValue = "";
    updateInfo();
  }


  void updateInfo() async {
    Response response = await get("https://api.coingecko.com/api/v3/simple/price?ids=" + name + "&vs_currencies=usd&include_market_cap=true");
    Map data = jsonDecode(response.body);
    marketCap = data[name.toLowerCase()]["usd_market_cap"].toDouble();
    price = data[name.toLowerCase()]["usd"].toDouble();
    adjustPlaceValues();
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