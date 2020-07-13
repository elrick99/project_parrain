import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Data class for the mini todo application.
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

String priorito;

class NewTasks extends StatefulWidget {
  final _keyform = GlobalKey<FormState>();

  // priorité

  Color urgent = Colors.red;
  Color important = Colors.green;
  Color moins = Colors.blue;
  Color priorite = Colors.green;
  String title;
  String timing;

  static const menuItems = <int>[
    15,
    30,
    60,
    120,
  ];

  // const NewTasks({Key key}) : super(key: key);

  @override
  _NewTasksState createState() => _NewTasksState();
}

class _NewTasksState extends State<NewTasks> {
  Color urgent = Colors.red;

  Color important = Colors.green;
  Color moins = Colors.blue;
  Color priorite = Colors.green;
  String title;
  int timing;
  String change;
  final List<DropdownMenuItem<int>> _dropDownMenuItems = NewTasks.menuItems
      .map(
        (int value) => DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        ),
      )
      .toList();
  int _btn1SelectedVal;
  int _btn2SelectedVal;
  int _btn3SelectedVal;
  int id;
  TextStyle ts = TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
  double _width;
  var dateofday = " Date de la tache ";
  var heureofday = " Heure de la tache";
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

  /**
   * MADIFICATION
   */

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

  updateItemArea() {
    TextStyle ts = TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Divider(
            color: Colors.grey,
            indent: 5,
            endIndent: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            alignment: Alignment(-1, 0),
            child: Text(
              "* Update List Item (Select an item to update from the list)",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            //color: Colors.grey[200],
            height: 35,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: <Widget>[
                Container(
                  width: _width * 0.1,
                  alignment: Alignment(0, 0),
                  child: (currentItem != null)
                      ? Text(currentItem.id.toString(), style: ts)
                      : null,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: teConText,
                      textAlign: TextAlign.center,
                      style: ts,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _width * 0.2,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: teHeure,
                    textAlign: TextAlign.center,
                    style: ts,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   width: _width * 0.15,
                //   child: InkWell(
                //     child: Icon(Icons.sync),
                //     onTap: () {
                //       if (currentItem == null) return;
                //       TodoItem item = TodoItem(
                //           teConName.text, int.parse(teConAge.text.toString()));
                //       item.id = currentItem.id;
                //       updateItem(item);
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Opens a db local file. Creates the db table if it's not yet created.
  Future<void> _initDb() async {
    final dbFolder = await getDatabasesPath();
    if (!await Directory(dbFolder).exists()) {
      await Directory(dbFolder).create(recursive: true);
    }
    final dbPath = join(dbFolder, kDbFileName);
    this._db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $kDbTableName(
          id INTEGER PRIMARY KEY, 
          isDone BIT NOT NULL,
          date TEXT,
          heure TEXT,
          priority TEXT,
          timing INT,
          content TEXT,
          createdAt INT)
        ''');
      },
    );
  }

  // Retrieves rows from the db table.
  Future<void> _getTodoItems() async {
    List<Map> jsons = await this._db.rawQuery('SELECT * FROM $kDbTableName');
    print('${jsons.length} rows retrieved from db!');
    this._todos = jsons.map((json) => TodoItem.fromJsonMap(json)).toList();
  }

  // Inserts records to the db table.
  // Note we don't need to explicitly set the primary key (id), it'll auto
  // increment.
  Future<void> _addTodoItem(TodoItem todo) async {
    await this._db.transaction(
      (Transaction txn) async {
        int id = await txn.rawInsert('''
          INSERT INTO $kDbTableName
            (isDone,date,heure,priority,timing,content,createdAt)
          VALUES
            (
              ${todo.isDone ? 1 : 0},
              "${todo.date}",
              "${todo.heure}",
              "${todo.priority}",
              "${todo.timing}",
              "${todo.content}",
              ${todo.createdAt.millisecondsSinceEpoch}
            )''');
        print('Inserted todo item with id=$id.');
      },
    );
  }

  // Updates records in the db table.
  Future<void> _toggleTodoItem(TodoItem todo) async {
    int count = await this._db.rawUpdate(
      /*sql=*/ '''UPDATE $kDbTableName
                    SET content = ?
                    WHERE id = ?''',
      /*args=*/ [todo.content, todo.id],
    );
    print('Updated $count records in db.');
  }

  // Deletes records in the db table.
  Future<void> _deleteTodoItem(TodoItem todo) async {
    final count = await this._db.rawDelete('''
        DELETE FROM $kDbTableName
        WHERE id = ${todo.id}
      ''');
    print('Updated $count records in db.');
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _asyncInit(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == false)
          return Center(
            child: CircularProgressIndicator(),
          );
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple.shade800,
            title: Text("Nouvelle Tache"),
          ),
          body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(color:Colors.red),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(color: Colors.yellow),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  color:
                                      Colors.purple.shade800.withOpacity(0.5),
                                ),
                                labelText: "Nom de tache",
                                hintText: 'Veuillez entrer le nom de la tache'),
                            onChanged: (String val) {
                              title = val;
                            },
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Date :",
                                  style: TextStyle(
                                      color: Colors.purple.shade800,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1,
                              height: 70,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      dateofday,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.today,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2018),
                                lastDate: DateTime(2025),
                              ).then((DateTime value) {
                                if (value != null) {
                                  setState(() {
                                    dateofday =
                                        " ${value.year.toString()}/${value.month.toString().padLeft(2, "0")}/${value.day.toString()} ";
                                    print(dateofday);
                                  });
                                }
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Heure :",
                                  style: TextStyle(
                                      color: Colors.purple.shade800,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1,
                              height: 70,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      heureofday,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              DateTime now = DateTime.now();
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(
                                    hour: now.hour, minute: now.minute),
                              ).then((TimeOfDay value) {
                                if (value != null) {
                                  setState(() {
                                    heureofday =
                                        " ${value.hour.toString()}h:${value.minute.toString().padLeft(2, "0")}min";
                                  });
                                }
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Priorité :",
                                  style: TextStyle(
                                      color: Colors.purple.shade800,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              setState(() {
                                priorite = urgent;
                                priorito = "Urgent";
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      border: (priorite == urgent)
                                          ? Border.all(
                                              color: Colors.black, width: 2)
                                          : Border(),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Urgent",
                                    style: TextStyle(
                                        color: Colors.purple.shade800,
                                        fontSize: 17,
                                        fontWeight: (priorite == urgent)
                                            ? FontWeight.bold
                                            : null),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              setState(() {
                                priorite = important;
                                priorito = "Important";
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      border: (priorite == important)
                                          ? Border.all(
                                              color: Colors.black, width: 2)
                                          : Border(),
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Important",
                                    style: TextStyle(
                                        color: Colors.purple.shade800,
                                        fontSize: 17,
                                        fontWeight: (priorite == important)
                                            ? FontWeight.bold
                                            : null),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              setState(() {
                                priorite = moins;
                                priorito = "Moins Important";
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      border: (priorite == moins)
                                          ? Border.all(
                                              color: Colors.black, width: 2)
                                          : Border(),
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Moins important",
                                    style: TextStyle(
                                        color: Colors.purple.shade800,
                                        fontSize: 17,
                                        fontWeight: (priorite == moins)
                                            ? FontWeight.bold
                                            : null),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Rappel :",
                                  style: TextStyle(
                                      color: Colors.purple.shade800,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: <Widget>[
                                DropdownButton<int>(
                                  // Must be one of items.value.
                                  value: _btn2SelectedVal,
                                  onChanged: (int newValue) {
                                    setState(() {
                                      _btn2SelectedVal = newValue;
                                      timing = _btn2SelectedVal;
                                    });
                                  },
                                  items: this._dropDownMenuItems,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap: () async {
                              await _addTodoItem(
                                TodoItem(
                                  content: title,
                                  date: dateofday,
                                  heure: heureofday,
                                  timing: timing,
                                  priority: priorito,
                                  createdAt: DateTime.now(),
                                ),
                              );
                              _updateUI();
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Show Snackbar'),
                                duration: Duration(seconds: 3),
                              ));
                              Navigator.pushNamed(context, "ongoingTask");
                            },
                            child: Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade800,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Enregistrer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                    /**
                     * LISTE DES ENREGISTREMENTS
                     */
                    // Container(
                    //   height: 100,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: ListView(
                    //     children: this._todos.map(_itemToListTile).toList(),
                    //   ),
                    // ),
                    /**
                     * MODIFICATION DES ENREGISTREMENTS
                     */
                    // Expanded(
                    //   child: Row(
                    //     children: <Widget>[
                    //       Expanded(
                    //         child: Container(
                    //           padding:
                    //               const EdgeInsets.symmetric(horizontal: 10),
                    //           child: TextField(
                    //             controller: teConText,
                    //             textAlign: TextAlign.center,
                    //             style: ts,
                    //             decoration: InputDecoration(
                    //               filled: true,
                    //               fillColor: Colors.white,
                    //               border: OutlineInputBorder(
                    //                 borderRadius:
                    //                     BorderRadius.all(Radius.circular(5)),
                    //                 borderSide: BorderSide(
                    //                     color: Colors.grey, width: 1),
                    //               ),
                    //             ),
                    //             onChanged: (String val) {
                    //               change = val;
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //           child: Container(
                    //         width: 80,
                    //         child: InkWell(
                    //           child: Icon(Icons.sync),
                    //           onTap: () async {
                    //             await _toggleTodoItem(
                    //                 TodoItem(content: change, id: id));
                    //                 print(id);
                    //             _updateUI();
                    //           },
                    //         ),
                    //       ))
                    //     ],
                    //   ),
                    // )
                  ],
                )),
          ),
          // floatingActionButton: _buildFloatingActionButton(),
        );
      },
    );
  }

  Future<void> _updateUI() async {
    await _getTodoItems();
    setState(() {});
  }
/**
 * AFFICHAGE DE LA LISTE
 */
  // ListTile _itemToListTile(TodoItem todo) => ListTile(
  //       title: InkWell(
  //         onTap: () {
  //           onTapItem(todo);
  //           id = todo.id;
  //           // print(id);
  //         },
  //         child: Text(
  //           todo.content,
  //           style: TextStyle(
  //               fontStyle: todo.isDone ? FontStyle.italic : null,
  //               color: todo.isDone ? Colors.grey : null,
  //               decoration: todo.isDone ? TextDecoration.lineThrough : null),
  //         ),
  //       ),
  //       subtitle: Text(
  //           'id=${todo.id}\ncreated at ${todo.createdAt}\ndate:${todo.date} h:${todo.heure}'),
  //       isThreeLine: true,
  //       leading: IconButton(
  //         icon: Icon(
  //             todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
  //         onPressed: () async {
  //           await _toggleTodoItem(todo);
  //           _updateUI();
  //         },
  //       ),
  //       trailing: IconButton(
  //           icon: Icon(Icons.delete),
  //           onPressed: () async {
  //             await _deleteTodoItem(todo);
  //             _updateUI();
  //           }),
  //     );

  // FloatingActionButton _buildFloatingActionButton() {
  //   return FloatingActionButton(
  //     child: Icon(Icons.add),
  //     onPressed: () async {
  //       await _addTodoItem(
  //         TodoItem(
  //           content: title,
  //           date: dateofday,
  //           heure: heureofday,
  //           priority: priorite,
  //           createdAt: DateTime.now(),
  //         ),
  //       );
  //       _updateUI();
  //     },
  //   );
  // }
}
