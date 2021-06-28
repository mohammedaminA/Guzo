import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestHelper {
  static Future<dynamic> getRequest(String url) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var decodedData = jsonDecode(jsonData);
      return decodedData;
    } else {
      return "failed";s
    }
  }
}
