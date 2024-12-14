import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> displayOX = ['', '', '', '', '', '', '', '', ''];
  bool oPlayer = true;
  String result = '';
  int oPlayerWins = 0;
  int xPlayerWins = 0;
  int filterBox = 0;
  bool winnerFound = false;
  static var customStyle = GoogleFonts.coiny(
      textStyle:
          const TextStyle(color: Colors.white, fontSize: 28, letterSpacing: 3));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Player O", style: customStyle),
                        Text(oPlayerWins.toString(), style: customStyle),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text("Player X", style: customStyle),
                        Text(xPlayerWins.toString(), style: customStyle),
                      ],
                    ),
                  ],
                )),
            Expanded(
                flex: 5,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // mainAxisSpacing: 8.0, // Space between rows
                    // crossAxisSpacing: 8.0, // Space between columns
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 5, color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          displayOX[index],
                          style: GoogleFonts.coiny(
                            textStyle: const TextStyle(
                                color: Colors.red, fontSize: 64),
                          ),
                        )),
                      ),
                    );
                  },
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(result, style: customStyle),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white),
                      child: InkWell(
                          onTap: () {_clearBoard();},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Play Again!",
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oPlayer && displayOX[index] == '') {
        displayOX[index] = 'O';
        filterBox++;
      } else if (!oPlayer && displayOX[index] == '') {
        displayOX[index] = 'X';
        filterBox++;
      }
      oPlayer = !oPlayer;

      _checkWinner();
    });
  }

  void _checkWinner() {
    //1st row
    if (displayOX[0] == displayOX[1] &&
        displayOX[0] == displayOX[2] &&
        displayOX[0] != '') {
      setState(() {
        result = "Player ${displayOX[0]} Wins";
        _updateWinner(displayOX[0]);
      });
    }

    //2nd row
    if (displayOX[3] == displayOX[4] &&
        displayOX[3] == displayOX[5] &&
        displayOX[3] != '') {
      setState(() {
        result = "Player ${displayOX[3]} Wins";
        _updateWinner(displayOX[3]);
      });
    }
    //3rd row
    if (displayOX[6] == displayOX[7] &&
        displayOX[6] == displayOX[8] &&
        displayOX[6] != '') {
      setState(() {
        result = "Player ${displayOX[6]} Wins";
        _updateWinner(displayOX[6]);
      });
    }
    //1st column
    if (displayOX[0] == displayOX[3] &&
        displayOX[0] == displayOX[6] &&
        displayOX[0] != '') {
      setState(() {
        result = "Player ${displayOX[0]} Wins";
        _updateWinner(displayOX[0]);
      });
    }
    //2nd column
    if (displayOX[1] == displayOX[4] &&
        displayOX[1] == displayOX[7] &&
        displayOX[1] != '') {
      setState(() {
        result = "Player ${displayOX[1]} Wins";
        _updateWinner(displayOX[1]);
      });
    }
    //3rd column

    if (displayOX[2] == displayOX[5] &&
        displayOX[2] == displayOX[8] &&
        displayOX[2] != '') {
      setState(() {
        result = "Player ${displayOX[2]} Wins";
        _updateWinner(displayOX[2]);
      });
    }
    //check left diagonal
    if (displayOX[0] == displayOX[4] &&
        displayOX[0] == displayOX[8] &&
        displayOX[0] != '') {
      setState(() {
        result = "Player ${displayOX[0]} Wins";
        _updateWinner(displayOX[0]);
      });
    }
    //check right diagonal
    if (displayOX[2] == displayOX[4] &&
        displayOX[2] == displayOX[6] &&
        displayOX[2] != '') {
      setState(() {
        result = "Player ${displayOX[2]} Wins";
        _updateWinner(displayOX[2]);
      });
    }
    if (!winnerFound && filterBox == 9) {
      setState(() {
        result = "NoBody Wins!";
      });
    }
  }

  void _updateWinner(String winner) {
    if (winner == 'O') {
      oPlayerWins++;
    } else if (winner == 'X') {
      xPlayerWins++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for(int i=0; i<9; i++){
        displayOX[i] = '';
      }
      result = '';
    });
    filterBox = 0;
  }
}
