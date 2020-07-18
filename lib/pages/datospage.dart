import 'package:flutter/material.dart';
import 'package:proyectocolegio/Entidades/usuario.dart';
import '../Widgets/bodyImagen.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import 'package:proyectocolegio/sidebar/sidebar.dart' as side;

Usuario user;

class DatosPage extends StatefulWidget with NavigationStates {
  @override
  _DatosPageState createState() => _DatosPageState();
  

}

class _DatosPageState extends State<DatosPage> {

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    user = side.user;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: new Color(0xFFCEB5E6),
        //decoration: BoxDecoration(//FONDO IMAGEN
          //image: DecorationImage(
            //image: AssetImage("assets/fondodato_2.jpg"),
           // fit: BoxFit.cover,
         // ),
       // ),

        child: Stack(
          
          children: <Widget>[
           
            
                
                     
              
            profilePage(user.nombre,user.apellido,user.dni,user.celular,user.correo),
                
            
            BodyImagen()
            
            //profilePage("","","","")

            
          ],
          
          
        ),
   

      ), 

    );
    
  }
}

Center profilePage(String nombre, String apellido, String dni, String celular, String correo){
  
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF5a348b),
          borderRadius: new BorderRadius.all( Radius.circular(40.0)
          ),
          gradient:LinearGradient(
            colors: [
             Color(0xFF5a346b),
             Color(0xFF5a348b)
            ],
             begin:  Alignment.centerRight,
             end: Alignment(-1.0,-1.0)
          ),
        ),
        child: Container(
          width: 340.0,
          height: 340.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            gradient: LinearGradient(
              colors: [
                Color(0xFF520082),
                Color(0xFF25002E)
              ]
            ),
            boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFF000000).withOpacity(.84),

          ),
        ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                      nombre + " "+ apellido,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0
                      ),
                    ),
                  ),
                   
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.perm_identity,
                                color: new Color(0xFFffffff),
                                size: 20.0, 
                              ),
                              Text(
                                dni,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                color: new Color(0xFFffffff),
                                size: 20.0, 
                              ),
                              Text(
                                celular,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                color: new Color(0xFFffffff),
                                size: 20.0, 
                              ),
                              Text(
                                correo,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      )
    ),
  );
}