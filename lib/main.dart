import 'dart:core';
import 'dart:math';

import 'package:banco_imobiliario/interfaces/icomprar_strategy.dart';
import 'package:banco_imobiliario/interfaces/iplayer.dart';
import 'package:banco_imobiliario/interfaces/itabuleiro.dart';
import 'package:banco_imobiliario/factorys/fabrica_player.dart';
import 'package:banco_imobiliario/factorys/fabrica_tabuleiro.dart';
import 'package:banco_imobiliario/strategies/comprar_strategy.dart';
import 'package:banco_imobiliario/widgets/widget_players.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple.shade900,
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Projeto PDS: Banco Imobiliario'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<IPlayer> players = FabricaPlayer.listaJogadores();
final tabuleiro = FabricaTabuleiro.camposTabuleiro();

class _MyHomePageState extends State<MyHomePage> {
  IComprarStrategy comprar = ComprarStrategy();
  Iterator<IPlayer> pi = players.iterator;
  Iterator<ITabuleiro> ti = tabuleiro.iterator;

  String pname = '';
  double pvalor = 0.0;
  String tname = '';
  double tvalor = 0.0;
  String tpath = '';
  int dice = 0;
  bool rollTime = true;
  bool buyTime = true;

  final p1 = players[0];
  final p2 = players[1];
  final p3 = players[2];
  final p4 = players[3];
  final List<ITabuleiro> lp1 = [];
  final List<ITabuleiro> lp2 = [];
  final List<ITabuleiro> lp3 = [];
  final List<ITabuleiro> lp4 = [];

  @override
  void initState() {
    ti.moveNext();
    super.initState();
  }

  void finish() {
    setState(() {
      if (pi.current == players.last) {
        pi = players.iterator;
      }
      pi.moveNext();
      pname = pi.current.nome;
      pvalor = pi.current.valor;
      tname = '';
      tpath = '';
      tvalor = 0.0;
      if (pvalor > 0.0) {
        rollTime = true;
      }
      buyTime = true;
      dice = 0;
    });
  }

  void rollDice() {
    setState(() {
      dice = Random().nextInt(12) + 1;
      rollTime = !rollTime;
      for (var i = 0; i < dice; i++) {
        ti.moveNext();
        tname = ti.current.nome;
        tvalor = ti.current.valor;
        tpath = ti.current.path;
        if (ti.current == tabuleiro.last) {
          ti = tabuleiro.iterator;
          ti.moveNext();
        }
      }
    });
  }

  void buyBuild() {
    double descontar = comprar.comprar(pi.current.valor, tvalor);
    setState(() {
      pi.current.valor = descontar;
      pvalor = pi.current.valor;
      buyTime = !buyTime;
      ti.current.vendido = true;
      switch (pname) {
        case 'Maria':
          lp1.add(ti.current);
          break;
        case 'Joao':
          lp2.add(ti.current);
          break;
        case 'Ana':
          lp3.add(ti.current);
          break;
        case 'Pedro':
          lp4.add(ti.current);
          break;
        default:
          return;
      }
    });
  }

  Widget rollButton(void Function() fn) {
    return ElevatedButton(
      onPressed: (rollTime && pi.current.valor > 0.0) ? fn : null,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'ROLL',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (pname == '') {
      pi.moveNext();
      pname = pi.current.nome;
      pvalor = pi.current.valor;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade600,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  WidgetPlayers(p: p1, c: Colors.red, lista: lp1),
                  WidgetPlayers(p: p2, c: Colors.blue, lista: lp2),
                  WidgetPlayers(p: p3, c: Colors.green, lista: lp3),
                  WidgetPlayers(p: p4, c: Colors.amber, lista: lp4),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            pname[0],
                            style: const TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$pname\'s Turn | R\$ ${pvalor.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Dices: $dice',
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          'Campo: $tname',
                          style: const TextStyle(fontSize: 22.0),
                        ),
                        Text(
                          'Valor(R\$): $tvalor',
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    showImage(tpath),
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rollButton(rollDice),
                  buyButton(buyBuild),
                  finishButton(finish),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buyButton(void Function() fn) {
    return ElevatedButton(
      onPressed: (tname.isNotEmpty &&
              buyTime &&
              pi.current.valor > 0.0 &&
              pi.current.valor >= tvalor &&
              !ti.current.vendido)
          ? fn
          : null,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'BUY',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget finishButton(void Function() fn) {
    return ElevatedButton(
      onPressed: fn,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'FINISH',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget showImage(String path) {
    return tpath.isNotEmpty
        ? Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
              border: Border.all(color: Colors.black),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.asset(path),
            ),
          )
        : Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
            ),
          );
  }
}
