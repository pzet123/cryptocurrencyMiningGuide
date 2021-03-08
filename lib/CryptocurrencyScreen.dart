import 'package:cryptocurrency_mining_guides/Cryptocurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CryptocurrencyScreen extends StatefulWidget{
  @override
  _CryptocurrencyScreen createState() => _CryptocurrencyScreen();

}

class _CryptocurrencyScreen extends State<CryptocurrencyScreen>{


  @override
  Widget build(BuildContext context) {
    Cryptocurrency cryptocurrency = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text(cryptocurrency.name),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey[600],
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                color: Colors.blueGrey[100],
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset(
                          cryptocurrency.imagePath,
                          height: 150,
                          width: 150,),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(cryptocurrency.name,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Kilometer"
                        )),
                        Text(("Price: \$" + cryptocurrency.price.toString() + " " + cryptocurrency.pricePlaceValue)),
                        Text("Market cap: \$" + (cryptocurrency.marketCap).toString() + " " + cryptocurrency.marketCapPlaceValue),
                        //TODO: ADD A LOADING SCREEN WHICH IS SHOWN WHEN PRICE IS BEING FETCHED
                        RaisedButton.icon(onPressed: (){
                          setState(() {
                            cryptocurrency.updateInfo();
                          });
                        },
                          label: Text("Refresh"),
                          icon: Icon(Icons.refresh),
                          color: Colors.blueGrey[300]
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(height: 15, thickness: 3, color: Colors.blueGrey[100],),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  RaisedButton(onPressed: () {
                    Navigator.pushNamed(context, "/StepScreen", arguments: {"crypto" : cryptocurrency, "platform" : "windows"});
                  },
                      color: Colors.blue[200],
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset("assets/windowsLogo.png",
                          width: 80,
                          height:  80,),
                          SizedBox(width: 20,),
                          Text("Windows",
                              style: TextStyle(
                              fontSize: 24
                          )),
                        ],
                  )),
                  SizedBox(height: 20),
                  RaisedButton(onPressed: () {
                    Navigator.pushNamed(context, "/StepScreen", arguments: {"crypto" : cryptocurrency, "platform" : "macos"});
                  },
                      color: Colors.grey[200],
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset("assets/macosLogo.png",
                            width: 80,
                            height:  80,),
                          SizedBox(width: 20,),
                          Text("MacOS",
                              style: TextStyle(
                              fontSize: 24
                          )),
                        ],
                      )),
                  SizedBox(height: 20),
                  RaisedButton(onPressed: () {
                    Navigator.pushNamed(context, "/StepScreen", arguments: {"crypto" : cryptocurrency, "platform" : "ubuntu"});
                  },
                      color: Colors.orange[200],
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset("assets/ubuntuLogo.png",
                            width: 80,
                            height:  80,),
                          SizedBox(width: 20,),
                          Text("Ubuntu",
                          style: TextStyle(
                            fontSize: 24
                          )),
                        ],
                      ))
                ]
              ),
            )
          ],
        ),
      )

    );
  }





}