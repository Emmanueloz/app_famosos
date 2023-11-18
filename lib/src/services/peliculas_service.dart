import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_famosos/src/models/pelicula_modelo.dart';
import 'package:flutter/material.dart';

class PeliculaService extends ChangeNotifier {
  final String _baseUrl = 'bdra3-5b065-default-rtdb.firebaseio.com';
  final List<PeliculaModelo> peliculas = [];

  // crear la pelicula
  Future<String?> createPelicula(PeliculaModelo pelicula) async {
    final url = Uri.https(_baseUrl, 'peliculas.json');
    final resp = await http.post(url, body: json.encode(pelicula));
    final decodedData = json.decode(resp.body);

    pelicula.id = decodedData['name'];
    return pelicula.id;
  }

  //leer los  datos de firebase
  Future<List<PeliculaModelo>> loadPeliculas() async {
    final List<PeliculaModelo> peliculas = [];
    final url = Uri.https(_baseUrl, 'peliculas.json');

    final resp = await http.get(url); // Make the HTTP request

    final Map<String, dynamic> peliculasMap = json.decode(resp.body);

    peliculasMap.forEach((key, value) {
      final tempPeliculas = PeliculaModelo.fromJson(value);
      tempPeliculas.id = key;
      peliculas.add(tempPeliculas);
    });
    return peliculas;
  }
  Future<bool> deletePeliculas(PeliculaModelo value) async{
    final url = Uri.https(_baseUrl, 'peliculas/${value.id}.json');
    final resp = await http.delete(url);
    return resp.statusCode == 200;
  }
}
