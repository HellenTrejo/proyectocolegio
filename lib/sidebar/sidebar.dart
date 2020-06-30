import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../main.dart';
import '../sidebar/menu_item.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpnenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpnenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpnenedStreamController.stream;
    isSidebarOpenedSink =isSidebarOpnenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpnenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();

  }

  void onIconPreseed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if(isAnimationCompleted){
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    }else{
       isSidebarOpenedSink.add(true);
      _animationController.forward();
    }


  }



  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
   
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideOpenedAsync){
        return AnimatedPositioned(
        duration: _animationDuration,
        top: 0,
        bottom: 0,
        left: isSideOpenedAsync.data ? 0 : -screenWidth,
        right: isSideOpenedAsync.data ? 0 : screenWidth - 45,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                //color: const Color(0xFF25002E),
                decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF520082),
                              Color(0xFF25002E)
                            ]
                          ),),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 90,
                    ),
                    ListTile(
                      title: Text("COLE", 
                      style: TextStyle(color: Colors.white,fontFamily: "Poppins-Bold", fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      leading: CircleAvatar(
                        child: Image.asset(
                          "assets/logo.png",
                          width: 40,
                          ), 
                        backgroundColor: Colors.white,
                        
                        radius: 40,
                      ),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color:Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                      icon: Icons.home,
                      title: "Home",
                      onTap: (){
                        onIconPreseed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                      },
                    ),
                    MenuItem(
                      icon: Icons.person,
                      title: "Datos",
                      onTap: (){
                        onIconPreseed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.DatosPageClickedEvent);
                      },
                    ),
                    MenuItem(
                      icon: Icons.grade,
                      title: "Notas",
                      onTap: (){
                        onIconPreseed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.NotasPageClickedEvent);
                      },
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color:Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                      icon: Icons.exit_to_app,
                      title: "Salir",
                      onTap: (){
                        onIconPreseed();
                         Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),);
                      },
                    ),


                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.9),
              child: GestureDetector(
                onTap: () {
                  onIconPreseed();
                },
                child: ClipPath(
                  clipper: CustomMenuClipper(),
                  child: Container(
                    width: 35,
                    height: 110,
                    color: Color(0xFF25002E),
                    alignment: Alignment.centerLeft,
                    child: AnimatedIcon(
                      progress: _animationController.view,
                      icon: AnimatedIcons.menu_close,
                      color: Color(0xFFffffff),
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
      
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width= size.width;
    final height =size.height;

    Path path = Path();
    path.moveTo(0,0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2- 20, width, height/2);
    path.quadraticBezierTo(width +1,  height/2+ 20, 10, height-16);
    path.quadraticBezierTo(0, height - 8, 0, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
 
    return true;
  }

}
