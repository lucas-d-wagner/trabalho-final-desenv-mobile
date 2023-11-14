import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:trabalho_final_desenv_mobile/app/views/parking_spot/parking_spot_form_page.dart';

import '../../components/menu.dart';
import '../../controllers/parking_spot_controller.dart';
import '../../models/parking_spot_model.dart';

class ParkingSpotListingPage extends StatefulWidget {
  const ParkingSpotListingPage({super.key});

  @override
  State<ParkingSpotListingPage> createState() => _ParkingSpotListingPageState();
}

class _ParkingSpotListingPageState extends State<ParkingSpotListingPage> {

  final ParkingSpotController _controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
    _controller.loadParkingSpotList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuWidget(),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Parking Spots'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
                () => _controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : DataTable(
              columns: const [
                DataColumn(label: Text('Vaga')),
                DataColumn(label: Text('Editar')),
                DataColumn(label: Text('Excluir')),
              ],
              rows: _controller.parkingSpotList.map((spot) {
                return DataRow(cells: [
                  DataCell(Text(spot.parkingSpotNumber)),
                  DataCell(IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Get.to(ParkingSpotFormPage(spotModel: spot));
                    },
                  )),
                  DataCell(IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      bool isSuccess = await _controller.deleteModel(spot.id);
                      if(isSuccess){
                        Get.snackbar(
                          "Sucesso",
                          "Deletado com Sucesso",
                          icon: Icon(Icons.check, color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.lightGreen,
                          colorText: Colors.white,
                        );
                      }else{
                        Get.snackbar(
                            "Erro",
                            "Houve um erro ao deletar.",
                            icon: Icon(Icons.error, color: Colors.white),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white
                        );
                      }
                      _controller.loadParkingSpotList();
                    },
                  )),
                ]);
              }).toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(ParkingSpotFormPage(spotModel: ParkingSpotModel.empty()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}