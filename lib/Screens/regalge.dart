import 'package:project_parrain/Screens/sideBar.dart';
import 'package:flutter/material.dart';

class Setings extends StatefulWidget {
  final SideBar reglage;
  Setings(this.reglage);

  @override
  _SetingsState createState() => _SetingsState();
}

class _SetingsState extends State<Setings> {
  bool switchVal = true;
  bool switchVal1 = true;
  bool switchVal2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        title: Text(
          "Parametre",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Style",
                      style: TextStyle(
                          color: Colors.purple.shade800,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Numérique",
                      style: TextStyle(fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Divider(
                        color: Colors.black54,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, top: 10),
                child: Text(
                  "Liste des evenements",
                  style: TextStyle(color: Colors.purple.shade800, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Urgent"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Important"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Moins Important"),
                  ],
                ),
              ),
              Divider(
                color: Colors.black54,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Notification",
                      style: TextStyle(
                          color: Colors.purple.shade800, fontSize: 22),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Activer",
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                        value: switchVal1,
                        onChanged: (bool value) {
                          setState(() => this.switchVal1 = value);
                        })
                  ],
                ),
              ),
              Divider(
                color: Colors.black54,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Afficher l'heure avec les seconde",
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                        value: switchVal,
                        onChanged: (bool value) {
                          setState(() => this.switchVal = value);
                        })
                  ],
                ),
              ),
              Divider(
                color: Colors.black54,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Modifier la date et l'heure ",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Alarmes",
                      style: TextStyle(
                          color: Colors.purple.shade800,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Arreter la sonnerie Apres ",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "10 minutes ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Divider(
                  color: Colors.black54,
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Mode vibreur",
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                        value: switchVal2,
                        onChanged: (bool value) {
                          setState(() => this.switchVal2 = value);
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Divider(
                  color: Colors.black54,
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Premier jour de la semaine",
                      style: TextStyle(
                          fontSize: 18, color: Colors.purple.shade800),
                    ),
                    Text(
                      "lundi ",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Minuteurs",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Divider(
                        color: Colors.black54,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Aides",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black54,
                      height: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
