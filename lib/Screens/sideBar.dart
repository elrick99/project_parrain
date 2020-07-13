import 'dart:async';

import 'package:project_parrain/Screens/PriorityTask.dart';
import 'package:project_parrain/Screens/Taskcancelled.dart';
import 'package:project_parrain/Screens/Taskperformed.dart';
import 'package:project_parrain/Screens/profile.dart';
import 'package:project_parrain/Screens/regalge.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';

import 'menuItem.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> istrueStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final bool istrue = false;
  final _animateDuration = const Duration(microseconds: 700);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animateDuration);
    istrueStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = istrueStreamController.stream;
    isSidebarOpenedSink = istrueStreamController.sink;
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    istrueStreamController.close();
    isSidebarOpenedSink.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animateDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data
              ? 0
              : -MediaQuery.of(context).size.width,
          right: isSideBarOpenedAsync.data
              ? 0
              : MediaQuery.of(context).size.width - 30,
          child: Row(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                                  child: Container(
                    color: Colors.purple.shade800,
                  height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        ListTile(
                            leading: CircleAvatar(
                              
                              backgroundImage:AssetImage("images/fem4.jpg"),
                              radius: 40,
                            ),
                            title: Text(
                              "Chelida ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              "chelida@gmail.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "ongoingTask");
                          },
                          child: MenuItem(
                            icon: Icons.replay,
                            title: "Tache en cours",
                          ),
                        ),
                        Divider(
                          height: 6,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TaskPerformed()));
                          },
                          child: MenuItem(
                            icon: (FontAwesomeIcons.walking),
                            title: "Tache Effectué",
                          ),
                        ),
                        Divider(
                          height: 6,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TaskCancelled()));
                          },
                          child: MenuItem(
                            icon: Icons.person,
                            title: "Tâche Raté ",
                          ),
                        ),
                        Divider(
                          height: 6,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PriorityTask()));
                          },
                          child: MenuItem(
                            icon: Icons.notification_important,
                            title: "Priorite",
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        InkWell(
                          onTap: () {
                            SideBar reglage;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Setings(reglage)));
                          },
                          child: MenuItem(
                            icon: Icons.settings,
                            title: "Reglage",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                          moncompte: "Mon compte",
                                        )));
                          },
                          child: MenuItem(
                            icon: Icons.person,
                            title: "Mon compte",
                          ),
                        ),
                        // MenuItem(
                        //   icon: Icons.person,
                        //   title: "Deconnexion",
                        // ),
                        
                        
                         
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.purple.shade800,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     onIconPressed();
                  //   },
                  //   child: ClipPath(
                  //     clipper: CustomMenuClipper(),
                  //     child:
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// import 'dart:async';

// import 'package:bloc_provider/bloc_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';

// import 'package:rxdart/rxdart.dart';

// //import '../bloc.navigation_bloc/navigation_bloc.dart';
// import '../screem/navigation_bloc.dart';
// import '../screem/menuItem.dart';
// import 'navigation_bloc.dart';

// class SideBar extends StatefulWidget {
//   @override
//   _SideBarState createState() => _SideBarState();

// }

// class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
//   AnimationController _animationController;
//   StreamController<bool> isSidebarOpenedStreamController;
//   Stream<bool> isSidebarOpenedStream;
//   StreamSink<bool> isSidebarOpenedSink;
//   final _animationDuration = const Duration(milliseconds: 500);

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(vsync: this, duration: _animationDuration);
//     isSidebarOpenedStreamController = PublishSubject<bool>();
//     isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
//     isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     isSidebarOpenedStreamController.close();
//     isSidebarOpenedSink.close();
//     super.dispose();
//   }

//   void onIconPressed() {
//     final animationStatus = _animationController.status;
//     final isAnimationCompleted = animationStatus == AnimationStatus.completed;

//     if (isAnimationCompleted) {
//       isSidebarOpenedSink.add(false);
//       _animationController.reverse();
//     } else {
//       isSidebarOpenedSink.add(true);
//       _animationController.forward();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return StreamBuilder<bool>(
//       initialData: false,
//       stream: isSidebarOpenedStream,
//       builder: (context, isSideBarOpenedAsync) {
//         return AnimatedPositioned(
//           duration: _animationDuration,
//           top: 0,
//           bottom: 0,
//           left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
//           right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   color: const Color(0xFF262AAA),
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(
//                         height: 100,
//                       ),
//                       ListTile(
//                         title: Text(
//                           "Prateek",
//                           style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
//                         ),
//                         subtitle: Text(
//                           "www.techieblossom.com",
//                           style: TextStyle(
//                             color: Color(0xFF1BB5FD),
//                             fontSize: 18,
//                           ),
//                         ),
//                         leading: CircleAvatar(
//                           child: Icon(
//                             Icons.perm_identity,
//                             color: Colors.white,
//                           ),
//                           radius: 40,
//                         ),
//                       ),
//                       // Divider(
//                       //   height: 64,
//                       //   thickness: 0.5,
//                       //   color: Colors.white.withOpacity(0.3),
//                       //   indent: 32,
//                       //   endIndent: 32,
//                       // ),
//                       // MenuItem(
//                       //   icon: Icons.home,
//                       //   title: "Home",
//                       //   onTap: () {
//                       //     onIconPressed();
//                       //     BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
//                       //   },
//                       // ),
//                       // MenuItem(
//                       //   icon: Icons.person,
//                       //   title: "My Account",
//                       //   onTap: () {
//                       //     onIconPressed();
//                       //     BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
//                       //   },
//                       // ),
//                       // MenuItem(
//                       //   icon: Icons.shopping_basket,
//                       //   title: "My Orders",
//                       //   onTap: () {
//                       //     onIconPressed();
//                       //     BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
//                       //   },
//                       // ),
//                       // MenuItem(
//                       //   icon: Icons.card_giftcard,
//                       //   title: "Wishlist",
//                       // ),
//                       // Divider(
//                       //   height: 64,
//                       //   thickness: 0.5,
//                       //   color: Colors.white.withOpacity(0.3),
//                       //   indent: 32,
//                       //   endIndent: 32,
//                       // ),
//                       // MenuItem(
//                       //   icon: Icons.settings,
//                       //   title: "Settings",
//                       // ),
//                       // MenuItem(
//                       //   icon: Icons.exit_to_app,
//                       //   title: "Logout",
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment(0, -0.9),
//                 child: Container(
//                       width: 35,
//                       height: 110,
//                       color: Color(0xFF262AAA),
//                       // alignment: Alignment.centerLeft,
//                       // child: AnimatedIcon(
//                       //   progress: _animationController.view,
//                       //   icon: AnimatedIcons.menu_close,
//                       //   color: Color(0xFF1BB5FD),
//                       //   size: 25,
//                       // ),
//                     ),
//                 // GestureDetector(
//                 //   onTap: () {
//                 //     onIconPressed();
//                 //   },
//                 //   child: ClipPath(
//                 //     clipper: CustomMenuClipper(),
//                 //     child:
//                 //   ),
//                 // ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class CustomMenuClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Paint paint = Paint();
//     paint.color = Colors.white;

//     final width = size.width;
//     final height = size.height;

//     Path path = Path();
//     path.moveTo(0, 0);
//     path.quadraticBezierTo(0, 8, 10, 16);
//     path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
//     path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
//     path.quadraticBezierTo(0, height - 8, 0, height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
