import 'package:flutter/material.dart';
import 'story.dart';

void main() {
  runApp(DestiniApp());
}

class DestiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow.shade50,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: GamePage(),
          ),
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Story story = Story();
  bool secondButtonVisible = true;

  void nextScenario(int choice) {
    // Progress to next scenario
    setState(() {
      story.nextScenario(choice);

      if (story.isFinished()) story.restart();

      // Check if second button shoudl be visible
      secondButtonVisible = story.buttonShouldBeVisible();
    });
  }

  RaisedButton buildKey(
      {String text, Color color, VoidCallback onPressed, Color textColor}) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: textColor,
        ),
      ),
      onPressed: onPressed,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 12,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.getScenario(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(
              top: 16.0,
              bottom: 6.0,
              left: 16.0,
              right: 16.0,
            ),
            child: buildKey(
              text: story.getFirstChoice(),
              color: Colors.yellow,
              onPressed: () => nextScenario(1),
              textColor: Colors.black,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Visibility(
            visible: secondButtonVisible,
            child: Container(
              padding: EdgeInsets.only(
                top: 6.0,
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: buildKey(
                  text: story.getSecondChoice(),
                  color: Colors.pink.shade400,
                  onPressed: () => nextScenario(2),
                  textColor: Colors.white),
            ),
          ),
        ),
      ],
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
