enum PermissionsType { storage }

abstract class PermissionsService {
  Future<bool> requestPermission({required PermissionsType type});
}