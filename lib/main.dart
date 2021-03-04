import 'package:cryptocurrency_mining_guides/guideScreen.dart';
import 'package:cryptocurrency_mining_guides/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency_mining_guides/Cryptocurrency.dart';
import 'stepScreen.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/" : (context) => homeScreen(),
    "/guideScreen" : (context) => guideScreen(),
    "/stepsScreen": (context) => stepScreen(),
    "/loadingScreen" : (context) => loadingScreen(),
  }
));

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto mining guides"),
      ),
      body: ListView(
        children: getCryptocurrencyCards(context),
        padding: EdgeInsets.symmetric(horizontal: 10),
      )
    );
  }
}

List<Cryptocurrency> getCryptocurrencies(){
  List<Cryptocurrency> cryptocurrencies = [
    Cryptocurrency("Bitcoin", "assets/bitcoinLogo.png", [["1. First step"
      ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],
      ["1. Second step"
        ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],["1. Third step"
        ,"get this,get that,get that,get that,"
            "get that,get that,get that,get that,"
            "get that,get that"]]),
    Cryptocurrency("Ethereum", "assets/ethereumLogo.png", [["1. First step"
    ,"get this,get that,get that,get that,"
    "get that,get that,get that,get that,"
    "get that,get that"],
    ["1. Second step"
    ,"get this,get that,get that,get that,"
    "get that,get that,get that,get that,"
    "get that,get that"],["1. Third step"
    ,"get this,get that,get that,get that,"
        "get that,get that,get that,get that,"
        "get that,get that"]]),
    Cryptocurrency("Monero", "assets/moneroLogo.png", [["1. First step"
    ,"get this,get that,get that,get that,"
    "get that,get that,get that,get that,"
    "get that,get that"],
    ["1. Second step"
    ,"get this,get that,get that,get that,"
    "get that,get that,get that,get that,"
    "get that,get that"],["1. Third step"
    ,"get this,get that,get that,get that,"
        "get that,get that,get that,get that,"
        "get that,get that"]]),
    Cryptocurrency("DogeCoin", "assets/dogecoinLogo.png", [["1. First step"
      ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],
      ["1. Second step"
        ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],["1. Third step"
        ,"get this,get that,get that,get that,"
            "get that,get that,get that,get that,"
            "get that,get that"]]),
    Cryptocurrency("Chainlink", "assets/chainlinkLogo.png", [["1. First step"
      ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],
      ["1. Second step"
        ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],["1. Third step"
        ,"get this,get that,get that,get that,"
            "get that,get that,get that,get that,"
            "get that,get that"]]),
    Cryptocurrency("Cardano", "assets/cardanoLogo.png", [["1. First step"
      ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],
      ["1. Second step"
        ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],["1. Third step"
        ,"get this,get that,get that,get that,"
            "get that,get that,get that,get that,"
            "get that,get that"]]),
    Cryptocurrency("Litecoin", "assets/litecoinLogo.png", [["1. First step"
      ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],
      ["1. Second step"
        ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],["1. Third step"
        ,"get this,get that,get that,get that,"
            "get that,get that,get that,get that,"
            "get that,get that"]]),
    Cryptocurrency("Uniswap", "assets/uniswapLogo.png", [["1. First step"
      ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],
      ["1. Second step"
        ,"get this,get that,get that,get that,"
          "get that,get that,get that,get that,"
          "get that,get that"],["1. Third step"
        ,"get this,get that,get that,get that,"
            "get that,get that,get that,get that,"
            "get that,get that"]])
  ];
  return cryptocurrencies;
}

List<Widget> getCryptocurrencyCards(BuildContext context){
  List<Widget> cryptocurrencyCardRows = [];
  List<Widget> cryptocurrencyCards = [];
  List<Cryptocurrency> cryptocurrencies = getCryptocurrencies();
  for(Cryptocurrency cryptocurrency in cryptocurrencies){
    cryptocurrencyCards.add(
      Card(

        child: Column(
          children: [
            Image.asset(
              cryptocurrency.imagePath,
              height: 100,
              width: 100,
            ),
            Text(cryptocurrency.name),
            RaisedButton.icon(onPressed: () {
              Navigator.pushNamed(context, "/guideScreen", arguments: cryptocurrency,);
            },
                icon: Icon(Icons.book_rounded),
                label: Text("Mining guide"))

          ],
        )
      )
    );
  }

  for(int i = 0; i < cryptocurrencyCards.length; i+=2){
    cryptocurrencyCardRows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cryptocurrencyCards[i],
          SizedBox(width: 15),
          cryptocurrencyCards.length - i > 1 ? cryptocurrencyCards[i+1]:SizedBox(),
        ],
    ));
  }
  return cryptocurrencyCardRows;


}
