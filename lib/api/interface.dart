abstract class ApiInterface {
  Future get(String path);
  Future post(String path, dynamic data);
  Future delete(String path);
  Future update(String path, dynamic data);
}
