import 'package:flutter/material.dart';
import 'package:cryptocurrency_mining_guides/Cryptocurrency.dart';

class StepScreen extends StatelessWidget {

  List<Widget> createCryptocurrencyGuideList(Cryptocurrency cryptocurrency, String platform, BuildContext context){
    List<Widget> stepsWidgets = [];
    for(String step in cryptocurrency.steps[platform]){
      List<String> instructions = step.split(",,");
      stepsWidgets.add(RaisedButton(
        onPressed: (){
          Navigator.pushNamed(context, "/InstructionScreen", arguments: instructions.sublist(1));
        },
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(instructions[0]),
        color: Colors.blueGrey[300],
      ));
      stepsWidgets.add(SizedBox(height: 10,));
    }
    return stepsWidgets;
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    Cryptocurrency cryptocurrency = data["crypto"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],

      ),
      body: Container(
        color: Colors.blueGrey[600],
        child: ListView(
          children: createCryptocurrencyGuideList(cryptocurrency, data["platform"], context),
        ),
      )
    );
  }
}
