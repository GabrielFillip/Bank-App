import 'package:flutter/material.dart';
import 'package:bank_app/screens/nova_transferencia.dart';
import 'package:bank_app/screens/lista_transferencias.dart';
import 'package:bank_app/utils/transitions.dart';

/// Tela inicial estilizada conforme design (fundo preto + imagem com opacidade 10%)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // imagem de fundo com opacidade 10% (fallback se asset não existir)
            Opacity(
              opacity: 0.10,
              child: Image.asset(
                'assets/images/background_pattern.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // fallback: um Container neutro para preservar o layout
                  return Container(color: Colors.transparent);
                },
              ),
            ),

            // Conteúdo central
            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ícone (fallback para um Icon caso asset não exista)
                      SizedBox(
                        width: 96,
                        height: 96,
                        child: Image.asset(
                          'assets/images/logo_pig.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.account_balance_wallet,
                              color: Color(0xFFBEEA3C),
                              size: 72,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Bank App',
                        style: TextStyle(
                          color: Color(0xFFBEEA3C),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Botão Nova Transferência
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.arrow_forward,
                              color: Colors.black),
                          label: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: Text(
                              'Nova transferência',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8BDB3C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(criarRotaSuave(
                                const NovaTransferenciaScreen()));
                          },
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Botão Lista de Transferências
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.list, color: Colors.black),
                          label: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: Text(
                              'Lista de Transferências',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5FC4E6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(criarRotaSuave(
                                const ListaTransferenciasScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
