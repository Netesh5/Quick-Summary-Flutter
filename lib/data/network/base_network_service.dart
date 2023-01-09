abstract class BaseNetworkService {
  Future<dynamic> getGetApiResponse(String Url);
  Future<dynamic> getPostApiResponse(String Url, dynamic data);
}
