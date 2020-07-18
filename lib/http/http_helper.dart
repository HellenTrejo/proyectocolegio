import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:proyectocolegio/Entidades/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HttpHelper {
  //final String urlKey = 'api_key=YOUR API KEY HERE';
    final String urlBase = 'http://env-8427653.j.layershift.co.uk/rest/servicios';
    final String urlLanguage = '&language=en-US';


  //Session Managment
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
  //Session Managment


  Future <String> verUsuario(String dni, String pass) async{
    final String urlUpcoming = '/usuario';
    final String urlDni = '/'+dni;
    final String urlPass = '/'+pass;
    final String url = urlBase + urlUpcoming + urlDni + urlPass;
   

    http.Response result= await http.get(url);
    if(result.statusCode == HttpStatus.ok){
      if(result.body == "[]"){
        return "No";
      }
      else{
        List jsonResponse = jsonDecode(result.body);
        int token = jsonResponse[0]["idUsuario"];
        _saveValue(token);
        return "Si";    
      }  
      }
    else{
      return null;
    }

  }

  Future<Usuario> getUsuario(int id) async{
    final String urlUpcoming = '/usuario';
    final String urlId = '/'+ id.toString();
    final String url = urlBase + urlUpcoming + urlId;

    http.Response result = await http.get(url);
    if(result.statusCode == HttpStatus.ok){
     
      List jsonResponse = jsonDecode(result.body);
      var dni = jsonResponse[0]["dni"];
      var password = jsonResponse[0]["password"];
      var apellido = jsonResponse[0]["apellido"];
      var nombre = jsonResponse[0]["nombre"];
      var celular = jsonResponse[0]["celular"];
      var correo = jsonResponse[0]["correo"];
      Usuario user = new Usuario(id, dni, password, apellido, nombre, celular, correo);
      
      return user;
      
    }
    else{
      return null;
    }

  }

}