import 'package:get/get.dart';

class FamosoController extends GetxController {
  final RxString nombre = "".obs;
  final RxInt edad = 0.obs;
  final RxString lugarOrigen = "".obs;
  final Rx<DateTime> fechaNacimiento = DateTime.now().obs;
  final RxString tipoFamoso = "".obs;
  final RxString genero = "".obs;
  final RxString pareja = "".obs;
}
