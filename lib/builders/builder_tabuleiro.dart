import 'package:banco_imobiliario/interfaces/ibuilder_tabuleiro.dart';
import 'package:banco_imobiliario/interfaces/icomposite_tabuleiro.dart';
import 'package:banco_imobiliario/interfaces/itabuleiro.dart';
import 'package:banco_imobiliario/composites/composite_tabuleiro.dart';
import 'package:banco_imobiliario/factorys/fabrica_tabuleiro.dart';

class BuilderTabuleiro implements IBuilderTabuleiro {
  final ICompositeTabuleiro _campo = CompositeTabuleiro();

  @override
  List<ITabuleiro> criarTabuleiro() {
    final fabricaCampo = FabricaTabuleiro.instance;
    // final inicio = fabricaCampo.inicio('Inicio', 0.0, 'assets/images/coin.png');
    final aeroporto = fabricaCampo.aeroporto(
        'Aeroporto', 300.0, 'assets/images/coin.png', false);
    final apartamento = fabricaCampo.apartamento(
        'Apartamento', 200.0, 'assets/images/coin.png', false);
    final bangalo =
        fabricaCampo.bangalo('Bangalo', 500.0, 'assets/images/coin.png', false);
    final cais =
        fabricaCampo.cais('Cais', 400.0, 'assets/images/coin.png', false);
    final casaDePraia = fabricaCampo.casaDePraia(
        'Casa de Praia', 100.0, 'assets/images/coin.png', false);
    final cobertura = fabricaCampo.cobertura(
        'Cobertura', 300.0, 'assets/images/coin.png', false);
    final duplex =
        fabricaCampo.duplex('Duplex', 200.0, 'assets/images/coin.png', false);
    final ferrovia = fabricaCampo.ferrovia(
        'Ferrovia', 300.0, 'assets/images/coin.png', false);
    final flat =
        fabricaCampo.flat('Flat', 400.0, 'assets/images/coin.png', false);
    final kitnet =
        fabricaCampo.kitnet('Kitnet', 300.0, 'assets/images/coin.png', false);
    final loft =
        fabricaCampo.loft('Loft', 500.0, 'assets/images/coin.png', false);
    final mansao =
        fabricaCampo.mansao('Mansao', 300.0, 'assets/images/coin.png', false);
    final sobrado =
        fabricaCampo.sobrado('Sobrado', 100.0, 'assets/images/coin.png', false);
    final studio =
        fabricaCampo.studio('Studio', 200.0, 'assets/images/coin.png', false);
    final triplex =
        fabricaCampo.triplex('Triplex', 400.0, 'assets/images/coin.png', false);
    _campo.adicionarCampos([
      // inicio,
      aeroporto,
      apartamento,
      bangalo,
      cais,
      casaDePraia,
      cobertura,
      duplex,
      ferrovia,
      flat,
      kitnet,
      loft,
      mansao,
      sobrado,
      studio,
      triplex,
    ]);
    return _campo.getCampos();
  }
}
