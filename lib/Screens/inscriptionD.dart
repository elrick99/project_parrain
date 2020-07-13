import 'package:flutter/material.dart';

import 'pageAnim.dart';
import 'sideBarLayout.dart';

class InscriptionD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("images/o.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.purple.shade800.withOpacity(0.5), BlendMode.darken),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    "Remenber",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 39,
                        fontFamily: "billabong"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: Icon(
                        Icons.person,
                        color: Colors.purple.shade800.withOpacity(0.6),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white, width: 1)),
                      width: 230,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nom",
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: Icon(
                        Icons.email,
                        color: Colors.purple.shade800.withOpacity(0.6),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white, width: 1)),
                      width: 230,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: Icon(
                        Icons.phone,
                        color: Colors.purple.shade800.withOpacity(0.6),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white, width: 1)),
                      width: 230,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Numero",
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: Icon(
                        Icons.visibility_off,
                        color: Colors.purple.shade800.withOpacity(0.6),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white, width: 1)),
                      width: 230,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'confidentialite');
                  },
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, Rebon(widget: SideBarLayou()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 80),
                      width: 140,
                      height: 56,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "Inscription",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("images/F.jpg"),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/I.jpg"),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/L.jpg"),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/t.jpg"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
