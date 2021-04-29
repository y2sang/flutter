import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<dynamic> getData(Location location) async {
    var url = Uri.parse(this.url);
    String data;
    var decodedData;
    Map<String, String> headers = {};
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      data = response.body;
      decodedData = jsonDecode(data);
    } else {
      print(response.statusCode);
    }

    return decodedData;
  }
}
