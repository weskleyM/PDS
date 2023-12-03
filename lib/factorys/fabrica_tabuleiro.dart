import 'package:banco_imobiliario/interfaces/ibuilder_tabuleiro.dart';
import 'package:banco_imobiliario/interfaces/ifabrica_tabuleiro.dart';
import 'package:banco_imobiliario/interfaces/itabuleiro.dart';
import 'package:banco_imobiliario/classes/tabuleiro/aeroporto.dart';
import 'package:banco_imobiliario/classes/tabuleiro/apartamento.dart';
import 'package:banco_imobiliario/classes/tabuleiro/bangalo.dart';
import 'package:banco_imobiliario/classes/tabuleiro/bonus.dart';
import 'package:banco_imobiliario/builders/builder_tabuleiro.dart';
import 'package:banco_imobiliario/classes/tabuleiro/cais.dart';
import 'package:banco_imobiliario/classes/tabuleiro/casa_de_praia.dart';
import 'package:banco_imobiliario/classes/tabuleiro/cobertura.dart';
import 'package:banco_imobiliario/classes/tabuleiro/duplex.dart';
import 'package:banco_imobiliario/classes/tabuleiro/ferrovia.dart';
import 'package:banco_imobiliario/classes/tabuleiro/flat.dart';
import 'package:banco_imobiliario/classes/tabuleiro/kitnet.dart';
import 'package:banco_imobiliario/classes/tabuleiro/loft.dart';
import 'package:banco_imobiliario/classes/tabuleiro/mansao.dart';
import 'package:banco_imobiliario/classes/tabuleiro/prisao.dart';
import 'package:banco_imobiliario/classes/tabuleiro/sobrado.dart';
import 'package:banco_imobiliario/classes/tabuleiro/studio.dart';
import 'package:banco_imobiliario/classes/tabuleiro/triplex.dart';

class FabricaTabuleiro implements IFabricaTabuleiro {
  static const FabricaTabuleiro _instance = FabricaTabuleiro._();

  const FabricaTabuleiro._();

  static FabricaTabuleiro get instance => _instance;

  // @override
  // Inicio inicio(String nome, double valor, String path) {
  //   return Inicio(nome: nome, valor: valor, path: path, vendido: true);
  // }

  @override
  Aeroporto aeroporto(String nome, double valor, String path, bool vendido) {
    return Aeroporto(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Apartamento apartamento(
      String nome, double valor, String path, bool vendido) {
    return Apartamento(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Bangalo bangalo(String nome, double valor, String path, bool vendido) {
    return Bangalo(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Bonus bonus(String nome, double valor, String path, bool vendido) {
    return Bonus(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Cais cais(String nome, double valor, String path, bool vendido) {
    return Cais(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  CasaDePraia casaDePraia(
      String nome, double valor, String path, bool vendido) {
    return CasaDePraia(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Cobertura cobertura(String nome, double valor, String path, bool vendido) {
    return Cobertura(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Duplex duplex(String nome, double valor, String path, bool vendido) {
    return Duplex(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Ferrovia ferrovia(String nome, double valor, String path, bool vendido) {
    return Ferrovia(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Flat flat(String nome, double valor, String path, bool vendido) {
    return Flat(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Kitnet kitnet(String nome, double valor, String path, bool vendido) {
    return Kitnet(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Loft loft(String nome, double valor, String path, bool vendido) {
    return Loft(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Mansao mansao(String nome, double valor, String path, bool vendido) {
    return Mansao(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Prisao prisao(String nome, double valor, String path, bool vendido) {
    return Prisao(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Sobrado sobrado(String nome, double valor, String path, bool vendido) {
    return Sobrado(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Studio studio(String nome, double valor, String path, bool vendido) {
    return Studio(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  @override
  Triplex triplex(String nome, double valor, String path, bool vendido) {
    return Triplex(nome: nome, valor: valor, path: path, vendido: vendido);
  }

  static List<ITabuleiro> camposTabuleiro() {
    IBuilderTabuleiro builder = BuilderTabuleiro();
    return builder.criarTabuleiro();
  }
}
