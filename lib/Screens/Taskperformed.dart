import 'package:flutter/material.dart';

class TaskPerformed extends StatefulWidget {
  @override
  _TaskPerformedState createState() => _TaskPerformedState();
}

class _TaskPerformedState extends State<TaskPerformed> {
  var selected = 1;
  @override
   Widget build(BuildContext context) {
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
                              "Tâche Effectué",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.thumb_up, size: 50, color: Colors.white)
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
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Dismissible(
                        direction: DismissDirection.startToEnd,
                        key: ValueKey(1),
                        background: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(color: Color(0xFF262AAA)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                        confirmDismiss: (direction) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Attention"),
                                  content: Text("Voulez vous supprimée"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text("Non")),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text("Oui"))
                                  ],
                                );
                              });
                        },
                        child: Card(
                          child: Container(
                            height: 100,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                ),
                                Expanded(
                                  child: Container(
                                      child: ListTile(
                                    title: Text("Apprendre flutter"),
                                    subtitle:
                                        Text("05/07/2020" + " " + "16h20"),
                                    // trailing: Icon(Icons.edit),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Divider(),
                      ),
                      Dismissible(
                        direction: DismissDirection.startToEnd,
                        key: ValueKey(1),
                        background: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(color: Color(0xFF262AAA)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                        confirmDismiss: (direction) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Attention"),
                                  content: Text("Voulez vous supprimée"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text("Non")),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text("Oui"))
                                  ],
                                );
                              });
                        },
                        child: Card(
                          child: Container(
                            height: 100,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                ),
                                Expanded(
                                  child: Container(
                                      child: ListTile(
                                    title: Text("Apprendre flutter"),
                                    subtitle:
                                        Text("05/07/2020" + " " + "16h20"),
                                    // trailing: Icon(Icons.edit),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Divider(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
