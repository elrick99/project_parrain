import 'package:flutter/material.dart';

class ConnexionS extends StatefulWidget {
  @override
  _ConnexionSState createState() => _ConnexionSState();
}

class _ConnexionSState extends State<ConnexionS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.purple.shade800,
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                padding: EdgeInsets.only(top: 100, left: 50),
                width: MediaQuery.of(context).size.width,
                child: Text("Connexion",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ),
              Container(
                height: 570,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1, color: Colors.purple.shade800),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nom",
                              hintStyle:
                                  TextStyle(color: Colors.purple.shade800),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1, color: Colors.purple.shade800),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Mot de passe",
                              hintStyle:
                                  TextStyle(color: Colors.purple.shade800),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 1, color: Colors.purple.shade800),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Confirmer mot de passe",
                              hintStyle:
                                  TextStyle(color: Colors.purple.shade800),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'inscr');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade800,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Connexion",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
