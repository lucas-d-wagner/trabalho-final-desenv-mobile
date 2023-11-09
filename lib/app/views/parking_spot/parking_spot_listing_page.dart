import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:trabalho_final_desenv_mobile/app/views/parking_spot/parking_spot_form_page.dart';

import '../../components/menu.dart';
import '../../controllers/parking_spot_controller.dart';

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
        body: Obx(() => _controller.isLoading.value ? const Center(child: CircularProgressIndicator()) : DataTable(
          columns: const [
            DataColumn(label: Text('Vaga')),
            DataColumn(label: Text('Placa')),
            DataColumn(label: Text('Responsável')),
          ],
          rows: _controller.parkingSpotList.map((spot) {
            return DataRow(cells: [
              DataCell(Text(spot.parkingSpotNumber)),
              DataCell(Text(spot.licensePlateCar)),
              DataCell(Text(spot.responsibleName)),
            ]);
          }).toList(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const ParkingSpotFormPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}