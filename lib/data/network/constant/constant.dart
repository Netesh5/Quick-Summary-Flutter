class APIKey {
  // static const String apikey =
  //     "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";
  static const String apikey =
      'd83ac41cb1msh02d38254c7d5f4cp18e066jsne1c62a888b55';
}

class Headers {
  static Map<String, String> header = {
    'Content-Type': "application/json",
    // 'Authorization': "Bearer ${APIKey.apikey}"
    'X-Rapidapi-Key': APIKey.apikey,
    'X-Rapidapi-Host': 'gpt-summarization.p.rapidapi.com',
  };
}
