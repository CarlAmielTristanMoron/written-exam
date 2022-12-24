import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'todo_model.dart';

class DatabaseConnect{
  Database? _database;

  Future<Database> get database async{
    //database location
    final dbpath = await getDatabasesPath();
    //database name
    const dbname = 'todo.db';
    //creates full path for databasev
    final path =  join(dbpath, dbname);

    //open connection
    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  //creates table in the database
  Future<void> _createDB(Database db, int version) async{
    await db.execute('''
      CREATE TABLE todo(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      section TEXT
      )
    ''');
  }

  //Insert function
  Future<void> insertTodo(TodoModel todo) async {
    final db = await database;
    await db.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace //this will replace the duplicate entry
    );
  }

  //Edit Function
  Future<void> editTodo(TodoModel todo) async {
    final db = await database;
    await db.update(
      'todo',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id]
    );
  }

  //Delete Function
  Future<void> deleteTodo(TodoModel todo) async {
    final db = await database;
    await db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [todo.id]
    );
  }


  //Get Function
  Future<List<TodoModel>> getTodo() async {
    final db = await database;
    //save todo_ as list of map
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id ASC', //arrange list in descending order base on the id
    );

    return List.generate(
      items.length,
      (index) => TodoModel(
        id: items[index]['id'],
        name: items[index]['name'],
        section: items[index]['section']
      )
    );

  }
}