class PeliculaModelo {
  String? id;
  String nombre;
  String genero;
  int ao;
  String productor;
  String director;

  PeliculaModelo({
    this.id,
    required this.nombre,
    required this.genero,
    required this.ao,
    required this.productor,
    required this.director,
  });

  factory PeliculaModelo.fromJson(Map<String, dynamic> json) => PeliculaModelo(
        id: json["id"],
        nombre: json["nombre"],
        genero: json["genero"],
        ao: json["año"],
        productor: json["productor"],
        director: json["director"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "genero": genero,
        "año": ao,
        "productor": productor,
        "director": director,
      };
}
