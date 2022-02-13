import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* Player 0 == X
  //* Player 1 == O
  int player = 0;
  int? winner;

  Map<int, String?> toe = {
    1: null,
    2: null,
    3: null,
    4: null,
    5: null,
    6: null,
    7: null,
    8: null,
    9: null,
  };

  //* Criando a logica do jogo

  //? Função que armazena os movimentos
  void move(int n) {
    setState(() {
      if (toe[n] == null) {
        if (player == 0) {
          toe[n] = 'X';
          player = 1;
        } else {
          toe[n] = "O";
          player = 0;
        }
      }

      //? Função que verifica se quem venceu o jogo
      verify();

      //? Mostra o Vencedor do jogo
      if (winner != null) {
        endGame();
      }
    });
  }

  //? verifica quem ganhou o jogo
  void verify() {
    //*Verificando Linha 1
    if (toe[1] != null && toe[2] != null && toe[3] != null) {
      if (toe[1] == 'X' && toe[2] == 'X' && toe[3] == 'X') {
        winner = 0;
      } else if (toe[1] != 'X' && toe[2] != 'X' && toe[3] != 'X') {
        winner = 1;
      }
    }

    //* Verificando Linha 2
    if (toe[4] != null && toe[5] != null && toe[6] != null) {
      if (toe[4] == 'X' && toe[5] == 'X' && toe[6] == 'X') {
        winner = 0;
      } else if (toe[4] != 'X' && toe[5] != 'X' && toe[6] != 'X') {
        winner = 1;
      }
    }

    //* Verificando Linha 3
    if (toe[7] != null && toe[8] != null && toe[9] != null) {
      if (toe[7] == 'X' && toe[8] == 'X' && toe[9] == 'X') {
        winner = 0;
      } else if (toe[7] != 'X' && toe[8] != 'X' && toe[9] != 'X') {
        winner = 1;
      }
    }

    //* Verificando coluna 1
    if (toe[1] != null && toe[4] != null && toe[7] != null) {
      if (toe[1] == 'X' && toe[4] == 'X' && toe[7] == 'X') {
        winner = 0;
      } else if (toe[1] != 'X' && toe[4] != 'X' && toe[7] != 'X') {
        winner = 1;
      }
    }

    //* Verificando coluna 2
    if (toe[2] != null && toe[5] != null && toe[8] != null) {
      if (toe[2] == 'X' && toe[5] == 'X' && toe[8] == 'X') {
        winner = 0;
      } else if (toe[2] != 'X' && toe[5] != 'X' && toe[8] != 'X') {
        winner = 1;
      }
    }

    //* Verificando coluna 3
    if (toe[3] != null && toe[6] != null && toe[9] != null) {
      if (toe[3] == 'X' && toe[6] == 'X' && toe[9] == 'X') {
        winner = 0;
      } else if (toe[3] != 'X' && toe[6] != 'X' && toe[9] != 'X') {
        winner = 1;
      }
    }

    //*Verificando diagonal 1
    if (toe[1] != null && toe[5] != null && toe[9] != null) {
      if (toe[1] == 'X' && toe[5] == 'X' && toe[9] == 'X') {
        winner = 0;
      } else if (toe[1] != 'X' && toe[5] != 'X' && toe[9] != 'X') {
        winner = 1;
      }
    }

    //*Verificando diagonal 2
    if (toe[3] != null && toe[5] != null && toe[7] != null) {
      if (toe[3] == 'X' && toe[5] == 'X' && toe[7] == 'X') {
        winner = 0;
      } else if (toe[3] != 'X' && toe[5] != 'X' && toe[7] != 'X') {
        winner = 1;
      }
    }

    //* Verificando empate
    if (toe[1] != null &&
        toe[2] != null &&
        toe[3] != null &&
        toe[4] != null &&
        toe[5] != null &&
        toe[6] != null &&
        toe[7] != null &&
        toe[8] != null &&
        toe[9] != null &&
        winner == null) {
      winner = 2;
    }
  }

  //? reinicia o jogo
  void restartGame() {
    setState(() {
      winner = null;
      player = 0;
      for (var i = 1; i <= toe.length; i++) {
        toe[i] = null;
      }
    });
  }

  //? mostra a mensagem de fim de jogo
  void endGame() {
    //*Criando AlertDialog
    showDialog(
        context: context,

        //? impede que apertando fora do Alert feche o alert
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              title: Text(
                winner != 2 ? 'Vitória' : 'Empate',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: winner != 2 ? Colors.yellow[800] : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              content: Text(
                winner != 2
                    ? winner == 0
                        ? 'X'
                        : 'O'
                    : '#',
                style: TextStyle(
                  fontSize: 110,
                  fontWeight: FontWeight.bold,
                  color: winner != 2
                      ? winner == 0
                          ? Colors.red[800]
                          : Colors.blue[800]
                      : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: winner != 2
                        ? winner == 0
                            ? Colors.red[700]
                            : Colors.blue[800]
                        : Colors.black,
                    fixedSize: const Size(200, 40),
                  ),
                  onPressed: () {
                    restartGame();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Tente Novamente',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 70, 136),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
            child: Text(
              'Tic Tac Toe',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Vez do Jogador:  ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  player == 0 ? 'X' : 'O',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: player == 0 ? Colors.red : Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          //* Linha 1
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //*Area 1
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: toe[1] != null
                          ? toe[1] == 'X'
                              ? Colors.red[800]
                              : Colors.blue[800]
                          : Colors.white,
                      fixedSize: const Size(80, 80),
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      move(1);
                    },
                    child: Text(
                      toe[1] == null ? '' : toe[1].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //*Area 2
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: toe[2] != null
                          ? toe[2] == 'X'
                              ? Colors.red[800]
                              : Colors.blue[800]
                          : Colors.white,
                      fixedSize: const Size(80, 80),
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      move(2);
                    },
                    child: Text(
                      toe[2] == null ? '' : toe[2].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //*Area 3
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: toe[3] != null
                          ? toe[3] == 'X'
                              ? Colors.red[800]
                              : Colors.blue[800]
                          : Colors.white,
                      fixedSize: const Size(80, 80),
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      move(3);
                    },
                    child: Text(
                      toe[3] == null ? '' : toe[3].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //* Linha 2
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //*Area 4
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: toe[4] != null
                          ? toe[4] == 'X'
                              ? Colors.red[800]
                              : Colors.blue[800]
                          : Colors.white,
                      fixedSize: const Size(80, 80),
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      move(4);
                    },
                    child: Text(
                      toe[4] == null ? '' : toe[4].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //*Area 5
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: toe[5] != null
                          ? toe[5] == 'X'
                              ? Colors.red[800]
                              : Colors.blue[800]
                          : Colors.white,
                      fixedSize: const Size(80, 80),
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      move(5);
                    },
                    child: Text(
                      toe[5] == null ? '' : toe[5].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //*Area 6
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: toe[6] != null
                          ? toe[6] == 'X'
                              ? Colors.red[800]
                              : Colors.blue[800]
                          : Colors.white,
                      fixedSize: const Size(80, 80),
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      move(6);
                    },
                    child: Text(
                      toe[6] == null ? '' : toe[6].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //* Linha 2
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //*Area 4
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: toe[7] != null
                          ? toe[7] == 'X'
                              ? Colors.red[800]
                              : Colors.blue[800]
                          : Colors.white,
                      fixedSize: const Size(80, 80),
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      move(7);
                    },
                    child: Text(
                      toe[7] == null ? '' : toe[7].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //*Area 5
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: toe[8] != null
                          ? toe[8] == 'X'
                              ? Colors.red[800]
                              : Colors.blue[800]
                          : Colors.white,
                      fixedSize: const Size(80, 80),
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      move(8);
                    },
                    child: Text(
                      toe[8] == null ? '' : toe[8].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //*Area 6
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: toe[9] != null
                          ? toe[9] == 'X'
                              ? Colors.red[800]
                              : Colors.blue[800]
                          : Colors.white,
                      fixedSize: const Size(80, 80),
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      move(9);
                    },
                    child: Text(
                      toe[9] == null ? '' : toe[9].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
