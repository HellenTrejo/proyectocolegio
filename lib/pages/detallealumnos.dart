import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetalleAlumnos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumnos del curso', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF25002E),
        iconTheme: IconThemeData(
            color: Colors.white, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: 600,//TAMAÑO DEL FONDO
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
                       // SizedBox(height: 55),
                        AlumnoInfo(),
                        
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top: size.height * .4 -80),
                  child: Column(
                    children: <Widget>[
                      DescripcionAlumno(
                        name: "Alumno 1 ",
                        press: () {
                          //Navigator.push(
                            //  context,
                              //CupertinoPageRoute(builder: (context) => DetalleNota()),);
                          
                        },
                        
                      ),
                      DescripcionAlumno(
                        name: "Alumno 2",
                        press: () {},
                        
                      ),
                      DescripcionAlumno(
                        name: "Alumno 3",
                        press: () {},
                       
                      ),
                      DescripcionAlumno(
                        name: "Alumno 4",
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


class DescripcionAlumno extends StatelessWidget {
  final String name;
  final Function press;
 // final String nota;
 
  const DescripcionAlumno({
    Key key, this.name, this.press, 

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 30),
      margin: EdgeInsets.only(bottom: 1, top: 10),
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

class AlumnoInfo extends StatelessWidget {
  const AlumnoInfo({
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
                "Alumnos del", 
                style: Theme.of(context).textTheme.display1.copyWith(fontSize: 26),
                
              ),
              Text(
                "Curso", 
                style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,
                fontSize: 26),
              ),
              
            ],
          ),
        ),
        Image.asset(
          "assets/group.png",
          width: 150,
          height: 170,
        ),
      ],
    );
  }
}