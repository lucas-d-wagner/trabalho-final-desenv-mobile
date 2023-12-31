import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trabalho_final_desenv_mobile/app/models/parking_spot_model.dart';

class ParkingSpotService{

  final String _urlGetList = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/list";
  final String _urlPostSave = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/save";
  final String _urlPostEdit = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/edit";
  final String _urlDelete = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/";

  dynamic _response;

  Future<dynamic> fetchParkingSpotList() async {
    _response = await http.get(Uri.parse(_urlGetList));
    if (_response.statusCode == 200) {

      var list = json.decode(_response.body);
      List<ParkingSpotModel> parkingSpotList = [];
      for (var item in list) {
        parkingSpotList.add((ParkingSpotModel.fromJson(item)));
      }

      return parkingSpotList;

    } else {
      throw Exception('Failed to load List');
    }
  }

  Future<bool> save(Map<String, String> data) async {
    data.remove('id');
    data.remove('registrationDate');
    _response = await http.post(
      Uri.parse(_urlPostSave),
      body: json.encode(data),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );

    if (_response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> update(Map<String, String> data) async {
    data.remove('registrationDate');
    _response = await http.post(
        Uri.parse(_urlPostEdit),
        body: json.encode(data),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );

    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> delete(String id) async {
    _response = await http.delete(
        Uri.parse(_urlDelete + id),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );

    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


}