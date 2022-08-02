import 'package:flutter/material.dart';
import 'package:tic_tac/game_logic.dart';
import 'game_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String activePlayer = 'X';
  bool gameOver = false;
  int trun = 0; //num of try
  String result = ''; //
  Game game = Game();
  bool isSwiched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: const Text(
                'Trun on/off two player',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              value: isSwiched,
              onChanged: (bool newvalue) {
                setState(() {
                  isSwiched = newvalue;
                });
              },
            ),
            Text(
              'it\'s $activePlayer turn'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(15),
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                crossAxisCount: 3,
                children: List.generate(
                  9,
                  (index) => InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: gameOver ? null : () => _onTab(index),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Theme.of(context).shadowColor),
                      child: Center(
                        child: Text(
                          Player.PlayerX.contains(index)
                              ? 'X'
                              : Player.PlayerO.contains(index)
                                  ? 'O'
                                  : '',
                          style: TextStyle(
                            color: Player.PlayerX.contains(index)
                                ? Colors.blue
                                : Colors.red,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              result,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 45,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  Player.PlayerX = [];
                  Player.PlayerO = [];
                  activePlayer = 'X';
                  gameOver = false;
                  trun = 0; //num of try
                  result = '';
                });
              },
              icon: const Icon(Icons.replay),
              label: const Text(
                'replay the game',
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTab(int index) async {
    if ((Player.PlayerX.isEmpty || !Player.PlayerX.contains(index)) &&
            Player.PlayerO.isEmpty ||
        !Player.PlayerO.contains(index)) {
      game.PlayGame(index, activePlayer);
      updatStaute();
      if (!isSwiched && !gameOver && trun != 9) {
        await game.autoplay(activePlayer);
        updatStaute();
      }
    }
  }

  void updatStaute() {
    return setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      trun++;
      String WinnerPlayer = game.checkWiner();
      if (WinnerPlayer != '') {
        gameOver = true;
        result = '$WinnerPlayer is the winner';
      } else if (!gameOver && trun == 9) {
        result = 'it\'s draw';
      }
    });
  }
}
