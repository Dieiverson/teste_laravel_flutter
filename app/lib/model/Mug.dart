import 'dart:convert';

import 'package:http/http.dart' as http;

class Mug {
  //Modificar para o IP da máquina que está rodando a aplicação docker
  static const String IP = '192.168.1.107';

  static Future<int> getQuantity() async {
    try {
      var url = Uri.http(IP, 'api/getQuantity');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return jsonResponse['quantity'];
      } else {
        throw Exception("Status code error:${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> remove() async {
    try {
      var url = Uri.http(IP, 'api/remove');
      var response = await http.post(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return jsonResponse['quantity'];
      } else {
        throw Exception("Status code error:${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> add() async {
    try {
      var url = Uri.http(IP, 'api/add');
      var response = await http.post(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return jsonResponse['quantity'];
      } else {
        throw Exception("Status code error:${response.statusCode}");
      }
    } catch (ex) {
      rethrow;
    }
  }
}
