import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_famosos/src/models/famoso_modelo.dart';
import 'package:flutter/material.dart';

class FamososService extends ChangeNotifier {
  final String _baseUrl =
      "https://bdra3-5b065-default-rtdb.firebaseio.com"; // famosos.json

  // crear famosos
  Future<String?> createFamoso(FamosoModelo famoso) async {
    final url = Uri.https(_baseUrl, 'famosos.json');
    final resp = await http.post(url, body: json.encode(famoso));
    final decodeData = json.decode(resp.body);

    famoso.id = decodeData["name"];
    return famoso.id;
  }
}
