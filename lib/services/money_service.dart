import 'dart:convert';
import 'package:conversor_moeda/models/result.dart';
import 'package:http/http.dart' as http;

class MoneyService {
  static getData() async {
    http.Response response = await http.get("https://api.hgbrasil.com/finance");

    var oi = response.body;
    final map = jsonDecode(oi);
    return Result.fromJson(map["results"]);
  }
}
