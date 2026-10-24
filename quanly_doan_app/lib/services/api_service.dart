import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/LoaiDeTai.dart';
import '../models/ChuyenNganh.dart';

class ApiService {
  static Future<List<LoaiDeTai>> getLoaiDeTai() async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:5096/api/LoaiDeTai"),
    );

    List data = jsonDecode(response.body);

    return data.map((e) => LoaiDeTai.fromJson(e)).toList();
  }

  static Future<List<ChuyenNganh>> getChuyenNganh(String maLoai) async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:5096/api/ChuyenNganh/$maLoai"),
    );

    List data = jsonDecode(response.body);

    return data.map((e) => ChuyenNganh.fromJson(e)).toList();
  }
}
