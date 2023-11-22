import 'package:app_famosos/src/controller/peliculas_list.dart';
import 'package:app_famosos/src/models/pelicula_modelo.dart';
import 'package:app_famosos/src/services/peliculas_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Esta clase es para el controlador del formulario de pelicula, ya sea para agregar o editar
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
  PeliculaService? service;
  // instancia del controlador de la lista
  PeliculasListController ctrList = Get.find();
  // controladores de los inputs
  var ctrNombre = TextEditingController().obs;
  var ctrGenero = TextEditingController().obs;
  var ctrAo = TextEditingController().obs;
  var ctrProductor = TextEditingController().obs;
  var ctrDirector = TextEditingController().obs;

  void setAttributes(
    String id,
    String nombre,
    String genero,
    int ao,
    String productor,
    String director,
  ) {
    _id = id;
    ctrNombre.value.text = nombre;
    ctrGenero.value.text = genero;
    ctrAo.value.text = ao.toString();
    ctrProductor.value.text = productor;
    ctrDirector.value.text = director;
    peliculaNombre.value = nombre;
    peliculaGenero.value = genero;
    peliculaAo.value = ao.toString();
    peliculaProductor.value = productor;
    peliculaDirector.value = director;
  }

  @override
  void onInit() {
    super.onInit();
    service = PeliculaService();

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
        String? mensaje = 'Se agrego una nueva pelicula';
        if (_id == '') {
          PeliculaModelo pelicula = PeliculaModelo(
              nombre: peliculaNombre.value,
              genero: peliculaGenero.value,
              ao: int.parse(peliculaAo.value),
              productor: peliculaProductor.value,
              director: peliculaDirector.value);
          _id = await ctrList.agregar(pelicula);
          Get.back();
        } else {
          PeliculaModelo pelicula = PeliculaModelo(
            id: _id,
            nombre: peliculaNombre.value,
            genero: peliculaGenero.value,
            ao: int.parse(peliculaAo.value),
            productor: peliculaProductor.value,
            director: peliculaDirector.value,
          );
          ctrList.actualizar(pelicula);
          mensaje = "Se actualizado la pelicula";
          Get.back();
        }
        if (_id!.isNotEmpty) {
          ctrNombre.value.text = "";
          ctrGenero.value.text = "";
          ctrAo.value.text = "";
          ctrProductor.value.text = "";
          ctrDirector.value.text = "";
          Get.snackbar('Pelicula', mensaje);
        }
        return true;
      }
    };
  }
}
