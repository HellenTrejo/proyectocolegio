import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectocolegio/pages/registronotapage.dart';



class DetalleEvaluacionDoc extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluaciones del curso', style: TextStyle(color: Colors.white),),
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
                        EvaluaInfo(),
                        
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top: size.height * .4 -50),
                  child: Column(
                    children: <Widget>[
                      DescripcionEvalu(
                        name: "Practica I",
                        nota: "20",
                         press: () {
                          
                            Navigator.push(
                             context,
                              CupertinoPageRoute(builder: (context) => RegistroNota()),);
                           
                         },
                        
                      ),
                      DescripcionEvalu(
                        name: "Practica II",
                        nota: "-",
                        press: () {},
                        
                      ),
                      DescripcionEvalu(
                        name: "Practica III",
                        nota: "-",
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


class DescripcionEvalu extends StatelessWidget {
  final String name;
  final String nota;
   final Function press;
 
  const DescripcionEvalu({
    Key key, this.name, this.nota, this.press, 

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;




    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
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
          
          FlatButton(
            padding: EdgeInsets.all(2.0),
            color: Colors.white,
            splashColor: Colors.deepPurple[300],
            
            child: 
              Text(" $nota ", style: 
                TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  
                  fontWeight: FontWeight.bold,
                ),
              ),
            onPressed: press,
          )

          /* RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: " $nota ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ), 
              ],
            ),
          ), */
        ],
      ),
    );
  }
}

class EvaluaInfo extends StatelessWidget {
  const EvaluaInfo({
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
                "Notas de", 
                style: Theme.of(context).textTheme.display1.copyWith(fontSize: 30),
                
              ),
              Text(
                "Evaluación", 
                style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,
                fontSize: 30),
              ),
              
            ],
          ),
        ),
        Image.asset(
          "assets/nota.png",
          width: 210,
          height: 205,
        ),
      ],
    );
  }
}