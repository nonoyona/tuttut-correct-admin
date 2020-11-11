
class ApiService {
  static final instance = ApiService._();
  ApiService._();


  Future<String> fetchGroupName(String groupId) async {
    await Future.delayed(Duration(milliseconds: 1000));
    return "SKP Gruppe 1";
  }

  

  

  

  
}
