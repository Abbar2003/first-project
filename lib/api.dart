import 'dart:convert';
import 'dart:typed_data';

import 'package:admin2/Themes.dart';
import 'package:http/http.dart' as http;

class Api {
  static String public_url = "http://127.0.0.1:8000";

  static get_request(String Url) async {
    final response = await http.get(
      Uri.parse('$public_url/api/$Url'),
      headers: {
        "Authorization": "Bearer ${Themes.getUserToken()}",
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );

    final decodedResponse = json.decode(response.body);
    return decodedResponse;
  }

  static post_request_with_token_using_json(String Url, Object Body) async {
    final jsonData = json.encode(Body);
    final response = await http.post(
      Uri.parse('$public_url/api/$Url'),
      headers: {
        "Authorization": "Bearer ${Themes.getUserToken()}",
      },
      body: jsonData,
    );
    final decodedResponse = json.decode(response.body);
    return decodedResponse;
  }

  static post_request_with_token(String Url, Object Body) async {
    final response = await http.post(
      Uri.parse('$public_url/api/$Url'),
      headers: {
        "Authorization": "Bearer ${Themes.getUserToken()}",
      },
      body: Body,
    );
    final decodedResponse = json.decode(response.body);
    return decodedResponse;
  }

  static post_request_without_token(String Url, Object Body) async {
    final response = await http.post(
      Uri.parse('$public_url/api/$Url'),
      body: Body,
    );
    final decodedResponse = json.decode(response.body);
    return decodedResponse;
  }

  static post_request_with_files(String Url, Map<String, String>? Body,
      String field, String filePath) async {
    final request =
        http.MultipartRequest('POST', Uri.parse('$public_url/api/$Url'));
    request.files.add(
      await http.MultipartFile.fromPath(field, filePath),
    );

    //? You might need to include an Authorization header with the student's token
    request.headers['Authorization'] = "Bearer ${Themes.getUserToken()}";

    if (Body != null) {
      request.fields.addAll(Body);
    }

    final response = await request.send();
    return response;
  }

  // mobile request :
  static post_request_with_files_using_json(
      String Url, Object? Body, String field, String filePath) async {
    final request =
        http.MultipartRequest('POST', Uri.parse('$public_url/api/$Url'));
    request.files.add(
      await http.MultipartFile.fromPath(field, filePath),
    );

    //? You might need to include an Authorization header with the student's token
    request.headers['Authorization'] = "Bearer ${Themes.getUserToken()}";

    if (Body != null) {
      final jsonData = json.encode(Body);
      request.fields['json_data'] = jsonData;
    }

    final response = await request.send();
    return response;
  }

  // web request :
  static post_request_with_files_using_bytes(String Url, Object? Body,
      String field, Uint8List fileBytes) async {
    final request =
        http.MultipartRequest('POST', Uri.parse('$public_url/api/$Url'));
    request.files.add(
      http.MultipartFile.fromBytes(field, fileBytes),
    );

    //? You might need to include an Authorization header with the student's token
    request.headers['Authorization'] = "Bearer ${Themes.getUserToken()}";

    if (Body != null) {
      final jsonData = json.encode(Body);
      request.fields['json_data'] = jsonData;
    }

    final response = await request.send();
    return response;
  }
}
