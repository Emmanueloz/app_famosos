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

  void actualizar(PeliculaModelo pelicula) async {
    await service.updatePeliculas(pelicula);
    int index =
        // ignore: invalid_use_of_protected_member
        listPeliculas.value.indexWhere((element) => element.id == pelicula.id);
    listPeliculas[index] = pelicula;
  }

  Future<String?> agregar(PeliculaModelo pelicula) async {
    String? id = await service.createPelicula(pelicula);
    pelicula.id = id;
    print(id);
    listPeliculas.add(pelicula);
    return id;
  }

  void delete(PeliculaModelo value) {
    service.deletePeliculas(value);
    int index =
        // ignore: invalid_use_of_protected_member
        listPeliculas.value.indexWhere((element) => element.id == value.id);
    listPeliculas.removeAt(index);
  }
}
