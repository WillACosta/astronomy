import 'package:permission_handler/permission_handler.dart';
import 'package:injectable/injectable.dart';

import '../../domain/services/permissions_service.dart';

@Injectable(as: PermissionsService)
class CPermissionsService implements PermissionsService {
  @override
  Future<bool> requestPermission({required PermissionsType type}) async {
    if (type == PermissionsType.storage) {
      var permission = await Permission.storage.request().isGranted;

      if (!permission) {
        await Permission.storage.request();
        permission = await Permission.storage.request().isGranted;
      }

      return permission;
    }

    return false;
  }
}
