import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  Future<bool> storagePermission() async {
    final DeviceInfoPlugin info = DeviceInfoPlugin();
    bool havePermission = false;

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await info.androidInfo;
      final int androidVersion = int.parse(androidInfo.version.release);
      if (androidVersion >= 13) {
        final request = await [
          Permission.videos,
          Permission.photos,
        ].request();

        havePermission = request.values
            .every((status) => status == PermissionStatus.granted);
      } else {
        final status = await Permission.storage.request();
        havePermission = status.isGranted;
      }
      if (!havePermission) {
        await openAppSettings();
      }
    } else {
      final request = await [
        Permission.videos,
        Permission.photos,
        Permission.storage
      ].request();

      havePermission =
          request.values.every((status) => status == PermissionStatus.granted);
    }
    return havePermission;
  }
}
