import 'package:app_famosos/src/controller/famosos_list.dart';
import 'package:app_famosos/src/models/famoso_modelo.dart';
import 'package:app_famosos/src/services/famosos_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Esta clase es para el controlador del formulario de famoso, ya sea para agregar o editar
class FamosoController extends GetxController {
  // campos
  String? _id = '';
  var famosoNombre = ''.obs;
  var famosoOrigen = "".obs;
  var faNacimiento = "".obs;
  var famosoTipo = "".obs;
  var famosoGenero = "".obs;
  var famosoPareja = "".obs;
  // son validos?
  bool fNombre = false;
  bool fOrigen = false;
  bool fNacimiento = false;
  bool fTipo = false;
  bool fPareja = false;

  // errores
  RxnString errorNombre = RxnString(null);
  RxnString errorOrigen = RxnString(null);
  RxnString errorNacimiento = RxnString(null);
  RxnString errorTipo = RxnString(null);
  RxnString errorPareja = RxnString(null);
  //función
  Rxn<Function()> submitFunc = Rxn<Function()>(null);
  // instancia del servicio
  FamososService? service;
  // instancia del controlador de la lista
  FamososListController ctrList = Get.find();
  // controladores de los inputs
  var ctrNombre = TextEditingController().obs;
  var ctrOrigen = TextEditingController().obs;
  var ctrNacimiento = TextEditingController().obs;
  var ctrTipo = TextEditingController().obs;
  var ctrGenero = TextEditingController().obs;
  var ctrPareja = TextEditingController().obs;

  void setAttributes(String id, String nombre, String origen, String nacimiento,
      String tipo, String genero, String pareja) {
    _id = id;
    ctrNombre.value.text = nombre;
    ctrOrigen.value.text = origen;
    ctrNacimiento.value.text = nacimiento;
    ctrTipo.value.text = tipo;
    ctrGenero.value.text = genero;
    ctrPareja.value.text = pareja;
    famosoNombre.value = nombre;
    famosoOrigen.value = origen;
    faNacimiento.value = nacimiento;
    famosoTipo.value = tipo;
    famosoGenero.value = genero;
    famosoPareja.value = pareja;
  }

  @override
  void onInit() {
    super.onInit();
    service = FamososService();

    debounce<String>(famosoNombre, validarNombre,
        time: const Duration(microseconds: 500));
    debounce<String>(famosoOrigen, validarOrigen,
        time: const Duration(microseconds: 500));
    debounce<String>(faNacimiento, validarFaNacimiento,
        time: const Duration(microseconds: 500));
    debounce<String>(famosoTipo, validarTipo,
        time: const Duration(microseconds: 500));
    debounce<String>(famosoPareja, validarPareja,
        time: const Duration(microseconds: 500));
  }

  // changed
  void nombreChanged(String val) {
    famosoNombre.value = val;
  }

  void origenChanged(String val) {
    famosoOrigen.value = val;
  }

  void fNacimientoChanged(String val) {
    faNacimiento.value = val;
  }

  void tipoChanged(String val) {
    famosoTipo.value = val;
  }

  void generoChanged(String val) {
    famosoGenero.value = val;
  }

  void parejaChanged(String val) {
    famosoPareja.value = val;
  }

  // validaciones
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

  void validarOrigen(String val) {
    errorOrigen.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorOrigen.value = null;
      submitFunc.value = submitFunction();
      fOrigen = true;
    } else {
      errorOrigen.value = "El lugar de origen debe ser mayor a 3 letras";
      fOrigen = false;
    }
  }

  void validarFaNacimiento(String val) {
    errorNacimiento.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorNacimiento.value = null;
      submitFunc.value = submitFunction();
      fNacimiento = true;
    } else {
      errorNacimiento.value = "La fecha de nacimiento no es valida";
      fNacimiento = false;
    }
  }

  void validarTipo(String val) {
    errorTipo.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorTipo.value = null;
      submitFunc.value = submitFunction();
      fTipo = true;
    } else {
      errorTipo.value = "El tipo de debe ser mayor a 3 letras";
      fTipo = false;
    }
  }

  void validarPareja(String val) {
    errorPareja.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorPareja.value = null;
      submitFunc.value = submitFunction();
      fPareja = true;
    } else {
      errorPareja.value = "El nombre de la pareja debe ser mayor a tres letras";
      fPareja = false;
    }
  }

  Future<bool> Function() submitFunction() {
    return () async {
      if (!fNombre || !fOrigen || !fNacimiento || !fTipo || !fPareja) {
        submitFunc.value = null;
        validarNombre(famosoNombre.value);
        validarOrigen(famosoOrigen.value);
        validarFaNacimiento(faNacimiento.value);
        validarTipo(famosoTipo.value);
        validarPareja(famosoPareja.value);
        return true;
      } else {
        String? mensaje = 'Se agrego un nuevo famoso';
        if (_id == '') {
          FamosoModelo famoso = FamosoModelo(
              nombre: famosoNombre.value,
              origen: famosoOrigen.value,
              fechaNacimiento: faNacimiento.value,
              tipo: famosoTipo.value,
              genero: famosoGenero.value,
              pareja: famosoPareja.value);
          _id = await ctrList.agregar(famoso);
          Get.back();
        } else {
          FamosoModelo famoso = FamosoModelo(
            id: _id,
            nombre: famosoNombre.value,
            origen: famosoPareja.value,
            fechaNacimiento: faNacimiento.value,
            tipo: famosoTipo.value,
            genero: famosoGenero.value,
            pareja: famosoPareja.value,
          );
          ctrList.actualizar(famoso);
          mensaje = "Se actualizado un famoso";
          Get.back();
        }
        if (_id!.isNotEmpty) {
          ctrNombre.value.text = "";
          ctrOrigen.value.text = "";
          ctrNacimiento.value.text = "";
          ctrTipo.value.text = "";
          ctrPareja.value.text = "";
          Get.snackbar('Famoso', mensaje);
        }
        return true;
      }
    };
  }
}
