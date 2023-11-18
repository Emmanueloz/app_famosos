import 'package:app_famosos/src/models/pelicula_modelo.dart';
import 'package:flutter/material.dart';

class ItemPelicula extends StatelessWidget {
  final PeliculaModelo peliculas;
  const ItemPelicula({
    super.key,
    required this.peliculas,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(peliculas.nombre),
        subtitle: Text(peliculas.genero),
        
      ),
    );
  }

  
}

