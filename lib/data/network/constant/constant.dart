class APIKey {
  static const String apikey =
      "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";
}

class Headers {
  static Map<String, String> header = {
    'Content-Type': "application/json",
    'Authorization': "Bearer ${APIKey.apikey}"
  };
}
