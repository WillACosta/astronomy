abstract class LocalDataSource {
  void setPreferences({required String key, required String value});
  void readPreferences();
}