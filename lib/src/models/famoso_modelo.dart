class FamosoModelo {
  String? id;
  String nombre;
  int edad;
  String origen;
  String fechaNacimiento;
  String tipo;
  String genero;
  String pareja;

  FamosoModelo({
    this.id,
    required this.nombre,
    required this.edad,
    required this.origen,
    required this.fechaNacimiento,
    required this.tipo,
    required this.genero,
    required this.pareja,
  });

  factory FamosoModelo.fromJson(Map<String, dynamic> json) => FamosoModelo(
        id: json["id"],
        nombre: json["nombre"],
        edad: json["edad"],
        origen: json["origen"],
        fechaNacimiento: json["fechaNacimiento"],
        tipo: json["tipo"],
        genero: json["genero"],
        pareja: json["pareja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "edad": edad,
        "origen": origen,
        "fechaNacimiento": fechaNacimiento,
        "tipo": tipo,
        "genero": genero,
        "pareja": pareja,
      };
}
