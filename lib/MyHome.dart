import 'package:flutter/material.dart';
import 'dart:math';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var randomNumber;
  var gameText = "";

  int generateRandom() {
    setState(() {
      randomNumber = Random().nextInt(30);
    });
    return randomNumber;
  }

  // Step:-1 => import Images from folder
  AssetImage doller = new AssetImage("images/doller.png");
  AssetImage circle = new AssetImage("images/circle.png");
  AssetImage sad = new AssetImage("images/sad.png");

// Step :-2 => get an empty array from storing game state

  List<String> gameArray;

// Step :- 3 => need to initialise those with 30  elements
  void initState() {
    super.initState();
    setState(() {
      gameArray = List<String>.generate(30, (index) => "empty");
      generateRandom();
    });
  }

  AssetImage gettingImage(index) {
    String state = gameArray[index];
    if (state == "empty") {
      return circle;
    } else if (state == "sad") {
      return sad;
    } else {
      return doller;
    }
  }

  playGame(index) {
    if (randomNumber == index) {
      setState(() {
        gameArray[index] = "doller";
        gameText = "You Win The Game";
      });
    } else {
      setState(() {
        gameArray[index] = "sad";
      });
    }
    gettingImage(index);
  }

  resetGame() {
    setState(() {
      gameArray = List<String>.filled(30, "empty");
      generateRandom();
      gameText = "";
    });
  }

  showAll() {
    setState(() {
      gameArray = List<String>.filled(30, "sad");
      gameArray[randomNumber] = "doller";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch To Win Money"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: gameArray.length,
              itemBuilder: (context, i) => SizedBox(
                height: 50.0,
                width: 50.0,
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.gettingImage(i),
                  ),
                ),
              ),
            ),
          ),
          Container(
              child: Text(gameText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white))),
          Container(
            margin: EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: () {
                this.showAll();
              },
              child: Text("Revil Game", style: TextStyle(fontSize: 15.0)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: () {
                this.resetGame();
              },
              child: Text("Reset", style: TextStyle(fontSize: 15.0)),
            ),
          ),
          Container(
              child: Text("SteveBrains",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.red)))
        ],
      ),
    );
  }
}
