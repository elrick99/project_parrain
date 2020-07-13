import 'package:flutter/material.dart';
import 'package:project_parrain/Providers/Events.dart';
import 'package:project_parrain/Screens/Home.dart';
import 'package:project_parrain/Screens/HomePageClickedEvent.dart';
import 'package:project_parrain/Screens/OngoingTask.dart';
import 'package:project_parrain/Screens/PriorityTask.dart';
import 'package:project_parrain/Screens/Taskcancelled.dart';
import 'package:project_parrain/Screens/Taskperformed.dart';
import 'package:project_parrain/Screens/accueil.dart';
import 'package:project_parrain/Screens/connexion.dart';
import 'package:project_parrain/Screens/create.dart';

import 'package:project_parrain/Screens/homePage.dart';
import 'package:project_parrain/Screens/inscription.dart';
import 'package:project_parrain/Screens/sideBar.dart';
import 'package:project_parrain/Screens/sideBarLayout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: ProEvent())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter d',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        home: OuvertureApp(),
        routes: {
          "newTasks": (context) => NewTasks(),
          "ongoingTask": (context) => OngoingTask()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
