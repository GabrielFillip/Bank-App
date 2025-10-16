import 'package:flutter/material.dart';
import 'package:bank_app/database/database_helper.dart';
import 'package:bank_app/models/transferencia.dart';
import 'package:bank_app/widgets/transfer_card.dart';
import 'package:bank_app/screens/nova_transferencia.dart';
import 'package:bank_app/utils/transitions.dart';

class ListaTransferenciasScreen extends StatefulWidget {
  const ListaTransferenciasScreen({super.key});

  @override
  State<ListaTransferenciasScreen> createState() =>
      _ListaTransferenciasScreenState();
}

class _ListaTransferenciasScreenState extends State<ListaTransferenciasScreen> {
  final DatabaseHelper _db = DatabaseHelper();
  bool _carregando = true;
  List<Transferencia> _transferencias = [];

  @override
  void initState() {
    super.initState();
    _carregar();
  }

  Future<void> _carregar() async {
    setState(() => _carregando = true);
    try {
      final lista = await _db.listarTransferencias();
      if (!mounted) return;
      setState(() => _transferencias = lista);
    } catch (e) {
      if (mounted)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Erro ao carregar: $e')));
    } finally {
      if (mounted) setState(() => _carregando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências')),
      body: RefreshIndicator(
        onRefresh: _carregar,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _carregando
              ? const Center(child: CircularProgressIndicator())
              : _transferencias.isEmpty
                  ? ListView(
                      children: const [
                        SizedBox(height: 80),
                        Center(
                            child: Icon(Icons.description,
                                size: 72, color: Colors.grey)),
                        SizedBox(height: 16),
                        Center(
                            child: Text('Nenhuma transferência',
                                style: TextStyle(color: Colors.grey))),
                      ],
                    )
                  : ListView.builder(
                      itemCount: _transferencias.length,
                      itemBuilder: (context, index) {
                        final t = _transferencias[index];
                        return TransferCard(transferencia: t);
                      },
                    ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .push(criarRotaSuave(const NovaTransferenciaScreen()));
          await _carregar();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
