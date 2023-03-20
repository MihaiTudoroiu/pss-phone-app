import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "http://plantsupervisorsystem.go.ro:9090/login";

    try {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode(requestModel.toJson()));

      print('status code: ' + response.statusCode.toString());

      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401) {
        return LoginResponseModel.fromJson(
          json.decode(response.body),
        );
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      print('error caught1: $e');

      return LoginResponseModel(token: "", error: "$e");
    }
  }
}
