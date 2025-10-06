import 'package:toc_module/toc/model/toc_config_model.dart';

class TocModuleService {
  static TocConfigModel? _config;

  static void initialize(TocConfigModel config) {
    _config = config;
  }

  static TocConfigModel get config {
    if (_config == null) throw Exception("Not initialized");
    return _config!;
  }
}
