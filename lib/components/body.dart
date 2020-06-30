import 'package:flutter/material.dart';
import '../components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;//ancho y largo total de la pantalla
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("BIENVENIDO A COLE",
           style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins-Bold",
              fontSize: 23,
              color: Color(0xFF25002E),
              letterSpacing: .6),
          ),
          SizedBox(height: size.height * 0.1),
          Image.asset("assets/chat.png",
          height: size.height * 0.6,),
        ],
      ),
    );
  }
}

