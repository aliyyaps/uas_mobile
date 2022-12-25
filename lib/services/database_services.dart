import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uas_mobile/models/biodata.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'biodata_database.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // When the database is first created, create a table to store breeds
  // and a table to store dogs.
  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {breeds} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE biodata(id INTEGER PRIMARY KEY, nim INTEGER, nama TEXT, alamat TEXT, jenisKelamin TEXT, tglLahir TEXT)',
    );
  }

  // Define a function that inserts breeds into the database
  Future<void> insertBiodata(Biodata biodata) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the Breed into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same breed is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'biodata',
      biodata.toMap(),
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // // A method that retrieves all the item from the item table.
  Future<List<Biodata>> biodataList() async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Query the table for all the Item.
    // final List<Map<String, dynamic>> maps = await db.query('item');
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM biodata");

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => Biodata.fromMap(maps[index]));
  }
   Future<void> delete(Biodata biodata) async {
    final db = await _databaseService.database;

    db.delete('biodata', where: 'id = ?', whereArgs: [biodata.id]);
  }
}
