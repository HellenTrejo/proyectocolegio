import 'package:flutter/material.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../components/body.dart';


class HomePage extends StatefulWidget with NavigationStates {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
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
    return Scaffold(
      body: Body(),
    );
  }
}