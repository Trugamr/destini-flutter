import 'package:flutter/material.dart';

void main() {
  runApp(DestiniApp());
}

class DestiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: GamePage(),
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Destini'),
    );
  }
}
