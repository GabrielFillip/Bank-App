# Bank App

Um aplicativo exemplo em Flutter que demonstra um fluxo simples de gerenciamento de transferências locais com persistência via SQLite.

Este README traz uma visão rápida do projeto, instruções mínimas para rodar e a estrutura principal.

## Funcionalidades principais

- Tela de boas-vindas (Welcome) com imagem de fundo e botão "Entrar".
- Tela principal (Home) com acesso para criar nova transferência e listar transferências.
- Armazenamento local usando `sqflite`.
- Formatação de datas e valores com `intl`.
- UI baseada em Material 3, com componentes e estilos customizados.

## Como rodar (resumo rápido)

1. Na raiz do projeto, instale dependências:

```powershell
flutter pub get
```

2. Rode o app no emulador ou dispositivo conectado:

```powershell
flutter run
```

## Estrutura resumida do projeto

- `lib/main.dart` — ponto de entrada do app; atualmente inicializa a `WelcomeScreen`.
- `lib/screens/` — telas da aplicação (por ex. `welcome_screen.dart`, `home_screen.dart`, `nova_transferencia.dart`, `lista_transferencias.dart`).
- `lib/models/` — modelos de dados (ex.: `transferencia.dart`).
- `lib/database/` — helper(es) para SQLite (`database_helper.dart`).
- `assets/images/` — imagens e backgrounds usados pela UI.


## Screenshots (prints)
<p align="center">
  <img width="200" height="500" src="https://github.com/user-attachments/assets/b776e7b4-58f0-4b58-8e34-732ab3315823" alt="Welcome" />
  <img width="200" height="500" src="https://github.com/user-attachments/assets/8ad86920-c8be-469b-92d6-1fe074379fe7" alt="Home" />
  <img width="200" height="500" src="https://github.com/user-attachments/assets/16fbc5e2-fefb-48bc-a730-cb26d57a1408" alt="Transferencia" />
  <img width="200" height="500" src="https://github.com/user-attachments/assets/37f557b8-14e0-4201-861a-7db5911f20ba" alt="Transferencias" />
</p>




### Como contribuir

1. Crie uma branch com nome claro (ex.: `feature/welcome-ui`).
2. Faça commit das mudanças e abra um pull request.
