import 'package:app_famosos/src/models/pelicula_modelo.dart';
import 'package:app_famosos/src/services/peliculas_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeliculaController extends GetxController {
  // campos
  String? _id = '';
  var peliculaNombre = ''.obs;
  var peliculaGenero = ''.obs;
  var peliculaAo = ''.obs; //pelicula Año
  var peliculaProductor = ''.obs;
  var peliculaDirector = ''.obs;

  // son validos?
  bool fNombre = false;
  bool fGenero = false;
  bool fAo = false;
  bool fProductor = false;
  bool fDirector = false;
  // errores
  RxnString errorNombre = RxnString(null);
  RxnString errorGenero = RxnString(null);
  RxnString errorAo = RxnString(null);
  RxnString errorProductor = RxnString(null);
  RxnString errorDirector = RxnString(null);
  // función
  Rxn<Function()> submitFunc = Rxn<Function()>(null);
  // instancia del servicio
  PeliculasService? service;
  // controladores de los inputs
  var ctrNombre = TextEditingController().obs;
  var ctrGenero = TextEditingController().obs;
  var ctrAo = TextEditingController().obs;
  var ctrProductor = TextEditingController().obs;
  var ctrDirector = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    service = PeliculasService();

    debounce<String>(peliculaNombre, validarNombre,
        time: const Duration(microseconds: 500));
    debounce<String>(peliculaGenero, validarGenero,
        time: const Duration(microseconds: 500));
    debounce<String>(peliculaAo, validarAo,
        time: const Duration(microseconds: 500));
    debounce<String>(peliculaProductor, validarProductor,
        time: const Duration(microseconds: 500));
    debounce<String>(peliculaDirector, validarDirector,
        time: const Duration(microseconds: 500));
  }

  //changed
  void nombreChanged(String val) {
    peliculaNombre.value = val;
  }

  void generoChanged(String val) {
    peliculaGenero.value = val;
  }

  void aoChanged(String val) {
    peliculaAo.value = val;
  }

  void productorChanged(String val) {
    peliculaProductor.value = val;
  }

  void directorChanged(String val) {
    peliculaDirector.value = val;
  }

  //validaciones
  void validarNombre(String val) {
    errorNombre.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorNombre.value = null;
      submitFunc.value = submitFunction();
      fNombre = true;
    } else {
      errorNombre.value = "El nombre debe ser mayor a 3 letras";
      fNombre = false;
    }
  }

  void validarGenero(String val) {
    errorGenero.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorGenero.value = null;
      submitFunc.value = submitFunction();
      fGenero = true;
    } else {
      errorGenero.value = "El genero debe ser mayor a 3 letras";
      fGenero = false;
    }
  }

  void validarAo(String val) {
    errorAo.value = null;
    submitFunc.value = null;
    if (val.length >= 4 && int.tryParse(val) is int && int.parse(val) >= 1000) {
      submitFunc.value = submitFunction();
      errorAo.value = null;
      fAo = true;
    } else {
      errorAo.value = "Debe colocar un año valido";
      fAo = false;
    }
  }

  void validarProductor(String val) {
    errorProductor.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorProductor.value = null;
      submitFunc.value = submitFunction();
      fProductor = true;
    } else {
      errorProductor.value =
          "El nombre del productor debe ser mayor a 3 letras";
      fProductor = false;
    }
  }

  void validarDirector(String val) {
    errorDirector.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorDirector.value = null;
      submitFunc.value = submitFunction();
      fDirector = true;
    } else {
      errorDirector.value = "El nombre del director debe ser mayor a 3 letras";
      fDirector = false;
    }
  }

  Future<bool> Function() submitFunction() {
    return () async {
      if (!fNombre || !fGenero || !fAo || !fProductor || !fDirector) {
        submitFunc.value = null;
        validarNombre(peliculaNombre.value);
        validarGenero(peliculaGenero.value);
        validarAo(peliculaAo.value);
        validarProductor(peliculaProductor.value);
        validarDirector(peliculaDirector.value);
        return true;
      } else {
        String? mensaje = 'Se agrego un nuevo famoso';
        if (_id == '') {
          PeliculaModelo pelicula = PeliculaModelo(
              nombre: peliculaNombre.value,
              genero: peliculaGenero.value,
              ao: int.parse(peliculaAo.value),
              productor: peliculaProductor.value,
              director: peliculaDirector.value);
          //_id = await ctrList.agregar(pelicula);
        } else {
          /// TODO: código para actualizar
        }
        if (_id!.isNotEmpty) {
          ctrNombre.value.text = "";
          ctrGenero.value.text = "";
          ctrAo.value.text = "";
          ctrProductor.value.text = "";
          ctrDirector.value.text = "";
          Get.snackbar('Producto', mensaje);
        }
        return true;
      }
    };
  }
}
