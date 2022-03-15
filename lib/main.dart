import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('CACHO')),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> dados = [];

  int d1 = 1;
  int d2 = 1;
  int d3 = 1;
  int d4 = 1;
  int d5 = 1;

  String R = 'COMENZEMOS';

  bool sd1 = false;
  bool sd2 = false;
  bool sd3 = false;
  bool sd4 = false;
  bool sd5 = false;
  bool sb1 = false;
  bool sb2 = false;

  late Timer timer;
  int _cont = 5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Henry Quispe Huayta',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '$_cont',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: sd1 ? null : dado1,
                child: Image.asset(
                  'assets/imgs/$d1.png',
                  height: 120.0,
                ),
              ),
              InkWell(
                onTap: sd2 ? null : dado2,
                // onTap: () {
                //   setState(() {
                //     d2 = 7 - d2;
                //     dados[2] = d2;
                //     calcular();
                //   });
                // },
                child: Image.asset(
                  'assets/imgs/$d2.png',
                  height: 120.0,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: sd3 ? null : dado3,
            // onTap: () {
            //   setState(() {
            //     d3 = 7 - d3;
            //     dados[3] = d3;
            //     calcular();
            //   });
            // },
            child: Image.asset(
              'assets/imgs/$d3.png',
              height: 120.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: sd4 ? null : dado4,
                // onTap: () {
                //   setState(() {
                //     d4 = 7 - d4;
                //     dados[4] = d4;
                //     calcular();
                //   });
                // },
                child: Image.asset(
                  'assets/imgs/$d4.png',
                  height: 120.0,
                ),
              ),
              InkWell(
                onTap: sd5 ? null : dado5,
                // onTap: () {
                //   setState(() {
                //     d5 = 7 - d5;
                //     dados[5] = d5;
                //     calcular();
                //   });
                // },
                child: Image.asset(
                  'assets/imgs/$d5.png',
                  height: 120.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            R,
            style: TextStyle(fontSize: 30),
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: sb1 ? null : lanzar, child: Text('Iniciar')),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: sb2 ? null : reinciar, child: Text('Reiniciar')),
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  reinciar() {
    setState(() {
      sd1 = false;
      sd2 = false;
      sd3 = false;
      sd4 = false;
      sd5 = false;

      d1 = 1;
      d2 = 1;
      d3 = 1;
      d4 = 1;
      d5 = 1;
      sb1 = false;
      sb2 = true;
      R = 'COMENZEMOS';
      _cont = 5;
    });
  }

  lanzar() {
    setState(() {
      d1 = Random().nextInt(6) + 1;
      d2 = Random().nextInt(6) + 1;
      d3 = Random().nextInt(6) + 1;
      d4 = Random().nextInt(6) + 1;
      d5 = Random().nextInt(6) + 1;

      dados = [0, d1, d2, d3, d4, d5];

      sb1 = true;
      sb2 = false;

      sd1 = false;
      sd2 = false;
      sd3 = false;
      sd4 = false;
      sd5 = false;

      timer.cancel();
      calcular();
      _contador();
    });
  }

  _contador() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_cont > 0 &&
            sd1 == false &&
            sd2 == false &&
            sd3 == false &&
            sd4 == false &&
            sd5 == false) {
          _cont--;
        } else {
          timer.cancel();
          sd1 = true;
          sd2 = true;
          sd3 = true;
          sd4 = true;
          sd5 = true;
        }
      });
    });
  }

  calcular() {
    setState(() {
      int m = 0;
      int n = 0;
      int l = 0;
      for (int i = 1; i < dados.length; i++) {
        int k = 0;
        for (int j = 0; j < dados.length; j++) {
          if (dados[i] == dados[j]) {
            k++;
          }
        }
        if (k > l) {
          l = k;
          m = dados[i];
        }
      }
      if (l == 2) {
        R = 'SIGA PARTICIPANDO';
      }
      if (l == 5) {
        R = 'GRANDE';
      }
      if (l == 4) {
        R = 'POKER';
      }
      if (l == 3) {
        for (int i = 1; i < dados.length; i++) {
          int k = 0;
          for (int j = 1; j < dados.length; j++) {
            if (dados[i] == dados[j] && dados[i] != m) {
              k++;
            }
          }
          if (k > n) {
            n = k;
          }
        }
        if (n == 2) {
          R = 'FULL';
        } else {
          R = 'SIGA PARTICIPANDO';
        }
      }
      if (l == 1) {
        bool ct = true;
        for (int i = 1; i < dados.length - 1; i++) {
          if (dados[i] == dados[i + 1]) {
            ct = false;
          }
        }
        if (ct) {
          R = 'ESCALERA';
        }
      }
    });
  }

  dado1() {
    setState(() {
      d1 = 7 - d1;
      dados[1] = d1;
      calcular();
    });
  }

  dado2() {
    setState(() {
      d2 = 7 - d2;
      dados[2] = d2;
      calcular();
    });
  }

  dado3() {
    setState(() {
      d3 = 7 - d3;
      dados[3] = d3;
      calcular();
    });
  }

  dado4() {
    setState(() {
      d5 = 7 - d4;
      dados[4] = d4;
      calcular();
    });
  }

  dado5() {
    setState(() {
      d5 = 7 - d5;
      dados[5] = d5;
      calcular();
    });
  }
}
