import 'package:flutter/material.dart';


class InstructionScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    List<String> steps =  ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Container(
        color: Colors.blueGrey[600],
        child: ListView(
          children: createStepsWidgets(steps),
        ),
      )
    );
  }

  List<Widget> createStepsWidgets(List<String> steps){
    List<Widget> stepsWidgets = [];
    int count = 1;
    for(String step in steps){
      stepsWidgets.add(
          Row(
            children:[
              Expanded(
                flex: 1,
                child: Text(count.toString() + ".",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
              ),
              Expanded(
              flex: 9,
                child: Text(step,
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              ),
              ]
          ),
      );
      count++;
      stepsWidgets.add(
          SizedBox(height: 10,)
      );
    }
    return stepsWidgets;
  }
}
