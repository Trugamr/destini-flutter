import 'package:flutter/material.dart';

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
                'This is where the main story text will go depending on which the user will be able to follow a path.',
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
              text: 'First choice to follow',
              color: Colors.yellow,
              onPressed: () => print('first option'),
              textColor: Colors.black,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(
              top: 6.0,
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: buildKey(
                text: 'Second choice to follow',
                color: Colors.pink.shade400,
                onPressed: () => print('second option'),
                textColor: Colors.white),
          ),
        ),
      ],
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
