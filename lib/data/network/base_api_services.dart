abstract class BaseApiServices{

  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future getPutApiResponse(String url, dynamic data);
  Future getDeleteApiResponse(String url);

}