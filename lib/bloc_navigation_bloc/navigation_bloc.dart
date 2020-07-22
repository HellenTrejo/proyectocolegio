import 'package:bloc/bloc.dart';
import '../pages/datospage.dart';
import '../pages/homepage.dart';
import '../pages/notaspage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  DatosPageClickedEvent,
  NotasPageClickedEvent,
}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch(event){
      case NavigationEvents.HomePageClickedEvent: 
        yield HomePage();
        break;
      case NavigationEvents.DatosPageClickedEvent: 
        yield DatosPage();
        break;
      case NavigationEvents.NotasPageClickedEvent: 
        yield NotasPage();
        break;
    }
  }
}