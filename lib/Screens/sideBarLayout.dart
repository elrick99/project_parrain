// import 'package:aidetache/screem/navigation_bloc.dart';
// import 'package:flutter/material.dart';
// //import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc_provider/bloc_provider.dart';
// import '../screem/navigation_bloc.dart';
// import 'sidebar.dart';
// import 'navigation_bloc.dart';
// class SideBarLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider<NavigationBloc>(
//         create: (context) => NavigationBloc(),
//         child: Stack(
//           children: <Widget>[
//             BlocBuilder<NavigationBloc, NavigationStates>(
//               builder: (context, navigationState) {
//                 return navigationState as Widget;
//               },
//             ),
//             SideBar(),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:project_parrain/Screens/HomePageClickedEvent.dart';
import 'package:project_parrain/Screens/accueill.dart';
import 'package:project_parrain/Screens/sideBar.dart';
import 'package:flutter/material.dart';

class SideBarLayou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Accueill(),
          SideBar()
        ],
        
      ),
    );
  }
}