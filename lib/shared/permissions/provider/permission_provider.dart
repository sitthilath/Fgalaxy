import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/permissions/permission_service.dart';
import 'package:galaxy_18_lottery_app/shared/permissions/permissions_impl.dart';

final permissionProvider = Provider<PermissionService>((ref){
  final permission = PermissionImpl();
  return permission;
});