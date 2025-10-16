// Modelo de dados Transferencia
class Transferencia {
  int? id;
  String numeroConta; // número da conta destino
  double valor; // valor em reais
  DateTime? data; // data da transferência

  Transferencia({
    this.id,
    required this.numeroConta,
    required this.valor,
    this.data,
  });

  // Converte para Map para salvar no SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'numeroConta': numeroConta,
      'valor': valor,
      'data': data?.toIso8601String(),
    };
  }

  // Cria instância a partir do Map vindo do banco
  factory Transferencia.fromMap(Map<String, dynamic> map) {
    return Transferencia(
      id: map['id'] as int?,
      numeroConta: map['numeroConta'] as String,
      valor: (map['valor'] as num).toDouble(),
      data: map['data'] != null ? DateTime.parse(map['data'] as String) : null,
    );
  }
}
