import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Widgets/FormCard.dart';
import 'http/http_helper.dart';
import 'package:proyectocolegio/Home.dart';
import 'package:proyectocolegio/globals.dart' as globals;


HttpHelper helper;



void main() => runApp(MaterialApp(  
    home: Screen(),
    debugShowCheckedModeBanner: false,
));


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>{
@override
  void initState() {
    helper= HttpHelper();
    super.initState();
  }



//
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit:StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.asset("assets/image_01.png"),
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
                padding: EdgeInsets.only(left:28.0, right: 28.0, top: 70.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/logo.png",
                          width: ScreenUtil.getInstance().setWidth(110),
                          height: ScreenUtil.getInstance().setHeight(110),
                        ),
                        Text("COLE", 
                          style: TextStyle(
                            fontFamily: "Poppins-Bold",
                            fontSize: ScreenUtil.getInstance().setSp(40),
                            color: Color(0xFF280042),
                            letterSpacing: .6,
                            fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(180),
                    ),
                    FormCard(),   //VIENE DE LA CARPETA WIDGETS FormCard                   
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
                            onTap: () async{
                              var dni = globals.userDniCtrl.text;
                              var pass = globals.userPassCtrl.text;
                              var log = await helper.verUsuario(dni, pass);

                                if(log == "Si"){
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Home()),);
                                  globals.userDniCtrl.clear();
                                  globals.userPassCtrl.clear();
                                }
                                else{
                                  return showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        content: Text("No, I don't think so"),
                                      );
                                    });
                                }                             
                            },//Creo que aquí se añade el metodo
                            child: Center(
                              child: Text("INGRESAR", style: TextStyle(color: Colors.white,
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



class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  
 
 
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
          navigateAfterSeconds: MyApp(),
    
        ),
        ),
      ),
    );
  }
}