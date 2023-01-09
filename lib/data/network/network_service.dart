import 'dart:convert';
import 'dart:io';
import 'package:quicksummary/data/network/base_network_service.dart';
import 'package:http/http.dart' as http;
import 'package:quicksummary/data/network/constant/constant.dart';

import '../app_exception.dart';

class NetworkService extends BaseNetworkService {
  @override
  // ignore: non_constant_identifier_names
  Future getGetApiResponse(String Url) {
    throw UnimplementedError();
  }

  @override
  // ignore: non_constant_identifier_names
  Future getPostApiResponse(data) async {
    try {
      final url = Uri.parse("https://api.openai.com/v1/completions");
      final response = await http.post(url,
          headers: Headers.header,
          body: jsonEncode({
            "model": "text-davinci-003",
            "prompt": data,
            "temperature": 0.7,
            "max_tokens": 64,
            "top_p": 1.0,
            "frequency_penalty": 0.0,
            "presence_penalty": 0.0
          }));
      Map<String, dynamic> newResponse = jsonDecode(response.body);
      return newResponse;
    } on SocketException catch (e) {
      throw FetchDataException("No Internet Connection");
    }
  }
}
