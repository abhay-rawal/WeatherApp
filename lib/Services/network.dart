import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Network {
  String url;
  Network({@required this.url});
  Future getWeatherData() async {
    var response = await http.get(this.url);
    return convert.jsonDecode(response.body);
  }
}
