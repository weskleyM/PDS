import 'package:flutter/material.dart';
import 'package:banco_imobiliario/interfaces/iplayer.dart';
import 'package:banco_imobiliario/interfaces/itabuleiro.dart';

class WidgetPlayers extends StatefulWidget {
  const WidgetPlayers({
    super.key,
    required this.p,
    required this.c,
    required this.lista,
  });

  final IPlayer p;
  final Color c;
  final List<ITabuleiro> lista;

  @override
  State<WidgetPlayers> createState() => _WidgetPlayersState();
}

class _WidgetPlayersState extends State<WidgetPlayers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: widget.c,
          radius: 40.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                widget.p.nome[0],
                style: const TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Text(
          widget.p.nome,
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        Text(
          'R\$ ${widget.p.valor.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple.shade900,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 300.0,
          width: 200.0,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: ListView(
            children: [
              for (var e in widget.lista)
                Text(
                  e.nome,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
