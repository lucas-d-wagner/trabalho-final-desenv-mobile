import 'package:get/get.dart';
import 'package:trabalho_final_desenv_mobile/app/models/parking_spot_model.dart';

import '../services/parking_spot_service.dart';

class ParkingSpotController extends GetxController {

  ParkingSpotService parkingSpotService = ParkingSpotService();

  var isLoading = false.obs;

  List<ParkingSpotModel> parkingSpotList = <ParkingSpotModel>[].obs;

  ParkingSpotModel? spot;

  static ParkingSpotController get parkingSpotController => Get.find();

  void gerarInstanciaVazia() {
    spot = ParkingSpotModel.empty();
  }

  Future<dynamic> loadParkingSpotList()  async {
    isLoading.value = true;
    var list = await parkingSpotService.fetchParkingSpotList();
    parkingSpotList.addAll(list);
    isLoading.value = false;
    update();
    return parkingSpotList;
  }

  Future<bool> saveOrUpdateModel()  async {
    bool isSuccess = false;

    isLoading.value = true;
    if(isNew(spot!)) {
      var payload = spot?.toJson();
      isSuccess = await parkingSpotService.save(payload!);
    } else {
      //atualizar
    }
    isLoading.value = false;
    update();
    return isSuccess;
  }

  bool isNew(ParkingSpotModel spotModel) {
    final id = spotModel.id;
    return id == null || id.isEmpty;
  }

}