import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Notify with ChangeNotifier {
  // void requestCameraPermission() async {
  //   /// status can either be: granted, denied, restricted or permanentlyDenied
  //   var status = await Permission.camera.status;
  //   if (status.isGranted) {
  //     print("Permission is granted");
  //   } else if (status.isDenied) {
  //     // We didn't ask for permission yet or the permission has been denied before but not permanently.
  //     if (await Permission.camera.request().isGranted) {
  //       // Either the permission was already granted before or the user just granted it.
  //       print("Permission was granted");
  //     }
  //   } else if (status.isPermanentlyDenied) {

  /// Request multiple permissions at once.
  /// In this case location & storage
  void requestMultiplePermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();
    print("location permission: ${statuses[Permission.location]}, "
        "storage permission: ${statuses[Permission.storage]}");
  }

  void requestPermissionWithOpenSettings() async {
    //if (await Permission.speech.isPermanentlyDenied) {
    openAppSettings();
    //}
  }
}
