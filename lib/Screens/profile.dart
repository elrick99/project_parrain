import 'package:project_parrain/Screens/sideBar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
   final String moncompte;
   Profile({this.moncompte});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        title:Text(
          widget.moncompte,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white
          ),
        ),
      ),
      
      body: Column(
          children: <Widget>[
            Expanded(child:
            Container(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.blue,
            backgroundImage:AssetImage("images/fem4.jpg")
          ),
          SizedBox(height: MediaQuery.of(context).size.height/30,),
          Text("Domi chelida",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21),)
        ],
      ),
            )),
           
            Expanded(
        child: Container(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black,width: 1)
                )
            ),
            child: ListTile(
              leading: Icon(Icons.settings,color: Colors.black,),
              title: Text("Paramètre",style: TextStyle(color: Colors.black,fontSize: 19),),
              trailing: Icon(Icons.arrow_forward_ios,size: 23,color: Colors.black,),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black,width: 1)
                )
            ),
            child: ListTile(
              leading: Icon(Icons.person,color: Colors.black,),
              title: Text("Deconnexion",style: TextStyle(color: Colors.black,fontSize: 19),),
              trailing: Icon(Icons.arrow_forward_ios,size: 23,color: Colors.black,),
            ),
          ),
        ],
      ),
            )),
          ],
        ),
    );
  }
}
