import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({Key key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  // priorité
  Color urgent = Colors.red;
  Color important = Colors.green;
  Color moins = Colors.blue;
  Color priorite = Colors.green;
  String title;
  String timing;

  //rapelle
  static const menuItems = <String>[
    '15min avant',
    '30min avant',
    '1heure avant',
    '2heures avant',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = '15min avant';
  String _btn2SelectedVal;
  String _btn3SelectedVal;

  //heure
  var dateofday = " Date de la tache ";
  var heureofday = " Heure de la tache";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        title: Text(
          "Nouvelle tache",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.purple.shade800.withOpacity(0.5),
                          ),
                          labelText: "Nom de tache",
                          hintText: 'Veuillez entrer le nom de la tache'),
                      onChanged: (String val) {
                        title = val;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Date :",
                          style: TextStyle(
                              color: Colors.purple.shade800,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 70,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              dateofday,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            Icon(
                              Icons.today,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime(2025),
                      ).then((DateTime value) {
                        if (value != null) {
                          setState(() {
                            dateofday =
                                " ${value.year.toString()}/${value.month.toString().padLeft(2, "0")}/${value.day.toString()} ";
                            print(dateofday);
                          });
                        }
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Heure :",
                          style: TextStyle(
                              color: Colors.purple.shade800,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 70,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              heureofday,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            Icon(
                              Icons.access_time,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      DateTime now = DateTime.now();
                      showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay(hour: now.hour, minute: now.minute),
                      ).then((TimeOfDay value) {
                        if (value != null) {
                          setState(() {
                            heureofday =
                                " ${value.hour.toString()}h:${value.minute.toString().padLeft(2, "0")}min";
                          });
                        }
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Priorité :",
                          style: TextStyle(
                              color: Colors.purple.shade800,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Urgent",
                          style: TextStyle(
                            color: Colors.purple.shade800,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              priorite = important;
                            });
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              border: (priorite == important)
                                  ? Border.all(color: Colors.black, width: 2)
                                  : Border(),
                              shape: BoxShape.circle,
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Important",
                          style: TextStyle(
                            color: Colors.purple.shade800,
                            fontWeight: (priorite == important)
                                ? FontWeight.bold
                                : null,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              priorite = moins;
                            });
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              border: (priorite == moins)
                                  ? Border.all(color: Colors.black, width: 2)
                                  : Border(),
                              shape: BoxShape.circle,
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Moins important",
                          style: TextStyle(
                              color: Colors.purple.shade800,
                              fontSize: 17,
                              fontWeight:
                                  (priorite == moins) ? FontWeight.bold : null),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Rappel :",
                          style: TextStyle(
                              color: Colors.purple.shade800,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        DropdownButton<String>(
                          // Must be one of items.value.
                          value: _btn1SelectedVal,
                          onChanged: (String newValue) {
                            setState(() {
                              _btn1SelectedVal = newValue;
                              timing = _btn1SelectedVal;
                            });
                          },
                          items: this._dropDownMenuItems,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                  // provider.getEnvent(
                  //     title, dateofday, heureofday, timing, priorite);
                },
                    child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade800,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Enregistrer",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
