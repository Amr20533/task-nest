import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_nest/models/task_model.dart';
import 'package:task_nest/utils/db_constants.dart';

class TaskDataSource{
  static final TaskDataSource _instance = TaskDataSource._();
  factory TaskDataSource() => _instance;

  TaskDataSource._(){
    _initDB();
  }


  late Database _database;

  Future<Database> get database async{
    _database ??= await _initDB();
    return _database;
  }

  Future<Database> _initDB()async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBConstants.taskDBName);
    return openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database database, int version)async{
    await database.execute('''
      CREATE TABLE ${DBConstants.taskDBTable}{
        ${DBConstants.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DBConstants.titleColumn} TEXT,
        ${DBConstants.noteColumn} TEXT,
        ${DBConstants.dateColumn} TEXT,
        ${DBConstants.timeColumn} TEXT,
        ${DBConstants.categoryColumn} TEXT,
        ${DBConstants.isCompletedColumn} INTEGER
      }
    ''');
  }

  Future<int> addTask(TaskModel task)async{
    final _db = await database;
    return _db.transaction(
        (txn) async{
          return await txn.insert(
            DBConstants.taskDBTable,
            task.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace
          );
        }
    );
  }


  Future<int> deleteTask(TaskModel task)async{
    final _db = await database;
    return _db.transaction(
            (txn) async{
          return await txn.delete(
              DBConstants.taskDBTable,
              where: 'id= ?',
              whereArgs: [task.id],
          );
        }
    );
  }

  Future<int> updateTask(TaskModel task)async{
    final _db = await database;
    return _db.transaction(
            (txn) async{
          return await txn.update(
            DBConstants.taskDBTable,
            task.toJson(),
            where: 'id= ?',
            whereArgs: [task.id],
          );
        }
    );
  }

  Future<List<TaskModel>> getAllTasks()async{
    final _db = await database;
    final List<Map<String,dynamic>> query = await _db.query(DBConstants.taskDBTable, orderBy: 'id DESC');

    return List.generate(query.length, (task) => TaskModel.fromJson(query[task]));
  }
}