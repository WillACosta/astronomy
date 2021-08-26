import '../../domain/entities/user_preferences.dart';

abstract class LocalDataSource {
  Future<UserPreferences> readPreferences();
  void setPreferences({required UserPreferences value});
}