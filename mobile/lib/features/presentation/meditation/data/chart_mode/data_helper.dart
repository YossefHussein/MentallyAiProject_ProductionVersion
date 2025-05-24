import 'dart:io';
import 'package:mental_health_app/features/presentation/meditation/data/model/chart_mode_data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  //Singleton class
  DataBaseHelper._();
  static final DataBaseHelper instance = DataBaseHelper._();

  /// Define the database name, database version and declare a final property instance of the type DataBaseHelper.
  /// Also declare a public property named _database, which returns the DataBase instance.
  /// If _database is not initialized _initDataBase function will be called.
  /// Define the _initDataBase method as like the below in which the data directory is initialized with getApplicationDocumentsDirectory function,
  /// which is from path_provider package. This function returns the location where the database is stored,
  /// which is handled by the path_provider package. To connect and return the database reference openDataBase function is called.

  static const _databaseName = 'chartTable.db';
  static const _databaseVersion = 1;

  Database? _database;
  
  static initDataBase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDB);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDataBase();
    return _database!;
  }

  // If there is no database with the given database path,
  // we have to create the database. That’s what we have done with onCreate property.
  static Future _onCreateDB(Database db, int version) async {
    //create table query
    await db.execute('''
    CREATE TABLE ${ChartModeDataModel.tblMode}
     (${ChartModeDataModel.happyXValue} REAL,
      ${ChartModeDataModel.happyYValue} REAL,
      ${ChartModeDataModel.calmXValue} REAL,
      ${ChartModeDataModel.clamYValue} REAL,
      ${ChartModeDataModel.relaxXValue} REAL,
      ${ChartModeDataModel.relaxYValue} REAL,
      ${ChartModeDataModel.focusXValue} REAL,
      ${ChartModeDataModel.focusYValue} REAL)
  ''');
  }

  // To insert data into the SQLite.
  void add(ChartModeDataModel mode) async {
    var dbClient = await database;
    // Insert query to insert data into the database
    await dbClient.insert(ChartModeDataModel.tblMode, mode.toMap());
    print(dbClient.toString());
  }

  // the table is created from the above,
  // so define the methods to add and fetch the data from the SQLite by defining the add(),
  // getDatabase() methods as below.

  // To fetch data from the SQLite.
  Future<List<ChartModeDataModel>> getDatabase() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(
      ChartModeDataModel.tblMode,
      columns: [
        ChartModeDataModel.happyXValue,
        ChartModeDataModel.happyYValue,
        ChartModeDataModel.calmXValue,
        ChartModeDataModel.clamYValue,
        ChartModeDataModel.relaxXValue,
        ChartModeDataModel.relaxYValue,
        ChartModeDataModel.focusXValue,
        ChartModeDataModel.focusYValue
      ],
    );
    // Adding the fetched data to the list to bind to the chart.
    List<ChartModeDataModel> students = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        students
            .add(ChartModeDataModel.fromMap(maps[i] as Map<String, dynamic>));
      }
    }
    return students;
  }

  // To delete data from the database
  void delete() async {
    var dbClient = await database;
    await dbClient.delete(ChartModeDataModel.tblMode);
  }
}
