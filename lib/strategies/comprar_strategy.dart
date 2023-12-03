import 'package:banco_imobiliario/interfaces/icomprar_strategy.dart';

class ComprarStrategy implements IComprarStrategy {
  @override
  double comprar(double n, double m) {
    n -= m;
    return n;
  }
}
