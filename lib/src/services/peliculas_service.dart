import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_famosos/src/models/pelicula_modelo.dart';
import 'package:flutter/material.dart';

  class PeliculaService extends ChangeNotifier{
  final String _baseUrl = 'bdra3-5b065-default-rtdb.firebaseio.com';
  final List<PeliculaModelo> pelicula = [];
 

  Future<String?> createPelicula(PeliculaModelo peli) async {
    final url = Uri.https(_baseUrl,'peliculas.json');
    final resp = await http.post(url, body: json.encode(peli));
    final decodedData = json.decode(resp.body);

    peli.id = decodedData['name'];
    return peli.id;
  } 

  //leer los  datos de firebase
  Future<List<PeliculaModelo>> loadPeliculas() async {
    final List<PeliculaModelo> pelicula = [];
    final url = Uri.http(_baseUrl, 'peliculas.json');

    final resp = await http.get(url); // Make the HTTP request
    
    final Map<String, dynamic> peliculasMap = json.decode(resp.body);

    peliculasMap.forEach((key, value) {
      final tempPeliculas = PeliculaModelo.fromJson(value);
      tempPeliculas.id = key;
      pelicula.add(tempPeliculas);
    });
    return pelicula;
  } 
}
