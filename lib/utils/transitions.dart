import 'package:flutter/material.dart';

// Cria uma rota customizada com transição suave (fade + slide)
PageRouteBuilder<T> criarRotaSuave<T>(Widget page) {
  return PageRouteBuilder<T>(
    transitionDuration: const Duration(milliseconds: 350),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final fade = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      final slide =
          Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero)
              .animate(fade);
      return FadeTransition(
        opacity: fade,
        child: SlideTransition(position: slide, child: child),
      );
    },
  );
}
