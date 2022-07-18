import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkingHelper {
  NetworkingHelper({required this.openWeatherUrl});
  final String openWeatherUrl;

  Future<String> getData() async {
    var url = Uri.parse(openWeatherUrl);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return response.statusCode.toString();
    }
  }
}
