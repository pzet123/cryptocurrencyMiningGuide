import 'dart:convert';

import 'package:http/http.dart';

class Cryptocurrency{
  String name;
  String imagePath;
  List<List<String>> steps;
  double marketCap;
  double price;

  Cryptocurrency(String name, String imagePath, List<List<String>> steps){
    this.name = name;
    this.imagePath = imagePath;
    this.steps = steps;
    updateInfo();
  }


  void updateInfo() async {
    //TODO: FINISH UPDATE PRICE METHOD IN CRYPTOCURRENCY CLASS
    Response response = await get("https://api.coingecko.com/api/v3/simple/price?ids=" + name + "&vs_currencies=usd&include_market_cap=true");
    Map data = jsonDecode(response.body);
    marketCap = data[name.toLowerCase()]["usd_market_cap"].toDouble();
    price = data[name.toLowerCase()]["usd"].toDouble();
  }



}