import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tabbar/contents/enums.dart';
import 'package:tabbar/contents/images.dart';
import 'package:tabbar/views/bottomsheet.dart';

class GameProvider with ChangeNotifier {
  List<bool> tapIndex = List.generate(9, (index) => false);
  List<String> activeImage = List.generate(9, (index) => "");
  late Players currentPlayer;
  int nooftaps = 0;
  int oscore = 0;
  int xscore = 0;

  void xtap() {
    currentPlayer = Players.x;
    log(currentPlayer.value);
  }

  clear() {
    nooftaps = 0;
    oscore = 0;
    xscore = 0;
    activeImage = List.generate(9, (index) => "");
    tapIndex = List.generate(9, (index) => false);
    notifyListeners();
  }

  void otap() {
    currentPlayer = Players.o;
  }

  void onPlay(int index, BuildContext context) {
    if (tapIndex[index]) return;

    tapIndex[index] = true;
    activeImage[index] = currentPlayer == Players.x ? xcell : ocell;
    log(currentPlayer.value);
    nooftaps++;
    checkWinner(context, currentPlayer);
    currentPlayer = currentPlayer == Players.x ? Players.o : Players.x;

    notifyListeners();
  }

  void checkWinner(BuildContext context, player) {
    const winningPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
      [0, 4, 8], [2, 4, 6] // diagonals
    ];

    for (var pattern in winningPatterns) {
      if (activeImage[pattern[0]] != "" && activeImage[pattern[0]] == activeImage[pattern[1]] && activeImage[pattern[0]] == activeImage[pattern[2]]) {
        Future.delayed(const Duration(milliseconds: 60), () {
          showWinnerBottomSheet(context, player);
        });

        return;
      }
    }
    if (nooftaps == 9) {
      Future.delayed(const Duration(milliseconds: 60), () {
        showDrawBottomSheet(context);
      });
    }
  }

  void showWinnerBottomSheet(BuildContext context, Players player) {
    String playername = player.value;
    if (playername == Players.o.value) {
      oscore++;
    } else {
      xscore++;
    }
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomSheetwidget(
            url: winner,
            title: "player $playername  Won",
            contant: "Congrats on being the undisputed champion of pressing buttons like a pro.",
            buttonname: "Restart",
          ),
        );
      },
    );
  }

  void showDrawBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomSheetwidget(
            url: tic,
            title: "It’s a Draw!",
            contant: "Congrats to both of you for equally excelling in the art of not winning.",
            buttonname: "RePlay",
          ),
        );
      },
    );
  }

  void reset() {
    tapIndex = List.generate(9, (index) => false);
    activeImage = List.generate(9, (index) => "");
    nooftaps = 0;
    notifyListeners();
  }
}
