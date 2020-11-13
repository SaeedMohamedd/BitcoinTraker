import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url;
  Map<String, String> headerMap;
  NetworkHelper({this.url, this.headerMap});
  Future getData() async {
    http.Response responce = await http.get(url, headers: headerMap);
    if (responce.statusCode == 200) {
      dynamic data = responce.body;
      return jsonDecode(data);
    } else {
      print(responce.statusCode);
    }
  }
}
