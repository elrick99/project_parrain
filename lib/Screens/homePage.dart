
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_parrain/Screens/sideBar.dart';
import 'package:project_parrain/Screens/sideBarLayout.dart';
import '../animation/fadeanimation.dart';
import 'homp.dart';


class OuvertureApp extends StatefulWidget {
  @override
  _OuvertureAppState createState() => _OuvertureAppState();
}

class _OuvertureAppState extends State<OuvertureApp> with TickerProviderStateMixin{
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double>_scaleAnimation;
  Animation<double>_scale2Animation;
  Animation<double>_widthAnimation;
  Animation<double>_positionAnimation;

  bool hideIcon= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController = AnimationController(
      vsync: this ,
      duration: Duration(milliseconds: 300)
      );
      _scaleAnimation = Tween<double>(
        begin: 1.0, end: 0.8)
        .animate(_scaleController)..addStatusListener((status){
          if(status == AnimationStatus.completed){
       _widthController.forward();
          }
        });

        _widthController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 600),
          
          );

        _widthAnimation = Tween<double>(
          begin: 80.0,
          end: 300.0).animate(_widthController)..addStatusListener((status){
          if(status == AnimationStatus.completed){
      _positionController.forward();
          }
        });

        _positionController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 1000),
          );

           _positionAnimation = Tween<double>(
          begin: 0.0,
          end: 215.0).animate(_positionController)..addStatusListener((status){
             if(status == AnimationStatus.completed){
               setState(() {
                 hideIcon=true;
               });
               _scale2Controller.forward();
             }
            });
           
           _scale2Controller=  AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 1000),
          );

          _scale2Animation= Tween<double> (
            begin:1.0 ,
            end: 32.0
            ).animate( _scale2Controller)..addStatusListener((status){
             if(status == AnimationStatus.completed){
              Navigator.pushReplacement(context,
                  //faire la transition sur une autre page
                  PageTransition(type: PageTransitionType.fade, child:Homp() )
              );
             }

            });
            }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),

      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            // Positioned(
            //   top: -50,
            //   left: 0,
            //   child:FadeAnimation(1, Container(
            //       width: width,
            //       height: 400,
            //       decoration: BoxDecoration(
            //         image:DecorationImage(image:  AssetImage('images/eau.png'),fit: BoxFit.cover)
            //       ),
            //   )
            //   )
            // ),
            //        Positioned(
            //   top: -100,
            //   left: 0,
            //   child: FadeAnimation(1.3, Container(
            //       width: width,
            //       height: 400,
            //       decoration: BoxDecoration(
            //         image:DecorationImage(image:  AssetImage('eau/fond.jpg'),fit: BoxFit.cover)
            //       ),
            //   )
            //   )
            // ),
            //        Positioned(
            //   top: -150,
            //   left: 0,
            //   child: FadeAnimation(1.6, Container(
            //       width: width,
            //       height: 400,
            //       decoration: BoxDecoration(
            //         image:DecorationImage(image:  AssetImage('images/eau.png'),fit: BoxFit.cover)
            //       ),
            //   )
            //   )
            // ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, 
                  Text("BIENVENU", 
                  style: TextStyle(
                      color: Colors.purple.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                  ),
                  ),
                  ),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("bienvenu sur Agendux veilliez entrez votre identifiant et votre mot de passe ",
                  style:TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(.7), height: 1.4
                    ),
                  ),
                  ),
                  SizedBox(height: 100,),
                  FadeAnimation(1.6, AnimatedBuilder(
                   animation: _scaleController,
                   builder:(context, child)=>Transform.scale(
                     scale: _scaleAnimation.value,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _widthController,
                        builder: (context, child)=>
                         Container(
                          
                         width: _widthAnimation.value,
                         height: 80,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                           color: Colors.purple.withOpacity(.4)
                         ),
                         child: InkWell(
                           onTap: (){
                             _scaleController.forward();
                           },
                           child: Stack(
                             children: <Widget>[
                               AnimatedBuilder(
                                 animation: _positionController,
                                builder: (context, child)=>Positioned(
                                    left: _positionAnimation.value,
                                    top: 3,
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: AnimatedBuilder(
                                   animation: _scale2Controller,
                                   builder: (context, child)=>Transform.scale(
                                     scale: _scale2Animation.value, 
                                     child: Container(
                                     height: 60,
                                     width: 60,
                                     decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       color: Colors.purple.shade800
                                     ),
                                     child: hideIcon==false? Icon(Icons.arrow_forward, color: Colors.white,) :Container(),
                                   ),
                                   ),
                                 ),
                               ),
                                ),
                                ),                          
                             ],
                            
                           ),
                         ),
                        ),
                      ),
                      ),
                   )
                  ),
                    ),
                    SizedBox(height: 60,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}