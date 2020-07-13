import 'package:flutter/cupertino.dart';

class ProEvent with ChangeNotifier {
  List<Events> _event = [];

  List<Events> get item => [..._event];

  void getEnvent(
      String title, String date, String time, String timing, Color priority) {
    print(title);
    print(date);
    print(time);
    print(timing);
    print(priority);

    Events eventi = Events(
        title: title,
        date: date,
        time: time,
        timing: timing,
        priority: priority);
    _event.add(eventi);
    
    notifyListeners();
    print(_event.length);
  }
}

class Events {
  final String title;
  final String date;
  final String time;
  final String timing;
  final Color priority;

  Events(
      {this.title,
      this.date,
      this.time,
      this.timing,
      this.priority});
}
