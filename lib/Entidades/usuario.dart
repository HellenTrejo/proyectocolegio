class Usuario {
  final String dni;
  final String password; 
  final String apellido;
  final String nombre;
  final String celular;
  final String correo;
  

  Usuario(this.dni, this.password, this.apellido, this.nombre, this.celular, this.correo);

  Usuario.fromJson(Map<String, dynamic> json)
      : dni = json['dni'],
        password = json['password'],
        apellido = json['apellido'],
        nombre = json['nombre'],
        celular = json['celular'],
        correo = json['correo'];

  Map<String, dynamic> toJson() =>
    {
      'dni': dni,
      'password': password,
      'apellido': apellido,
      'nombre': nombre,
      'celular': celular,
      'correo': correo,


    };
}