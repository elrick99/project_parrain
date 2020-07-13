import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:project_parrain/Providers/Events.dart';
import 'package:provider/provider.dart';

class TodoItem {
  
  final int id;
  final String content;
  // SQLite doesn't supprot boolean. Use INTEGER/BIT (0/1 values).
  final bool isDone;
  final String date;
  final String heure;
  final String priority;
  final int timing;
  // SQLite doesn't supprot DateTime. Store them as INTEGER (millisSinceEpoch).
  final DateTime createdAt;

  TodoItem(
      {this.id,
      this.content,
      this.isDone = false,
      this.date,
      this.heure,
      this.priority,
      this.timing,
      this.createdAt});

  TodoItem.fromJsonMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        content = map['content'],
        isDone = map['isDone'] == 1,
        date = map['date'],
        heure = map['heure'],
        timing = map['timing'],
        priority = map['priority'],
        createdAt = DateTime.fromMillisecondsSinceEpoch(map['createdAt']);

  Map<dynamic, dynamic> toJsonMap() => {
        'id': id,
        'content': content,
        'isDone': isDone ? 1 : 0,
        'date': date,
        'heure': heure,
        'timing': timing.toString(),
        'priority': priority,
        'createdAt': createdAt.millisecondsSinceEpoch,
      };
}

class OngoingTask extends StatefulWidget {
  @override
  _OngoingTaskState createState() => _OngoingTaskState();
}

class _OngoingTaskState extends State<OngoingTask> {
  var urgent= "rouge";
  var important= "vert";
  var moinImportante="bleu";
  int id;
  static const kDbFileName = 'sqflite_ex.db';
  static const kDbTableName = 'example_tbl';
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  Database _db;
  List<TodoItem> _todos = [];
  TodoItem currentItem;
  TextEditingController teConText = TextEditingController();
  TextEditingController teHeure = TextEditingController();
  TextEditingController teDate = TextEditingController();
  TextEditingController teId = TextEditingController();
  TextEditingController teIsOne = TextEditingController();
  TextEditingController tePriority = TextEditingController();
  TextEditingController teTiming = TextEditingController();

  void onTapItem(TodoItem item) {
    setState(() {
      currentItem = item;
    });
    teConText.text = currentItem.content;
    teHeure.text = currentItem.heure.toString();
    teDate.text = currentItem.date.toString();
    teId.text = currentItem.id.toString();
    teIsOne.text = currentItem.isDone.toString();
    tePriority.text = currentItem.isDone.toString();
    teTiming.text = currentItem.isDone.toString();
  }

  Future<void> _initDb() async {
    final dbFolder = await getDatabasesPath();
    if (!await Directory(dbFolder).exists()) {
      await Directory(dbFolder).create(recursive: true);
    }
    final dbPath = join(dbFolder, kDbFileName);
    this._db = await openDatabase(
      dbPath,
      version: 1,
      // onOpen: (db) async {
      //   List<Map> jsons =
      //       await this._db.rawQuery('SELECT * FROM $kDbTableName');
      //   print('${jsons.length} rows retrieved from db!');
      //   this._todos = jsons.map((json) => TodoItem.fromJsonMap(json)).toList();
      // },
    );
  }

  Future<bool> _asyncInit() async {
    // Avoid this function to be called multiple times,
    // cf. https://medium.com/saugo360/flutter-my-futurebuilder-keeps-firing-6e774830bc2
    await _memoizer.runOnce(() async {
      await _initDb();
      await _getTodoItems();
    });
    return true;
  }

  Future<void> _updateUI() async {
    await _getTodoItems();
    setState(() {});
  }

  Future<void> _getTodoItems() async {
    try{
      List<Map> jsons = await this._db.rawQuery('SELECT * FROM $kDbTableName');
    print('${jsons.length} rows retrieved from db!');
    this._todos = jsons.map((json) => TodoItem.fromJsonMap(json)).toList();
  
    }catch(error){
      print("Get toDo Item ${error.toString()}");
    }
    }

  Future<void> _toggleTodoItem(TodoItem todo) async {
    int count = await this._db.rawUpdate(
      /*sql=*/ '''UPDATE $kDbTableName
                    SET content = ?
                    WHERE id = ?''',
      /*args=*/ [todo.content, todo.id],
    );
    print('Updated $count records in db.');
  }

  Future<void> _deleteTodoItem(TodoItem todo) async {
    final count = await this._db.rawDelete('''
        DELETE FROM $kDbTableName
        WHERE id = ${todo.id}
      ''');
    print('Updated $count records in db.');
  }

  var selected;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProEvent>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple.shade800,
        // title:Text("data")
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(color: Colors.red),
        child: Stack(
          // overflow: Overflow.clip,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade800,
                    // color: Colors.red
                    // image: DecorationImage(
                    //   image: AssetImage("images/fond.jpg"),
                    //   fit:
                    //   )
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Tâche en Cours",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              child: Icon(
                                Icons.replay,
                                size: 50,
                                color: Colors.white,
                              ),
                              onTap: () {
                                _getTodoItems();
                                print(_todos);
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 60,
              bottom: 0,
              child: FutureBuilder<bool>(
                future: _asyncInit(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  if (snapshot.data == false)
                    return Center(child: Text("Pas de donnée"));
                  return Container(
                    height: MediaQuery.of(context).size.height / 1.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: ListView(
                      children: this._todos.map(_itemToListTile).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card _itemToListTile(TodoItem todo) => Card(
        child: Container(
          height: 100,
          child: Row(
            children: <Widget>[
              Container(
                height: 100,
                width: 10,
                decoration: BoxDecoration(
                    color: (todo.priority == "Urgent" ||
                            todo.priority == "Moins Important" ||
                            todo.priority == "Important")
                        ? Colors.red[400]
                        : Colors.green[400],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
              ),
              Expanded(
                child: Container(
                  child: ListTile(
                    title: InkWell(
                      onTap: () {
                        onTapItem(todo);
                        id = todo.id;
                        print(id);
                      },
                      child: Text(
                        todo.content,
                        style: TextStyle(
                            fontStyle: todo.isDone ? FontStyle.italic : null,
                            color: todo.isDone ? Colors.grey : null,
                            decoration: todo.isDone
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                    ),
                    subtitle: Text('date:${todo.date} \n heure:${todo.heure}'),
                    isThreeLine: true,
                    // leading: IconButton(
                    //   icon: Icon(
                    //       todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
                    //   onPressed: () async {
                    //     await _toggleTodoItem(todo);
                    //     _updateUI();
                    //   },
                    // ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await _deleteTodoItem(todo);
                          _updateUI();
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
