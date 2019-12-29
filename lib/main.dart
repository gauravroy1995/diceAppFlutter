import 'package:flutter/material.dart';
import 'dart:math' show Random;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DiceState(),
      ),
    ),
  );
}

class DiceState extends StatefulWidget {
  @override
  DicePage createState() => DicePage();
}

class DicePage extends State<DiceState> {
  var leftNumber = 1;
  var rightNumber = 2;
  void randomCreator(type) {
    var randomizer = new Random();
    var num = randomizer.nextInt(6) + 1;
    if (type == 'left') {
      setState(() {
        leftNumber = num;
      });
    } else {
      setState(() {
        rightNumber = num;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                randomCreator('left');
              },
              child: Image(
                image: AssetImage('images/dice$leftNumber.png'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                print('did this');
                randomCreator('right');
              },
              child: Image(
                image: AssetImage('images/dice$rightNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
