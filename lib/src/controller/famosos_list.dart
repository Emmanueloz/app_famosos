import 'package:app_famosos/src/models/famoso_modelo.dart';
import 'package:app_famosos/src/services/famosos_service.dart';
import 'package:get/get.dart';

class FamososListController extends GetxController {
    var listaFamosos = <FamosoModelo>[].obs;
  FamososService service = FamososService(); // Corrección: ProductosService en lugar de ProoductsService

  @override
  void onInit() {
    super.onInit();
    var list = service.loadFamoso();
    list.then((value) => listaFamosos.value = value);
  }

  @override
  void refresh(){
    var list = service.loadFamoso();
    list.then((value) => listaFamosos.value = value);
  }
}
