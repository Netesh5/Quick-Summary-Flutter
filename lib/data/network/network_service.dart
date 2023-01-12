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

  @override
  // ignore: non_constant_identifier_names
  Future getPostApiResponse(data) async {
    try {
      // final url = Uri.parse("https://api.openai.com/v1/completions");
      // final url =
      //     Uri.parse("https://gpt-summarization.p.rapidapi.com/summarize");
      final url = Uri.parse("https://portal.ayfie.com/api/summarize");
      final response = await http.post(url,
          headers: Headers.header,
          body: jsonEncode({
            // "model": "text-davinci-003",
            // // ignore: prefer_interpolation_to_compose_strings
            // "prompt": "Summerize the following \n" + data,
            // "temperature": 0,
            // "max_tokens": 100,
            // "top_p": 1.0,
            // "frequency_penalty": 0.0,
            // "presence_penalty": 0.0,
            // "stop": [" Human:", " AI:"]

            // -------
            // "text": data,
            // "num_sentences": 3,
            // -------
            "language": "auto",
            "text": data,
            "min_length": Inputvalue.minLength,
            "max_length": Inputvalue.maxLength,
          }));
      final newResponse = jsonDecode(response.body.toString());
      // debugPrint(newResponse.toString());
      //final result = newResponse['summary'];
      final result = newResponse;
      debugPrint(result.toString());
    } on SocketException catch (e) {
      throw FetchDataException("No Internet Connection");
    }
  }
}
