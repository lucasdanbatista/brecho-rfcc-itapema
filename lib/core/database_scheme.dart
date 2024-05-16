import 'package:collection/collection.dart';

abstract interface class DatabaseScheme {
  static const databaseName = 'main.db';
  static const globalConfigurations = 'pragma foreign_keys = on;';
  static final _schemes = [
    _DatabaseSchemeV1(),
  ];

  factory DatabaseScheme(int version) => _schemes.firstWhere((e) => e.version == version);

  factory DatabaseScheme.migrate(int oldVersion, int newVersion) = _MigrateDatabaseScheme;

  factory DatabaseScheme.latest() => _LatestDatabaseScheme(_schemes);

  int get version;

  List<String> get tables;
}

class _MigrateDatabaseScheme implements DatabaseScheme {
  final int oldVersion;
  final int newVersion;

  _MigrateDatabaseScheme(this.oldVersion, this.newVersion) : assert(oldVersion < newVersion);

  @override
  List<String> get tables {
    final tables = <String>[];
    var currentVersion = oldVersion;
    while (currentVersion != newVersion) {
      currentVersion++;
      final scheme = DatabaseScheme(currentVersion);
      tables.addAll(scheme.tables);
    }
    return tables;
  }

  @override
  int get version => newVersion;
}

class _LatestDatabaseScheme implements DatabaseScheme {
  final List<DatabaseScheme> schemes;

  _LatestDatabaseScheme(this.schemes);

  @override
  int get version => schemes.last.version;

  @override
  List<String> get tables => schemes.map((e) => e.tables).flattened.toList();
}

class _DatabaseSchemeV1 implements DatabaseScheme {
  @override
  final version = 1;

  @override
  List<String> get tables => [
        '''
          create table Wishlist(
            id varchar(100) primary key
          );
        ''',
      ];
}
