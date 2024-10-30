import 'package:flutter/material.dart';

void main() {
  runApp(const BasketBallApp());
}

class BasketBallApp extends StatefulWidget {
  const BasketBallApp({Key? key}) : super(key: key);

  @override
  State<BasketBallApp> createState() => _BasketBallAppState();
}

class _BasketBallAppState extends State<BasketBallApp> {
  int _teamAScore = 0;
  int _teamBScore = 0;

  void _addPointsToTeamA(int points) {
    setState(() {
      _teamAScore += points;
    });
  }

  void _addPointsToTeamB(int points) {
    setState(() {
      _teamBScore += points;
    });
  }

  void _resetScores() {
    setState(() {
      _teamAScore = 0;
      _teamBScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Point Counter',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTeamColumn('Team A', _teamAScore, _addPointsToTeamA),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 5,
                  indent: 50,
                  endIndent: 50,
                ),
                _buildTeamColumn('Team B', _teamBScore, _addPointsToTeamB),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: _resetScores,
              child: const Text(
                'Reset',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamColumn(String teamName, int score, Function(int) addPoints) {
    return Container(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            teamName,
            style: const TextStyle(fontSize: 32),
          ),
          Text(
            '$score',
            style: const TextStyle(fontSize: 180),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            onPressed: () => addPoints(1),
            child: const Text(
              ' Add 1 Point',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            onPressed: () => addPoints(2),
            child: const Text(
              ' Add 2 Points',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            onPressed: () => addPoints(3),
            child: const Text(
              ' Add 3 Points',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
