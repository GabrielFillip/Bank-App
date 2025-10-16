# Bank App

Aplicativo exemplo em Flutter para gerenciar transferências bancárias locais usando SQLite.

Principais características:
- Navegação entre telas (Home, Nova Transferência, Lista)
- Persistência local com `sqflite`
- Formatação de moeda com `intl`
- Validação de formulários, loading states e feedback via `SnackBar`

Como rodar (Windows PowerShell):

1. Instale dependências:

```powershell
flutter pub get
```

2. Rodar no emulador ou dispositivo conectado:

```powershell
flutter run
```

Observações:
- O projeto utiliza Material 3 e foi pensado para dispositivos Android e iOS.
- Para testes rápidos: abra o app, crie uma transferência e verifique a lista.
