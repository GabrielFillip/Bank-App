import 'package:flutter/material.dart';
import 'package:bank_app/widgets/form_text_field.dart';
import 'package:bank_app/database/database_helper.dart';
import 'package:bank_app/models/transferencia.dart';

class NovaTransferenciaScreen extends StatefulWidget {
  const NovaTransferenciaScreen({super.key});

  @override
  State<NovaTransferenciaScreen> createState() =>
      _NovaTransferenciaScreenState();
}

class _NovaTransferenciaScreenState extends State<NovaTransferenciaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _contaController = TextEditingController();
  final _valorController = TextEditingController();
  bool _carregando = false;

  @override
  void dispose() {
    _contaController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  Future<void> _salvar() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _carregando = true);
    try {
      final numero = _contaController.text.trim();
      final valor = double.parse(_valorController.text.replaceAll(',', '.'));

      final transferencia = Transferencia(
        numeroConta: numero,
        valor: valor,
        data: DateTime.now(),
      );

      final db = DatabaseHelper();
      await db.inserirTransferencia(transferencia);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transferência salva com sucesso')));
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro: $e')));
    } finally {
      if (mounted) setState(() => _carregando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Transferência')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CampoTexto(
                label: 'Número da Conta',
                hint: 'Digite o número da conta',
                controller: _contaController,
                validator: (v) {
                  if (v == null || v.trim().isEmpty)
                    return 'Informe o número da conta';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CampoTexto(
                label: 'Valor da Transferência',
                hint: '0,00',
                controller: _valorController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Informe o valor';
                  final parsed = double.tryParse(v.replaceAll(',', '.'));
                  if (parsed == null || parsed <= 0)
                    return 'Informe um valor maior que zero';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _carregando
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: _salvar,
                      child: const Text('Confirmar'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
