import 'package:flutter/material.dart';


class stepScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    String stepsString = ModalRoute.of(context).settings.arguments;
    List<String> steps = stepsString.split(",");

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: createStepsWidgets(steps),
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
