import 'package:app_famosos/src/models/pelicula_modelo.dart';
import 'package:app_famosos/src/services/peliculas_service.dart';
import 'package:get/get.dart';

class PeliculasListController extends GetxController {
  var listPeliculas = <PeliculaModelo>[].obs;
  PeliculaService service = PeliculaService();

  @override
  void onInit() {
    super.onInit();
    var list = service.loadPeliculas();
    list.then((value) => listPeliculas.value = value);
  }

  @override
  void refresh() {
    var list = service.loadPeliculas();
    list.then((value) => listPeliculas.value = value);
  }

  Future<String?> agregar(PeliculaModelo pelicula) async {
    String? id = await service.createPelicula(pelicula);
    pelicula.id = id;
    print(id);
    listPeliculas.add(pelicula);
    return id;
  }
}
