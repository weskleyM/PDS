import 'package:banco_imobiliario/interfaces/icomposite_tabuleiro.dart';
import 'package:banco_imobiliario/interfaces/itabuleiro.dart';

class CompositeTabuleiro implements ICompositeTabuleiro {
  final List<ITabuleiro> _campos = [];

  @override
  void adicionarCampos(List<ITabuleiro> campos) {
    _campos.addAll(campos);
  }

  @override
  List<ITabuleiro> getCampos() {
    return _campos;
  }
}
