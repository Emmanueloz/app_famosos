import 'package:app_famosos/src/controller/famosos_list.dart';
import 'package:app_famosos/src/models/famoso_modelo.dart';
import 'package:app_famosos/src/services/famosos_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamosoController extends GetxController {
  // campos
  String? _id = '';
  var famosoNombre = ''.obs;
  var famosoEdad = "".obs;
  var famosoOrigen = "".obs;
  var faNacimiento = "".obs;
  var famosoTipo = "".obs;
  var famosoGenero = "".obs;
  var famosoPareja = "".obs;
  // son validos?
  bool fNombre = false;
  bool fEdad = false;
  bool fOrigen = false;
  bool fNacimiento = false;
  bool fTipo = false;
  bool fPareja = false;

  // errores
  RxnString errorNombre = RxnString(null);
  RxnString errorEdad = RxnString(null);
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
  var ctrEdad = TextEditingController().obs;
  var ctrOrigen = TextEditingController().obs;
  var ctrNacimiento = TextEditingController().obs;
  var ctrTipo = TextEditingController().obs;
  var ctrGenero = TextEditingController().obs;
  var ctrPareja = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    service = FamososService();

    debounce<String>(famosoNombre, validarNombre,
        time: const Duration(microseconds: 500));
    debounce<String>(famosoEdad, validarEdad,
        time: const Duration(microseconds: 500));
    debounce<String>(famosoEdad, validarEdad,
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

  void edadChanged(String val) {
    famosoEdad.value = val;
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

  void validarEdad(String val) {
    errorEdad.value = null;
    submitFunc.value = null;
    if (int.tryParse(val) is int && int.parse(val) >= 0) {
      submitFunc.value = submitFunction();
      errorEdad.value = null;
      fEdad = true;
    } else {
      errorEdad.value = "Debe colocar una edad valida";
      fEdad = false;
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
      if (!fNombre ||
          !fEdad ||
          !fOrigen ||
          !fNacimiento ||
          !fTipo ||
          !fPareja) {
        submitFunc.value = null;
        validarNombre(famosoNombre.value);
        validarEdad(famosoEdad.value);
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
              edad: int.parse(famosoEdad.value),
              origen: famosoOrigen.value,
              fechaNacimiento: faNacimiento.value,
              tipo: famosoTipo.value,
              genero: famosoGenero.value,
              pareja: famosoPareja.value);
          _id = await ctrList.agregar(famoso);
          Get.back();
        } else {
          /// TODO: código para actualizar
        }
        if (_id!.isNotEmpty) {
          ctrNombre.value.text = "";
          ctrEdad.value.text = "";
          ctrOrigen.value.text = "";
          ctrNacimiento.value.text = "";
          ctrTipo.value.text = "";
          ctrPareja.value.text = "";
          Get.snackbar('Producto', mensaje);
        }
        return true;
      }
    };
  }
}
