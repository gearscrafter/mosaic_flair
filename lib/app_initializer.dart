import 'core/app_config.dart';

class AppInitializer {
  static final AppInitializer _instance = AppInitializer._internal();

  factory AppInitializer() {
    return _instance;
  }

  AppInitializer._internal();

  Future<void> initialize(
      {required String path, bool useJsonConfig = true}) async {
    await AppConfig().load(path, useJsonConfig: useJsonConfig);
  }
}
