import 'package:get/get.dart';
import 'package:trabalho_final_desenv_mobile/app/controllers/parking_spot_controller.dart';

class ControllerBinding implements Bindings  {

  @override
  void dependencies(){
    Get.lazyPut<ParkingSpotController>(() => ParkingSpotController());
  }

}