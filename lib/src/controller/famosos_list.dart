import 'package:app_famosos/src/models/famoso_modelo.dart';
import 'package:app_famosos/src/services/famosos_service.dart';
import 'package:get/get.dart';

class FamososListController extends GetxController {
  var listFamosos = <FamosoModelo>[].obs;
  FamososService service = FamososService();

  @override
  void onInit() {
    super.onInit();
    var list = service.loadFamoso();
    list.then((value) => listFamosos.value = value);
  }

  @override
  void refresh() {
    var list = service.loadFamoso();
    list.then((value) => listFamosos.value = value);
  }

  Future<String?> agregar(FamosoModelo famoso) async {
    String? id = await service.createFamoso(famoso);
    famoso.id = id;
    print(id);
    listFamosos.add(famoso);
    return id;
  }
  void delete(FamosoModelo value){
    service.deleteFamoso(value);
  }
}
