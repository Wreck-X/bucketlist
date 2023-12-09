import '../models/session_token.dart';
import '../repositories/my_orgs.dart';
import '../services/ApiServices.dart';

TokenStorage CSRF_TOKEN = TokenStorage();
TokenStorage session_token = TokenStorage();
String base_url = 'django-beacon.vercel.app';
ApiService api = ApiService(baseUrl: base_url);
final OrgRepository org_repo = OrgRepository();
List<dynamic> servers = [];
List<dynamic> projects = [];
String selected_org = '';
