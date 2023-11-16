import 'package:app_famosos/src/models/famoso_modelo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FamososService extends ChangeNotifier {
  final String _baseUrl =
      "bdra3-5b065-default-rtdb.firebaseio.com"; // famosos.json
  final List<FamosoModelo> famosos = [];

  Future<List<FamosoModelo>> loadFamosos() async {
    final url = Uri.https(_baseUrl, 'famosos.json');
    print(url);
    final resp = await http.get(url);

    final Map<String, dynamic> famososMap = json.decode(resp.body);

    famososMap.forEach((key, value) {
      final tempFamosos = FamosoModelo.fromJson(value);
      tempFamosos.id = key;
      famosos.add(tempFamosos);
    });
    return famosos;
  }
}


  