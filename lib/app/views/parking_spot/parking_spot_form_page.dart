import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';

import '../../components/menu.dart';
import '../../controllers/parking_spot_controller.dart';

class ParkingSpotFormPage extends StatefulWidget {
  const ParkingSpotFormPage({super.key});


  @override
  State<ParkingSpotFormPage> createState() => _ParkingSpotFormPageState();
}

class _ParkingSpotFormPageState extends State<ParkingSpotFormPage> {

  final ParkingSpotController _controller = ParkingSpotController.parkingSpotController;
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.gerarInstanciaVazia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('//TODO'),
      ),
      body:
        SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _controller.spot?.parkingSpotNumber ?? '',
                  decoration: const InputDecoration(labelText: 'Número da Vaga'),
                  onChanged: (value) {
                    _controller.spot?.parkingSpotNumber = value;
                  },
                ),
                TextFormField(
                  initialValue: _controller.spot?.licensePlateCar ?? '',
                  decoration: const InputDecoration(labelText: 'Placa do Carro'),
                  onChanged: (value) {
                    _controller.spot?.licensePlateCar = value;
                  },
                ),
                TextFormField(
                  initialValue: _controller.spot?.brandCar ?? '',
                  decoration: const InputDecoration(labelText: 'Marca'),
                  onChanged: (value) {
                    _controller.spot?.brandCar = value;
                  },
                ),
                TextFormField(
                  initialValue: _controller.spot?.modelCar ?? '',
                  decoration: const InputDecoration(labelText: 'Modelo'),
                  onChanged: (value) {
                    _controller.spot?.modelCar = value;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Data de Registro'),
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                TextFormField(
                  initialValue: _controller.spot?.colorCar ?? '',
                  decoration: const InputDecoration(labelText: 'Cor'),
                  onChanged: (value) {
                    _controller.spot?.colorCar = value;
                  },
                ),
                TextFormField(
                  initialValue: _controller.spot?.responsibleName ?? '',
                  decoration: const InputDecoration(labelText: 'Nome do Responsável'),
                  onChanged: (value) {
                    _controller.spot?.responsibleName = value;
                  },
                ),
                TextFormField(
                  initialValue: _controller.spot?.apartment ?? '',
                  decoration: const InputDecoration(labelText: 'Apartamento'),
                  onChanged: (value) {
                    _controller.spot?.apartment = value;
                  },
                ),
                TextFormField(
                  initialValue: _controller.spot?.block ?? '',
                  decoration: const InputDecoration(labelText: 'Block'),
                  onChanged: (value) {
                    _controller.spot?.block = value;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    bool isSuccess = await _controller.saveOrUpdateModel();
                    if(isSuccess){
                      Get.snackbar(
                        "Sucesso",
                        "Salvo com Sucesso",
                        icon: Icon(Icons.check, color: Colors.white),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.lightGreen,
                        colorText: Colors.white,
                      );
                    }else{
                      Get.snackbar(
                          "Erro",
                          "Houve um erro ao salvar.",
                          icon: Icon(Icons.error, color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.blue,
                          colorText: Colors.white
                      );
                    }
                    Get.back();
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        )
      )
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked.toString() != _dateController.text) {
      _dateController.text = picked.toString();
      _controller.spot?.registrationDate = picked;
    }
  }

}