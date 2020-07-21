import 'dart:convert';

class Curso {
  final int idCurso;
  final String descripcion;
  

  Curso(this.idCurso, this.descripcion);

  Curso.fromJson(Map<String, dynamic> json)
        : idCurso = json['idCurso'],
          descripcion = json['descripcion'];

  Map<String, dynamic> toJson() =>
    {
      'idCurso': idCurso,
      'descripcion': descripcion
    };
}