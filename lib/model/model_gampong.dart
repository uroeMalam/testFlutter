import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelGampong {
  bool? status;
  List<Data>? data;
  String? message;

  ModelGampong({this.status, this.data, this.message});

  factory ModelGampong.fromJson(Map<String, dynamic> json) {
    List<Data> dataArray = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        dataArray.add(Data.fromJson(v));
      });
    }
    return ModelGampong(
        status: json['status'], data: dataArray, message: json['message']);
  }

  static Future<ModelGampong> allData() async {
    var endpoint =
        Uri.parse("http://jamaah.resotim.com/api/GoummatApi/allGampong");

    var apiResult = await http.post(endpoint);
    var jsonObject = json.decode(apiResult.body);
    return ModelGampong.fromJson(jsonObject);
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
