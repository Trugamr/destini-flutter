import 'package:destini/scenario.dart';

import 'scenario.dart';

class Story {
  int _currentScenario = 0;
  bool _finished = false;

  List<Scenario> _scenarios = [
    Scenario(
        scenarioTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        firstChoice: 'I\'ll hop in. Thanks for the help!',
        secondChoice: 'Better ask him if he\'s a murderer first.'),
    Scenario(
        scenarioTitle: 'He nods slowly, unphased by the question.',
        firstChoice: 'At least he\'s honest. I\'ll climb in.',
        secondChoice: 'Wait, I know how to change a tire.'),
    Scenario(
        scenarioTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        firstChoice: 'I love Elton John! Hand him the cassette tape.',
        secondChoice: 'It\'s him or me! You take the knife and stab him.'),
    Scenario(
        scenarioTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        firstChoice: 'Restart',
        secondChoice: ''),
    Scenario(
        scenarioTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        firstChoice: 'Restart',
        secondChoice: ''),
    Scenario(
        scenarioTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        firstChoice: 'Restart',
        secondChoice: '')
  ];

  String getScenario() {
    return _scenarios[this._currentScenario].scenarioTitle;
  }

  String getFirstChoice() {
    return _scenarios[this._currentScenario].firstChoice;
  }

  String getSecondChoice() {
    return _scenarios[this._currentScenario].secondChoice;
  }

  void nextScenario(int choice) {
    switch (this._currentScenario) {
      case 0:
        this._currentScenario = choice == 1 ? 2 : 1;
        break;
      case 1:
        this._currentScenario = choice == 1 ? 2 : 3;
        break;
      case 2:
        this._currentScenario = choice == 1 ? 5 : 4;
        break;
      case 3:
        this._finished = true;
        break;
      case 4:
        this._finished = true;
        break;
      case 5:
        this._finished = true;
        break;
    }
  }

  bool isFinished() {
    return _finished;
  }

  void restart() {
    this._currentScenario = 0;
    this._finished = false;
  }

  bool buttonShouldBeVisible() {
    return ![3, 4, 5].contains(_currentScenario);
  }
}
