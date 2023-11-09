class ParkingSpotModel {

  String id;
  String parkingSpotNumber;
  String licensePlateCar;
  String brandCar;
  String modelCar;
  DateTime registrationDate;
  String colorCar;
  String responsibleName;
  String apartment;
  String block;

  ParkingSpotModel.empty() :
    id = '',
    parkingSpotNumber = '',
    licensePlateCar = '',
    brandCar = '',
    modelCar = '',
    registrationDate = DateTime(2023),
    colorCar = '',
    responsibleName = '',
    apartment = '',
    block = '';

  ParkingSpotModel(
    this.id,
    this.parkingSpotNumber,
    this.licensePlateCar,
    this.brandCar,
    this.modelCar,
    this.registrationDate,
    this.colorCar,
    this.responsibleName,
    this.apartment,
    this.block,
  );

  ParkingSpotModel.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        parkingSpotNumber = json['parkingSpotNumber'],
        licensePlateCar = json['licensePlateCar'],
        brandCar = json['brandCar'],
        modelCar = json['modelCar'],
        registrationDate = DateTime.parse(json['registrationDate']),
        colorCar = json['colorCar'],
        responsibleName = json['responsibleName'],
        apartment = json['apartment'],
        block = json['block'];

  Map<String, String> toJson() => {
      'id': id,
      'parkingSpotNumber' : parkingSpotNumber,
      'licensePlateCar' : licensePlateCar,
      'brandCar' : brandCar,
      'modelCar' : modelCar,
      'registrationDate' : registrationDate.toString(),
      'colorCar' : colorCar,
      'responsibleName' : responsibleName,
      'apartment' : apartment,
      'block' : block
  };

}