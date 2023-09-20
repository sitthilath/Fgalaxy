abstract class PermissionService {
  Future<void> requestCameraAndStoragePermission();
  Future<void> requestLocationPermission();
  Future<bool> checkPermissionCameraAndStorage();
  Future<bool> checkPermissionLocation();
}