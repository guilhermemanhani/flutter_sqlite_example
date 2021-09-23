import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqlite {
  Future<void> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');
    await openDatabase(
      databaseFinalPath,
      version: 1,
      // chamado somoment no momento de criação do banco de dados
      // promeiro vez que carrega o aplicativo
      onCreate: (Database db, int version) {
        print('onCreate Chamado');
        final batch = db.batch();
        batch.execute('''
          create table teste(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
        ''');
        batch.commit();
      },
      // sera chamado sempre que ouver uma alteracao no version incremental(1 -> 2)
      onUpgrade: (Database db, int oldVersion, int version) {
        print('onUpgrade Chamado');
      },
      // sera chamado sempre que ouver uma alteracao no version decremental(2 -> 1)
      onDowngrade: (Database db, int oldVersion, int version) {
        print('onDowngrade Chamado');
      },
    );
  }
}
