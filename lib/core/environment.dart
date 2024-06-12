abstract interface class Environment {
  Uri get apiBaseUrl;

  factory Environment.auto() => ProductionEnvironment();
}

class ProductionEnvironment implements Environment {
  @override
  final apiBaseUrl = Uri.parse('https://rfccitapema.lucasbatista.me');
}

class StagingEnvironment implements Environment {
  @override
  final apiBaseUrl = Uri.parse(const String.fromEnvironment('API_BASE_URL'));
}
