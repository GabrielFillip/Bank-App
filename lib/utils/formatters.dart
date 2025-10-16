import 'package:intl/intl.dart';

class Formatadores {
  // Formata valor em moeda brasileira (R$)
  static String moeda(double valor) {
    try {
      final formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
      return formatador.format(valor);
    } catch (e) {
      // Fallback simples caso os dados de locale não estejam disponíveis
      return 'R\$ ' + valor.toStringAsFixed(2);
    }
  }

  // Formata data para exibição curta
  static String dataCurta(DateTime? data) {
    if (data == null) return '';
    try {
      final df = DateFormat('dd/MM/yyyy HH:mm', 'pt_BR');
      return df.format(data);
    } catch (e) {
      // Em caso de falha na inicialização de locales, retorna fallback
      return data.toIso8601String();
    }
  }
}
