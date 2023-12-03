abstract class ITabuleiro {
  final String nome;
  final double valor;
  final String path;
  bool vendido;

  ITabuleiro({
    required this.nome,
    required this.valor,
    required this.path,
    required this.vendido,
  });
}
