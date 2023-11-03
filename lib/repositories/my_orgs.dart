import '../utils/constants.dart';
import '../utils/utils.dart';

class OrgRepository {
  Future<List> fetchData() async {
    try {
      List org = Utils.stringToList(await api.get('orgs/'));
      print(org);
      servers = org;
      return servers;
    } catch (e) {
      return [];
    }
  }
}
