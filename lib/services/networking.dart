import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkingHelper {
  NetworkingHelper({required this.openWeatherUrl});
  final String openWeatherUrl;

  Future<dynamic> getData() async {
    var url = Uri.parse(openWeatherUrl);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print('取得成功');
      return jsonDecode(data);
    } else {
      print('取得失敗');
      return response.statusCode.toString();
    }
  }
}
