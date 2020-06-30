import 'package:flutter/material.dart';


class BodyImagen extends StatefulWidget {
  @override
  _BodyImagenState createState() => _BodyImagenState();
}

class _BodyImagenState extends State<BodyImagen> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
        top: 65.0,
        left: 120.0,
        child: Container(
          width: 160.0,
          height: 160.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/image_01.png"),
            )
          ),
        ),
      
      ),
      ],
    );
    
  }
}