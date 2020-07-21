import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectocolegio/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:proyectocolegio/http/http_helper.dart';
import 'package:proyectocolegio/pages/detallenotaspage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:proyectocolegio/main.dart' as mein;
import 'package:proyectocolegio/sidebar/sidebar.dart' as side;

List cursos;
List nomCursos;
int contador;


class NotasPage extends StatelessWidget{
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
                        name: "Matemática I" + nomCursos[0],
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

class ScreenNotas extends StatefulWidget with NavigationStates{
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<ScreenNotas> {
  
  @override void initState() {
    mein.helper = HttpHelper();
    var id = side.tokenId;
    nomCursos = new List();

    Future<void> cursoValue() async {
      cursos = await mein.helper.getIdCursosXUsuario(id);
      for(var i in cursos){
        var name = await mein.helper.getDesCurso(i);
        nomCursos.add(name);
      }
    }

    Future initialize() async{
      setState(() {
        contador = cursos.length;
      });
    }

    cursoValue();
    initialize();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: Text('Hello World'),
          child: Container(
            margin:EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: SplashScreen(
          seconds: 3,
          title: new Text("Cole",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              
            )
          ),
          backgroundColor: Colors.white,
          image: Image.asset("assets/splash.gif"),
          loaderColor: Colors.white,//Ponerlo blanco
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 120.0,
          loadingText: Text(""),//Texto del cargando
          navigateAfterSeconds: NotasPage(),
    
        ),
        ),
      ),
    );
  }
}