import 'package:cryptocurrency_mining_guides/CryptocurrencyScreen.dart';
import 'package:cryptocurrency_mining_guides/StepScreen.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency_mining_guides/Cryptocurrency.dart';
import 'InstructionScreen.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/" : (context) => homeScreen(),
    "/CryptocurrencyScreen" : (context) => CryptocurrencyScreen(),
    "/StepScreen": (context) => StepScreen(),
    "/InstructionScreen" : (context) => InstructionScreen(),
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
        title: Text("Mining guides"),
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Container(
        color: Colors.blueGrey[600],
        child: ListView(
          children: getCryptocurrencyCards(context),
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
      )
    );
  }
}

List<Cryptocurrency> getCryptocurrencies(){
  List<Cryptocurrency> cryptocurrencies = [
    Cryptocurrency("Bitcoin", "assets/bitcoinLogo.png", "assets/jsonGuides/bitcoinGuide.json"),
    Cryptocurrency("Ethereum", "assets/ethereumLogo.png","assets/jsonGuides/ethereumGuide.json"),
    Cryptocurrency("Monero", "assets/moneroLogo.png", "assets/jsonGuides/moneroGuide.json"),
    Cryptocurrency("DogeCoin", "assets/dogecoinLogo.png", "assets/jsonGuides/dogecoinGuide.json"),
    Cryptocurrency("Chainlink", "assets/chainlinkLogo.png", "assets/jsonGuides/chainlinkGuide.json"),
    Cryptocurrency("Cardano", "assets/cardanoLogo.png", "assets/jsonGuides/cardanoGuide.json"),
    Cryptocurrency("Litecoin", "assets/litecoinLogo.png", "assets/jsonGuides/litecoinGuide.json"),
    Cryptocurrency("Uniswap", "assets/uniswapLogo.png", "assets/jsonGuides/uniswapGuide.json"),
    Cryptocurrency("Dash", "assets/dashLogo.png", "assets/jsonGuides/dashGuide.json"),
    Cryptocurrency("Zcash", "assets/zcashLogo.png", "assets/jsonGuides/zcashGuide.json")
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
        color: Colors.blueGrey[100],
        child: Column(
          children: [
            Image.asset(
              cryptocurrency.imagePath,
              height: 100,
              width: 100,
            ),
            Text(cryptocurrency.name),
            RaisedButton.icon(onPressed: () {
              Navigator.pushNamed(context, "/CryptocurrencyScreen", arguments: cryptocurrency,);
            },
                color: Colors.blueGrey[400],
                icon: Icon(Icons.book_rounded,
                  color: Colors.blueGrey[100],),
                label: Text("Mining guide",
                style: TextStyle(
                  color: Colors.blueGrey[100],
                )))

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
