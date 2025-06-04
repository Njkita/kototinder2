import 'package:get_it/get_it.dart';
import '../domain/repositories/cat_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<CatRepository>(CatRepository());
}