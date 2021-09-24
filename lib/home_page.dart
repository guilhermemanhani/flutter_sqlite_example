import 'package:flutter/material.dart';
import 'package:flutter_sqlite_example/database/database_sqlite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _database();
  }

  Future<void> _database() async {
    final database = await DatabaseSqlite().openConnection();
    // database.insert('teste', {'nome': 'Guilherme'});
    // database.delete('teste', where: 'nome = ?', whereArgs: ['Guilherme']);
    // database.update('teste', {'nome': 'Manhani'},
    //     where: 'nome = ?', whereArgs: ['Guilherme']);
    // var result = await database.query('teste');
    // print(result);

    // database.rawInsert('insert into teste values(null, ?)', ['Guilherme']);
    // database.rawUpdate(
    //     'update teste set nome = ? where id = ?', ['Guilherme Flutter', 5]);
    // database.rawUpdate('delete from teste where id = ?', [5]);
    var result = await database.rawQuery('select * from teste');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(),
    );
  }
}
