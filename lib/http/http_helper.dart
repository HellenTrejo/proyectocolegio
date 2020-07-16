

import 'dart:io';

import 'package:http/http.dart' as http;


class HttpHelper {
  //final String urlKey = 'api_key=YOUR API KEY HERE';
  final String urlBase = 'http://env-8427653.j.layershift.co.uk/rest/servicios';
  final String urlUpcoming = '/alumno';
  final String urlLanguage = '&language=en-US';

  Future <String> listaAlumnos() async{
    final String url = urlBase + urlUpcoming;
    http.Response result= await http.get(url);
    if(result.statusCode == HttpStatus.ok){
      String responseBody=result.body;
      return responseBody;
    }
    else{
      return null;
    }

  }

}