import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notification_important), onPressed: (){})
        ],
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              child: Container( 
                color: Colors.purple.shade800, 
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                          child:Container(
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                  height: 130,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Colors.green
                                  ) ,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Total Tache",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      ),
                                         Container(
                                        child: Text("6",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 30,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      )

                                    ],
                                  ),
                                  ),
                                ) 
                                ),
                                 Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                  height: 130,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Colors.blue
                                  ) ,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Total Tache",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      ),
                                         Container(
                                        child: Text("6",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 30,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      )

                                    ],
                                  ),
                                  ),
                                ) 
                                ),
                                 Expanded(
                                child: Container(
                                height: 130,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:Colors.orange
                                ) ,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Total Tache",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      ),
                                         Container(
                                        child: Text("6",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 30,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      )

                                    ],
                                  ),
                                ) 
                                ),
                                  ],
                                ),
                               ),
                          ),
                          Expanded(
                            flex: 3,
                          child:Container(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                 Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                  height: 150,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Colors.red
                                  ) ,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Total Tache",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 30,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      ),
                                         Container(
                                        child: Text("6",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 30,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      )

                                    ],
                                  ),
                                  ),
                                ) 
                                ),
                                 Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                  height: 150,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Colors.pink,
                                  ) ,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Total Tache",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 30,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      ),
                                         Container(
                                        child: Text("6",
                                         style:TextStyle(
                                           color: Colors.white,
                                           fontSize: 30,
                                           fontWeight: FontWeight.bold
                                         ) ,),
                                      )

                                    ],
                                  ),
                                  ),
                                ) 
                                ),
                                  ],
                                ),
                               ),
                          ),
                  ],
                ),        
              ),
            ),
      FractionallySizedBox(
        heightFactor: .4,
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration:BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            color: Colors.white
          ) ,
          child: Column(
            children: <Widget>[
              Container(
               padding: const EdgeInsets.all(20),
               alignment: Alignment.centerLeft,
               child: Text("Diagramme des taches",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 30
               ),
               ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 5,
                      color: Colors.green,
                    ),
                  ),
                     Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: 5,
                      color: Colors.blue,
                    ),
                  ),
                     Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 5,
                      color: Colors.orange,
                    ),
                  ),
                     Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 5,
                      color: Colors.red,
                    ),
                  ),
                        Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 110,
                      width: 5,
                      color: Colors.pink,
                    ),
                  ),
                ],
              )
            ],
          ),
          ),
      )
          ],
        ),
      ),
      
    );
  }
}