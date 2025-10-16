import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:bank_app/models/transferencia.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inicializa o banco de dados
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bank_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transferencias(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        numeroConta TEXT NOT NULL,
        valor REAL NOT NULL,
        data TEXT
      )
    ''');
  }

  // Insere uma transferência no banco
  Future<int> inserirTransferencia(Transferencia t) async {
    try {
      final db = await database;
      final id = await db.insert('transferencias', t.toMap());
      return id;
    } catch (e) {
      // Re-lança a exceção para quem chamou tratar
      throw Exception('Erro ao inserir transferência: $e');
    }
  }

  // Recupera todas as transferências
  Future<List<Transferencia>> listarTransferencias() async {
    try {
      final db = await database;
      final maps = await db.query('transferencias', orderBy: 'data DESC');
      return maps.map((m) => Transferencia.fromMap(m)).toList();
    } catch (e) {
      throw Exception('Erro ao listar transferências: $e');
    }
  }

  // Fecha o banco (opcional)
  Future close() async {
    final db = await database;
    await db.close();
  }
}
