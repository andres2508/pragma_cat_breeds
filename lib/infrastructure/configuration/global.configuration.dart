class GlobalPragmaConfiguration {
  String _apiKey = "bda53789-d59e-46cd-9bc4-2936630fde39";
  String _server = 'https://api.thecatapi.com';

  static final GlobalPragmaConfiguration controller =
      GlobalPragmaConfiguration._intern();

  GlobalPragmaConfiguration._intern();

  factory GlobalPragmaConfiguration() {
    return controller;
  }

  String get apiServer => '$_server/v1';

  String get apikey => _apiKey;
}
