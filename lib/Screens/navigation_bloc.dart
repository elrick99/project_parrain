// import 'package:aidetache/screem/HomePageClickedEvent.dart';
// import 'package:bloc/bloc.dart';


// enum NavigationEvents {
//   HomePageClickedEvent,
//   MyAccountClickedEvent,
//   MyOrdersClickedEvent,
// }

// abstract class NavigationStates {}

// class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
//   NavigationBloc(NavigationStates initialState) : super(initialState);

//   @override
//   NavigationStates get initialState => HomePage();

//   @override
//   Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
//     switch (event) {
//       case NavigationEvents.HomePageClickedEvent:
//         yield HomePage();
//         break;
//       case NavigationEvents.MyAccountClickedEvent:
//         yield HomePage();
//         break;
//       case NavigationEvents.MyOrdersClickedEvent:
//         yield HomePage();
//         break;
//     }
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//   }
// }

// class MyAccountsPage {
// }