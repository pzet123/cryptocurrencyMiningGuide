import 'package:cryptocurrency_mining_guides/Cryptocurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class guideScreen extends StatefulWidget{
  @override
  _guideScreen createState() => _guideScreen();

}

class _guideScreen extends State<guideScreen>{

  List<Widget> createCryptocurrencyGuideList(Cryptocurrency cryptocurrency){
    List<Widget> steps = [];
      for(List<String> step in cryptocurrency.steps){
        steps.add(RaisedButton(
          onPressed: (){
            Navigator.pushNamed(context, "/stepsScreen", arguments: step[1]);
          },
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(step[0]),
        ));
        steps.add(SizedBox(height: 10,));
      }
      return steps;
  }

  @override
  Widget build(BuildContext context) {
    Cryptocurrency cryptocurrency = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(cryptocurrency.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Image.asset(
                      cryptocurrency.imagePath,
                      height: 150,
                      width: 150,),
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
                      RaisedButton.icon(onPressed: (){
                        setState(() {
                          cryptocurrency.updateInfo();
                        });
                      },
                        label: Text("Refresh"),
                        icon: Icon(Icons.refresh),
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(height: 15, thickness: 3,),
            Expanded(
              flex: 3,
              child: ListView(
                children: createCryptocurrencyGuideList(cryptocurrency)
              ),
            )
          ],
        ),
      )

    );
  }





}