import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelTest {
  bool? status;
  List<Data>? data;
  String? message;

  ModelTest({this.status, this.data, this.message});

  factory ModelTest.fromJson(Map<String, dynamic> json) {
    List<Data> dataArray = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        dataArray.add(Data.fromJson(v));
      });
    }
    return ModelTest(
        status: json['status'], data: dataArray, message: json['message']);
  }

  static Future<ModelTest> allData() async {
    var endpoint =
        Uri.parse("http://jamaah.resotim.com/api/GoummatApi/allGampong");

    var apiResult = await http.post(endpoint);
    var jsonObject = json.decode(apiResult.body);
    return ModelTest.fromJson(jsonObject);
  }
}

class Data {
  String? idGampong;
  String? idKecamatan;
  String? gampong;
  String? totalJamaah;

  Data({this.idGampong, this.idKecamatan, this.gampong, this.totalJamaah});

  Data.fromJson(Map<String, dynamic> json) {
    idGampong = json['id_gampong'];
    idKecamatan = json['id_kecamatan'];
    gampong = json['gampong'];
    totalJamaah = json['total_anggota'];
  }
}
