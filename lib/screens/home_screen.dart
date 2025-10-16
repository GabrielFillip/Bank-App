import 'package:flutter/material.dart';
import 'package:bank_app/screens/nova_transferencia.dart';
import 'package:bank_app/screens/lista_transferencias.dart';
import 'package:bank_app/utils/transitions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(100),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              icon: const Icon(Icons.arrow_forward, size: 32),
              label: const Text('Nova Transferência',
                  style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.of(context)
                    .push(criarRotaSuave(const NovaTransferenciaScreen()));
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(100),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              icon: const Icon(Icons.list, size: 32),
              label: const Text('Lista de Transferências',
                  style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.of(context)
                    .push(criarRotaSuave(const ListaTransferenciasScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
