import 'package:flutter/material.dart';

class AccueilApp extends StatefulWidget {
  @override
  _AccueilAppState createState() => _AccueilAppState();
}

class _AccueilAppState extends State<AccueilApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white60,
          child: Column(
            children: <Widget>[
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.purple.shade800,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(100))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 250,
                          width: 250,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(100))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Remenber",
                                  style: TextStyle(
                                      color: Colors.purple.shade800,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                              SizedBox(width: 20),
                              Icon(Icons.edit,
                                  color: Colors.purple.shade800, size: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Icon(
                        Icons.watch_later,
                        color: Colors.white,
                        size: 100,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                    SizedBox(height: 20),
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
                          "Inscription",
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
            ],
          ),
        ),
      ),
    );
  }
}
