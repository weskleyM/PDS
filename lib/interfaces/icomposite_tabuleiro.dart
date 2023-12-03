import 'package:banco_imobiliario/interfaces/itabuleiro.dart';

abstract class ICompositeTabuleiro {
  void adicionarCampos(List<ITabuleiro> campos);
  List<ITabuleiro> getCampos();
}
