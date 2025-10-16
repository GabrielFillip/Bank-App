import 'package:flutter/material.dart';
import 'package:bank_app/models/transferencia.dart';
import 'package:bank_app/utils/formatters.dart';

class TransferCard extends StatelessWidget {
  final Transferencia transferencia;

  const TransferCard({super.key, required this.transferencia});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.monetization_on, color: Colors.green),
        title: Text(Formatadores.moeda(transferencia.valor)),
        subtitle: Text(
            'Conta: ${transferencia.numeroConta}\n${Formatadores.dataCurta(transferencia.data)}'),
        isThreeLine: true,
      ),
    );
  }
}
