
import 'package:banco_imobiliario/interfaces/iplayer.dart';

abstract class IFabricaPlayer {
  IPlayer playerA(String n, double v);
  IPlayer playerB(String n, double v);
  IPlayer playerC(String n, double v);
  IPlayer playerD(String n, double v);
}
