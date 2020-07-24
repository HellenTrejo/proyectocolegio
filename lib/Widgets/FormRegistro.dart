import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormRegistro extends StatefulWidget {
  @override
  _FormRegistroState createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(800),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 15.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 36.0, right: 36.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
             Text("Nota",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(5),
            ),
            Text("Curso",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              enabled: false,
              //keyboardType: TextInputType.number,
              /* inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(8),
              ], */
              decoration: InputDecoration(
                  hintText: "curso",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Text("Alumno",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                  hintText: "alumno 1",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ), 
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Text("Evaluación",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                  hintText: "Practica 1",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Text("Nota",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              
              decoration: InputDecoration(
                  hintText: "Ingrese la nota",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ), 
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
          ],
        ),
      ),
    );
  }
}
