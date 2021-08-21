import '../infraestructure/datasources/local_data_source.dart';

class CLocalDataSource implements LocalDataSource {
  @override
  void setPreferences({required String key, required String value}) {
    // Recuperar instancia do box hive
  }

  @override
  void readPreferences() {}
}
