import 'package:flutter/material.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../components/body.dart';

class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}