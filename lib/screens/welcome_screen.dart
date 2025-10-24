import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // imagem de fundo com opacidade 50% (arquivo background_init.png)
            Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/background_init.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: Colors.black);
                },
              ),
            ),

            // Conteúdo alinhado conforme o mock: logo no topo, texto grande à esquerda e botão embaixo à esquerda
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // logo no topo
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: SizedBox(
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
                    ),

                    // Expande o espaço até o texto (para posicioná-lo mais abaixo)
                    const Spacer(),

                    // Texto grande a esquerda
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 360),
                        child: const Text(
                          'Liberdade financeira sem\ncomplicações',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Botão grande alinhado a esquerda
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDFEA3C),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 28.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Entrar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(width: 12),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
