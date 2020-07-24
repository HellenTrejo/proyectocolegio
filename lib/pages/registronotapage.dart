import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyectocolegio/Widgets/FormRegistro.dart';



class RegistroNota extends StatefulWidget {
  @override
  _RegistroNotaState createState() => _RegistroNotaState();
}

class _RegistroNotaState extends State<RegistroNota> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Registro de nota', style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF25002E),
          iconTheme: IconThemeData(
              color: Colors.white, //change your color here
          ),
        ),
        backgroundColor: Colors.white,
        
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit:StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5.0, right: 30),
                  //child: Image.asset("assets/regnota.jpg", width: 180,),
                  ),
                  Expanded(
                    child: Container(
                    ),
                    ),
                    Image.asset("assets/image_02.png")
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left:28.0, right: 28.0, top: 8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[

                         Image.asset(
                          "assets/examen.png",
                          width: ScreenUtil.getInstance().setWidth(150),
                          height: ScreenUtil.getInstance().setHeight(150),
                        ),
                        /* Text("COLE", 
                          style: TextStyle(
                            fontFamily: "Poppins-Bold",
                            fontSize: ScreenUtil.getInstance().setSp(40),
                            color: Color(0xFF280042),
                            letterSpacing: .6,
                            fontWeight: FontWeight.bold)) */ 
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(10),
                    ),
                    FormRegistro(),   //VIENE DE LA CARPETA WIDGETS FormCard                   
                    SizedBox(height: ScreenUtil.getInstance().setHeight(50)),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 12.0,
                            ),
                            //
                            
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      child: Container(
                        width: ScreenUtil.getInstance().setWidth(330),
                        height: ScreenUtil.getInstance().setHeight(100),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF520082),
                              Color(0xFF25002E)
                            ]
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF25002E).withOpacity(.3),
                              offset: Offset(0.0, 8.0),
                              blurRadius: 8.0
                            )
                          ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                                                    
                            },//Creo que aquí se añade el metodo
                            child: Center(
                              child: Text("GUARDAR", style: TextStyle(color: Colors.white,
                              fontFamily: "Poppins-Bold",
                              fontSize: 18,
                              letterSpacing: 1.0
                              )),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    
    );
  }
}