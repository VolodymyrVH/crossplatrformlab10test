import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:lab10/models/resume.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'resumes.db');
    print('Database path: $path');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE resumes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fullName TEXT,
            hobbies TEXT,
            currentSituation TEXT,
            aboutMe TEXT,
            gitHubUsername TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertResume(Resume resume) async {
    final db = await database;
    await db.insert(
      'resumes',
      resume.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Resume>> getAllResumes() async {
    final db = await database;
    final result = await db.query('resumes');
    return result.map((row) => Resume.fromMap(row)).toList();
  }

  Future<void> deleteResume(int id) async {
    final db = await database;
    await db.delete('resumes', where: 'id = ?', whereArgs: [id]);
  }
}
