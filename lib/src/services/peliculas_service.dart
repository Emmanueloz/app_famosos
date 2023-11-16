import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_famosos/src/models/pelicula_modelo.dart';
import 'package:flutter/material.dart';

  class PeliculaService extends ChangeNotifier{
  final String _baseUrl = 'hprod-10d9a-default-rtdb.firebaseio.com';
  final List<PeliculaModelo> pelicula = [];
  late PeliculaModelo selectedPelicula;

  Future<String?> createPelicula(PeliculaModelo pelicula) async {
    final url = Uri.https(_baseUrl,'peliculas.json');
    final resp = await http.post(url, body: json.encode(pelicula));
    final decodedData = json.decode(resp.body);

    pelicula.id = decodedData['name'];
    return pelicula.id;
  } 

  //leer los  datos de firebase
  Future<List<PeliculaModelo>> loadPeliculas() async {
    final List<PeliculaModelo> pelicula = [];
    final url = Uri.http(_baseUrl, 'peliculas.json');

    final resp = await http.get(url); // Make the HTTP request
    
    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempPeliculas = PeliculaModelo.fromJson(value);
      tempPeliculas.id = key;
      pelicula.add(tempPeliculas);
    });
    return pelicula;
  } 
}
