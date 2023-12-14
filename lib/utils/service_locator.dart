import 'package:get_it/get_it.dart';
import 'package:testassign/utils/api_util.dart';

export 'package:testassign/utils/api_util.dart';

final getIt = GetIt.instance;

void initServices() {
  getIt.registerLazySingleton<ApiUtil>(() => ApiUtil()..init());
}
