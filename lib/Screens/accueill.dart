import 'package:flutter/material.dart';
import '../animation/fadeanimation.dart';

class Accueill extends StatelessWidget {
  final String accueil;
  Accueill({this.accueil});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notification_important, color: Colors.white,), onPressed: () {})
        ],
      ),
      
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // color: Colors.purple.shade800,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: <Widget>[
                      FadeAnimation(1.2 ,Text(
                        "Bonjour Domi",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                     FadeAnimation(1.4, Container(
                        child: Text(
                          "Ne manquez pas vos prochains rendez-vous",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                     )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: <Widget>[
                  FadeAnimation(1.6,  Text(
                      "Aujourd'hui",
                      style: TextStyle(
                          color: Colors.purple.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )
                  ],
                ),
                SizedBox(height: 25),
               FadeAnimation(1.8, Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
               ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FadeAnimation(1.8 ,Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      )
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: FadeAnimation(1.9, Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      )
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      // body: SafeArea(
      //   child: Stack(
      //     fit: StackFit.expand,
      //     children: <Widget>[
      //       FractionallySizedBox(
      //         alignment: Alignment.topCenter,
      //         child: Container(
      //           color: Colors.purple.shade800,
      //           child:Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: <Widget>[
      //               Expanded(
      //                     child:Container(
      //                      child: Row(
      //                        crossAxisAlignment: CrossAxisAlignment.start,
      //                        children: <Widget>[
      //                         Expanded(
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Container(
      //                             height: 130,
      //                             width: 50,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(20),
      //                               color:Colors.green
      //                             ) ,
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                               children: <Widget>[
      //                                 Container(
      //                                   child: Text("Total Tache",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 20,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 ),
      //                                    Container(
      //                                   child: Text("6",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 30,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 )

      //                               ],
      //                             ),
      //                             ),
      //                           )
      //                           ),
      //                            Expanded(
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Container(
      //                             height: 130,
      //                             width: 50,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(20),
      //                               color:Colors.blue
      //                             ) ,
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                               children: <Widget>[
      //                                 Container(
      //                                   child: Text("Total Tache",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 20,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 ),
      //                                    Container(
      //                                   child: Text("6",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 30,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 )

      //                               ],
      //                             ),
      //                             ),
      //                           )
      //                           ),
      //                            Expanded(
      //                           child: Container(
      //                           height: 130,
      //                           width: 50,
      //                           decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.circular(20),
      //                             color:Colors.orange
      //                           ) ,
      //                           child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                               children: <Widget>[
      //                                 Container(
      //                                   child: Text("Total Tache",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 20,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 ),
      //                                    Container(
      //                                   child: Text("6",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 30,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 )

      //                               ],
      //                             ),
      //                           )
      //                           ),
      //                             ],
      //                           ),
      //                          ),
      //                     ),
      //                     Expanded(
      //                       flex: 3,
      //                     child:Container(
      //                      child: Row(
      //                        mainAxisAlignment: MainAxisAlignment.start,
      //                        crossAxisAlignment: CrossAxisAlignment.start,
      //                        children: <Widget>[
      //                            Expanded(
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Container(
      //                             height: 150,
      //                             width: 50,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(20),
      //                               color:Colors.red
      //                             ) ,
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                               children: <Widget>[
      //                                 Container(
      //                                   child: Text("Total Tache",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 30,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 ),
      //                                    Container(
      //                                   child: Text("6",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 30,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 )

      //                               ],
      //                             ),
      //                             ),
      //                           )
      //                           ),
      //                            Expanded(
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Container(
      //                             height: 150,
      //                             width: 50,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(20),
      //                               color:Colors.pink,
      //                             ) ,
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                               children: <Widget>[
      //                                 Container(
      //                                   child: Text("Total Tache",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 30,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 ),
      //                                    Container(
      //                                   child: Text("6",
      //                                    style:TextStyle(
      //                                      color: Colors.white,
      //                                      fontSize: 30,
      //                                      fontWeight: FontWeight.bold
      //                                    ) ,),
      //                                 )

      //                               ],
      //                             ),
      //                             ),
      //                           )
      //                           ),
      //                             ],
      //                           ),
      //                          ),
      //                     ),
      //             ],
      //           ),
      //         ),
      //       ),
      // FractionallySizedBox(
      //   heightFactor: .4,
      //   alignment: Alignment.bottomCenter,
      //   child: Container(
      //     decoration:BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //         topLeft:Radius.circular(35),
      //         topRight: Radius.circular(35),
      //       ),
      //       color: Colors.white
      //     ) ,
      //     child: Column(
      //       children: <Widget>[
      //         Container(
      //          padding: const EdgeInsets.all(20),
      //          alignment: Alignment.centerLeft,
      //          child: Text("Diagramme des taches",
      //          style: TextStyle(
      //            fontWeight: FontWeight.bold,
      //            fontSize: 30
      //          ),
      //          ),
      //         ),

      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: <Widget>[
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 50,
      //                 width: 5,
      //                 color: Colors.green,
      //               ),
      //             ),
      //                Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 70,
      //                 width: 5,
      //                 color: Colors.blue,
      //               ),
      //             ),
      //                Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 50,
      //                 width: 5,
      //                 color: Colors.orange,
      //               ),
      //             ),
      //                Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 100,
      //                 width: 5,
      //                 color: Colors.red,
      //               ),
      //             ),
      //                   Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 110,
      //                 width: 5,
      //                 color: Colors.pink,
      //               ),
      //             ),
      //           ],
      //         )
      //       ],
      //     ),
      //     ),
      // )
      //     ],
      //   ),
      // ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.purple.shade800,
          borderRadius: BorderRadius.circular(100)
        ),
        child: IconButton(icon: Icon(Icons.add, color:Colors.white), onPressed: (){
          Navigator.pushNamed(context, "newTasks");
        }),
      ),
    );
  }
}
