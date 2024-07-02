abstract interface class Environment {
  Uri get apiBaseUrl;

  factory Environment.auto() => ProductionEnvironment();
}

class ProductionEnvironment implements Environment {
  @override
  final apiBaseUrl = Uri.parse('https://rfcc.azurewebsites.net');
}

class StagingEnvironment implements Environment {
  @override
  final apiBaseUrl = Uri.parse(const String.fromEnvironment('API_BASE_URL'));
}
