import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectocolegio/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:proyectocolegio/pages/detallenotaspage.dart';

class NotasPage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: 700,//TAMAÑO DEL FONDO
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    //borderRadius: BorderRadius.only(
                      //bottomLeft: Radius.circular(50),
                      //bottomRight: Radius.circular(50),
                    //),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 55),
                        CursoInfo(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top: size.height * .4 -30),
                  child: Column(
                    children: <Widget>[
                      DescripcionCurso(
                        name: "Matemática I",
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => DetalleNota()),);
                          
                        },
                      ),
                      DescripcionCurso(
                        name: "Tutoria",
                        press: () {},
                      ),
                      DescripcionCurso(
                        name: "Arte",
                        press: () {},
                      ),
                      DescripcionCurso(
                        name: "Ciencias",
                        press: () {},
                      ),
                      DescripcionCurso(
                        name: "Comunicación",
                        press: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DescripcionCurso extends StatelessWidget {
  final String name;
  final Function press;
 
  const DescripcionCurso({
    Key key, this.name, this.press,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
      margin: EdgeInsets.only(bottom: 1, top: 20),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),

          ),
        ],
       ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: " $name ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios, 
              size:18,
            ),
            onPressed: press,
          ),
        ],
      ),
    );
  }
}

class CursoInfo extends StatelessWidget {
  const CursoInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Text(
                "Cursos", 
                style: Theme.of(context).textTheme.display1.copyWith(fontSize: 30),
                
              ),
              Text(
                "Matriculados", 
                style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,
                fontSize: 30),
              ),
              
            ],
          ),
        ),
        Image.asset(
          "assets/book-1.png",
          
          height: 185,
        ),
      ],
    );
  }
}