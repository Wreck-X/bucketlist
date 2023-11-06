import '../utils/constants.dart';
import '../utils/utils.dart';

class ProjRepository {
  Future<List> fetchData(String org_uid) async {
    try {
      final response = await api.get_projects('projects/', org_uid);
      final projects = parseResponse(response);
      return projects;
    } catch (e) {
      print("Error parsing response: $e");
      return [];
    }
  }
}
