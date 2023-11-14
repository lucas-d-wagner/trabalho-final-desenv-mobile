import 'package:get/get.dart';
import 'package:trabalho_final_desenv_mobile/app/models/parking_spot_model.dart';

import '../services/parking_spot_service.dart';

class ParkingSpotController extends GetxController {

  ParkingSpotService parkingSpotService = ParkingSpotService();

  var isLoading = false.obs;

  List<ParkingSpotModel> parkingSpotList = <ParkingSpotModel>[].obs;

  ParkingSpotModel? spot;

  static ParkingSpotController get parkingSpotController => Get.find();

  void setInstance(ParkingSpotModel spotModel) {
    spot = spotModel;
  }

  Future<dynamic> loadParkingSpotList()  async {
    parkingSpotList = <ParkingSpotModel>[].obs;
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
    var payload = spot?.toJson();
    if(isNew(spot!)) {
      isSuccess = await parkingSpotService.save(payload!);
    } else {
      isSuccess = await parkingSpotService.update(payload!);
    }
    isLoading.value = false;
    update();
    return isSuccess;
  }

  Future<bool> deleteModel(String id)  async {
    isLoading.value = true;
    bool isSuccess = await parkingSpotService.delete(id);
    isLoading.value = false;
    update();
    return isSuccess;
  }

  bool isNew(ParkingSpotModel spotModel) {
    final id = spotModel.id;
    return id == null || id.isEmpty;
  }

}