import 'dart:math';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';

  static var PlayerX = [];
  static var PlayerO = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  void PlayGame(
    int index,
    String activePlayer,
  ) {
    if (activePlayer == 'X') {
      Player.PlayerX.add(index);
    } else {
      Player.PlayerO.add(index);
    }
  }

  checkWiner() {
    String winner = '';

    if (Player.PlayerX.containsAll(0, 1, 2) ||
        Player.PlayerX.containsAll(3, 4, 5) ||
        Player.PlayerX.containsAll(6, 7, 8) ||
        Player.PlayerX.containsAll(0, 3, 6) ||
        Player.PlayerX.containsAll(1, 4, 7) ||
        Player.PlayerX.containsAll(0, 4, 8) ||
        (Player.PlayerX.containsAll(2, 4, 6)))
      winner = 'X';
    else if (Player.PlayerO.containsAll(0, 1, 2) ||
        Player.PlayerO.containsAll(3, 4, 5) ||
        Player.PlayerO.containsAll(6, 7, 8) ||
        Player.PlayerO.containsAll(0, 3, 6) ||
        Player.PlayerO.containsAll(1, 4, 7) ||
        Player.PlayerO.containsAll(0, 4, 8) ||
        (Player.PlayerO.containsAll(2, 4, 6)))
      winner = 'O';
    else {
      winner = '';
    }

    return winner;
  }

  Future<void> autoplay(activePlayer) async {
    int index = 0;
    List<int> emptycell = [];
    for (var i = 0; i < 9; i++) {
      if (!(Player.PlayerX.contains(i) || Player.PlayerO.contains(i))) {
        emptycell.add(i);
      }
    }

    if (Player.PlayerX.containsAll(0, 1) || emptycell.contains(2)) {
      index = 2;
    } else if (Player.PlayerO.containsAll(3, 4) && emptycell.contains(5)) {
      index = 5;
    } else if (Player.PlayerO.containsAll(6, 7) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerO.containsAll(0, 3) && emptycell.contains(8)) {
      index = 6;
    } else if (Player.PlayerO.containsAll(1, 4) && emptycell.contains(7)) {
      index = 7;
    } else if (Player.PlayerO.containsAll(0, 4) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerO.containsAll(2, 4) && emptycell.contains(6)) {
      index = 6;
    }
    ////////
    if (Player.PlayerO.containsAll(0, 2) || emptycell.contains(1)) {
      index = 1;
    } else if (Player.PlayerO.containsAll(3, 5) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerO.containsAll(6, 8) && emptycell.contains(7)) {
      index = 7;
    } else if (Player.PlayerO.containsAll(0, 6) && emptycell.contains(3)) {
      index = 3;
    } else if (Player.PlayerO.containsAll(1, 7) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerO.containsAll(2, 8) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerO.containsAll(2, 5) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerO.containsAll(2, 6) && emptycell.contains(4)) {
      index = 4;
    }
    /////////
    if (Player.PlayerO.containsAll(1, 2) || emptycell.contains(0)) {
      index = 0;
    } else if (Player.PlayerO.containsAll(4, 5) && emptycell.contains(3)) {
      index = 3;
    } else if (Player.PlayerO.containsAll(7, 8) && emptycell.contains(6)) {
      index = 6;
    } else if (Player.PlayerO.containsAll(3, 6) && emptycell.contains(0)) {
      index = 0;
    } else if (Player.PlayerO.containsAll(4, 7) && emptycell.contains(1)) {
      index = 1;
    } else if (Player.PlayerO.containsAll(5, 8) && emptycell.contains(2)) {
      index = 2;
    } else if (Player.PlayerO.containsAll(4, 8) && emptycell.contains(0)) {
      index = 0;
    } else if (Player.PlayerO.containsAll(4, 6) && emptycell.contains(2)) {
      index = 2;
    }
    /////
    if (Player.PlayerX.containsAll(3, 4) || emptycell.contains(5)) {
      index = 5;
    } else if (Player.PlayerX.containsAll(6, 7) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerX.containsAll(0, 3) && emptycell.contains(6)) {
      index = 6;
    } else if (Player.PlayerX.containsAll(1, 4) && emptycell.contains(7)) {
      index = 7;
    } else if (Player.PlayerX.containsAll(4, 7) && emptycell.contains(1)) {
      index = 1;
    } else if (Player.PlayerX.containsAll(2, 5) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerX.containsAll(0, 4) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerX.containsAll(2, 4) && emptycell.contains(8)) {
      index = 8;
    }
    if (Player.PlayerX.containsAll(0, 2) || emptycell.contains(1)) {
      index = 1;
    } else if (Player.PlayerX.containsAll(3, 5) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerX.containsAll(6, 8) && emptycell.contains(7)) {
      index = 7;
    } else if (Player.PlayerX.containsAll(0, 6) && emptycell.contains(3)) {
      index = 3;
    } else if (Player.PlayerX.containsAll(1, 7) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerX.containsAll(2, 8) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerX.containsAll(2, 5) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerX.containsAll(2, 6) && emptycell.contains(4)) {
      index = 4;
    }
    ////
    ///
    /// if (Player.PlayerO.containsAll(0, 2) || emptycell.contains(1)) {

    // else if ((Player.PlayerX.containsAll(0, 1) && emptycell.contains(2)))
    //   index = 2;
    // else if ((Player.PlayerX.containsAll(0, 1) && emptycell.contains(2)))

    Random random = Random();
    int randomIndex = random.nextInt(emptycell.length);
    index = emptycell[randomIndex];
    PlayGame(index, activePlayer);
  }
}
