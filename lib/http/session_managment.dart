import 'package:shared_preferences/shared_preferences.dart';


_saveValue(int token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('token', token);
  }

Future<int> _returnValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await prefs.getInt("token") ?? -1;
  return token;
  }

_removeValue() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("token");
}