import 'package:orodomop_app/data/models/notes.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblNotes = 'noteslist';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/notes.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblNotes (
        id INTEGER PRIMARY KEY,
        title TEXT,
        contents TEXT
      );
    ''');
  }

  Future<void> insertNote(NotesTable notes) async {
    final db = await database;
    await db!.insert(_tblNotes, notes.toMap());
  }

  Future<void> deleteNote(int id) async {
    final db = await database;
    await db!.delete(
      _tblNotes,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<NotesTable> getNoteById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(
      _tblNotes,
      where: 'id = ?',
      whereArgs: [id],
    );

    return results.map((e) => NotesTable.fromMap(e)).first;
  }

  Future<void> updateNote(NotesTable note) async {
    final db = await database;

    await db?.update(
      _tblNotes,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<List<NotesTable>> getNotesList() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblNotes);

    return results.map((e) => NotesTable.fromMap(e)).toList();
  }
}
