import 'package:flutter/material.dart';

class Homp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("images/o.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.purple.shade800.withOpacity(0.5), BlendMode.darken),
            )),
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
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 100),
              width: 250,
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white)),
              child: Text(
                "Connexion",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40),
              width: 200,
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white)),
              child: Text(
                "Inscription",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140, left: 90),
              child: Text(
                "Géré vos activités en toute simplicité",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
