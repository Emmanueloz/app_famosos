class PeliculaModelo {
  String id;
  String nombre;
  String genero;
  int ao;
  String productor;
  String director;

  PeliculaModelo({
    required this.id,
    required this.nombre,
    required this.genero,
    required this.ao,
    required this.productor,
    required this.director,
  });

  factory PeliculaModelo.fromJson(Map<String, dynamic> json) => PeliculaModelo(
        id: json["id"],
        nombre: json["Nombre"],
        genero: json["Genero"],
        ao: json["Año"],
        productor: json["Productor"],
        director: json["Director"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Nombre": nombre,
        "Genero": genero,
        "Año": ao,
        "Productor": productor,
        "Director": director,
      };
}
