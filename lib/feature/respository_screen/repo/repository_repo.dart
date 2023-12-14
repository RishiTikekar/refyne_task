import 'package:testassign/utils/service_locator.dart';

class RepositoriesRepo {
  ApiUtil _util = getIt<ApiUtil>();

  Future<List?> getRepositoryList() async {
    return (await _util.get(
      path: 'search/repositories',
      queryParams: {'q': '?flutter'},
    ))['items'];
  }
}
