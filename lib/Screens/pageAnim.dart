import 'package:flutter/cupertino.dart';
class Rebon extends PageRouteBuilder{
  final Widget widget;
  Rebon({this.widget}): super(

    
                            transitionDuration: Duration(seconds:1 ),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secanimation,
                                Widget chid) {
                                  animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                                  return ScaleTransition(
                                    alignment: Alignment.center,
                                    scale:animation,
                                  child: chid,

                                   );
                                },
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secanimation) {
                              return widget;
                            });

  
}