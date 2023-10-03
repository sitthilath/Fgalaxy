import 'package:galaxy_18_lottery_app/shared/permissions/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionImpl implements PermissionService {
  @override
  Future<bool> checkPermissionCameraAndStorage() async {
    bool permission = false;
    if (await Permission.camera.isGranted &&
        await Permission.storage.isGranted) {
      permission = true;
    }
    return Future.value(permission);
  }

  @override
  Future<bool> checkPermissionLocation() async {
    bool permission = false;
    if (await Permission.location.isGranted) {
      permission = true;
    }
    return Future.value(permission);
  }

  @override
  Future<void> requestCameraAndStoragePermission() async {
    await Permission.camera.request();
    await Future.delayed(const Duration(milliseconds: 200), () async {
      await Permission.storage.request();
    });
  }

  @override
  Future<void> requestLocationPermission() async {
    await Permission.location.request();
  }
}
