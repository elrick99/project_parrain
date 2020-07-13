import 'package:flutter/material.dart';

class PriorityTask extends StatefulWidget {
  @override
  _PriorityTaskState createState() => _PriorityTaskState();
}

class _PriorityTaskState extends State<PriorityTask> {
  var selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        title: Text("Priorité"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(color: Colors.red),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(color: Colors.green),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      child: Card(
                        elevation: (selected == 1) ? 7 : 0,
                        child: Container(
                            width: 60,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Center(
                              child: Text(
                                "LUN",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: (selected == 1)
                                        ? Colors.purple.shade800
                                        : Colors.black),
                              ),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          selected = 1;
                          print(selected);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      child: Card(
                        elevation: (selected == 2) ? 7 : 0,
                        child: Container(
                            width: 60,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Center(
                              child: Text(
                                "MAR",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: (selected == 2)
                                        ? Colors.purple.shade800
                                        : Colors.black),
                              ),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          selected = 2;
                          print(selected);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      child: Card(
                        elevation: (selected == 3) ? 7 : 0,
                        child: Container(
                            width: 60,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Center(
                              child: Text(
                                "MER",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: (selected == 3)
                                        ? Colors.purple.shade800
                                        : Colors.black),
                              ),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          selected = 3;
                          print(selected);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      child: Card(
                        elevation: (selected == 4) ? 7 : 0,
                        child: Container(
                            width: 60,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Center(
                              child: Text(
                                "JEU",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: (selected == 4)
                                        ? Colors.purple.shade800
                                        : Colors.black),
                              ),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          selected = 4;
                          print(selected);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      child: Card(
                        elevation: (selected == 5) ? 7 : 0,
                        child: Container(
                            width: 60,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Center(
                              child: Text(
                                "VEN",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: (selected == 5)
                                        ? Colors.purple.shade800
                                        : Colors.black),
                              ),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          selected = 5;
                          print(selected);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      child: Card(
                        elevation: (selected == 6) ? 7 : 0,
                        child: Container(
                            width: 60,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Center(
                              child: Text(
                                "SAM",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: (selected == 6)
                                        ? Colors.purple.shade800
                                        : Colors.black),
                              ),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          selected = 6;
                          print(selected);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      child: Card(
                        elevation: (selected == 7) ? 7 : 0,
                        child: Container(
                            width: 60,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Center(
                              child: Text(
                                "DIM",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: (selected == 7)
                                        ? Colors.purple.shade800
                                        : Colors.black),
                              ),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          selected = 7;
                          print(selected);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  
                  Card(
                    child: Container(
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 10,
                            decoration: BoxDecoration(
                                color: (selected == 2 ||
                                        selected == 1 ||
                                        selected == 4 ||
                                        selected == 6)
                                    ? Colors.red[400]
                                    : Colors.blue[400],
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                          ),
                          Expanded(
                            child: Container(
                                child: ListTile(
                              title: (selected == 1 ||
                                      selected == 4 ||
                                      selected == 6)
                                  ? Text("Apprendre Flutter")
                                  : Text("Preparer"),
                              subtitle: (selected == 1 ||
                                      selected == 4 ||
                                      selected == 6)
                                  ? Text("Nouveau Framwork")
                                  : Text("Nouvelle recette"),
                              trailing: (selected == 1 ||
                                      selected == 6 ||
                                      selected == 6)
                                  ? Text("16h00")
                                  : Text("19h10"),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Divider(),
                  ),
                  Card(
                    child: Container(
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 10,
                            decoration: BoxDecoration(
                                color: (selected == 1 ||
                                        selected == 4 ||
                                        selected == 6)
                                    ? Colors.blue[400]
                                    : Colors.green[400],
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                          ),
                          Expanded(
                              child: Container(
                            child: ListTile(
                              title: (selected == 1 ||
                                      selected == 4 ||
                                      selected == 6)
                                  ? Text("Jouer au foot")
                                  : Text("Musclution"),
                              subtitle: (selected == 1 ||
                                      selected == 4 ||
                                      selected == 6)
                                  ? Text("sport decontractant")
                                  : Text("RDV en Salle de GYM"),
                              trailing: (selected == 1 ||
                                      selected == 4 ||
                                      selected == 6)
                                  ? Text("12h00")
                                  : Text("08h15"),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
