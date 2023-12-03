import 'package:banco_imobiliario/interfaces/ifabrica_player.dart';
import 'package:banco_imobiliario/interfaces/iplayer.dart';
import 'package:banco_imobiliario/classes/player_a.dart';
import 'package:banco_imobiliario/classes/player_b.dart';
import 'package:banco_imobiliario/classes/player_c.dart';
import 'package:banco_imobiliario/classes/player_d.dart';

class FabricaPlayer implements IFabricaPlayer {
  static const FabricaPlayer _instance = FabricaPlayer._();

  const FabricaPlayer._();

  @override
  PlayerA playerA(String n, double v) {
    return PlayerA(nome: n, valor: v);
  }

  @override
  PlayerB playerB(String n, double v) {
    return PlayerB(nome: n, valor: v);
  }

  @override
  PlayerC playerC(String n, double v) {
    return PlayerC(nome: n, valor: v);
  }

  @override
  PlayerD playerD(String n, double v) {
    return PlayerD(nome: n, valor: v);
  }

  static List<IPlayer> listaJogadores() {
    return [
      _instance.playerA('Maria', 3000.0),
      _instance.playerB('Joao', 3000.0),
      _instance.playerC('Ana', 0.0),
      _instance.playerD('Pedro', 3000.0),
    ];
  }
}
