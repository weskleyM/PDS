import 'package:banco_imobiliario/interfaces/itabuleiro.dart';

abstract class IFabricaTabuleiro {
  // ITabuleiro inicio(String nome, double valor, String path);
  ITabuleiro aeroporto(String nome, double valor, String path, bool vendido);
  ITabuleiro apartamento(String nome, double valor, String path, bool vendido);
  ITabuleiro bangalo(String nome, double valor, String path, bool vendido);
  ITabuleiro bonus(String nome, double valor, String path, bool vendido);
  ITabuleiro cais(String nome, double valor, String path, bool vendido);
  ITabuleiro casaDePraia(String nome, double valor, String path, bool vendido);
  ITabuleiro cobertura(String nome, double valor, String path, bool vendido);
  ITabuleiro duplex(String nome, double valor, String path, bool vendido);
  ITabuleiro ferrovia(String nome, double valor, String path, bool vendido);
  ITabuleiro flat(String nome, double valor, String path, bool vendido);
  ITabuleiro kitnet(String nome, double valor, String path, bool vendido);
  ITabuleiro loft(String nome, double valor, String path, bool vendido);
  ITabuleiro mansao(String nome, double valor, String path, bool vendido);
  ITabuleiro prisao(String nome, double valor, String path, bool vendido);
  ITabuleiro sobrado(String nome, double valor, String path, bool vendido);
  ITabuleiro studio(String nome, double valor, String path, bool vendido);
  ITabuleiro triplex(String nome, double valor, String path, bool vendido);
}
