import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quicksummary/data/network/base_network_service.dart';
import 'package:http/http.dart' as http;
import 'package:quicksummary/data/network/constant/constant.dart';
import 'package:quicksummary/view/homepage/widgets/input_field.dart';

import '../app_exception.dart';

class NetworkService extends BaseNetworkService {
  @override
  // ignore: non_constant_identifier_names
  Future getGetApiResponse(String Url) {
    throw UnimplementedError();
  }

  static Map<String, dynamic>? result;
  @override
  // ignore: non_constant_identifier_names
  Future getPostApiResponse(data) async {
    try {
      final url = Uri.parse(
          "https://text-analysis12.p.rapidapi.com/summarize-text/api/v1.1");
      final response = await http.post(url,
          headers: Headers.header,
          body: jsonEncode({
            "language": "english",
            "summary_percent": Inputvalue.percentage ?? 50,
            "text": data
          }));
      final newResponse = jsonDecode(response.body.toString());

      result = newResponse;
      debugPrint(result.toString());
    } on SocketException catch (e) {
      throw FetchDataException("No Internet Connection");
    }
  }
  //value
}
