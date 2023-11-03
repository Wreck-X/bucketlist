import '../utils/constants.dart';
import '../utils/utils.dart';

class ProjRepository {
  Future<List> fetchData() async {
    try {
      List proj = Utils.stringToList(await api.get('projects/'));
      print(proj);
      servers = proj;
      return servers;
    } catch (e) {
      return [];
    }
  }
}
