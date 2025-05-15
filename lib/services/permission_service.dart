// TODO Implement this library.
import 'package:permission_handler/permission_handler.dart';

  class PermissionService {
    Future<bool> requestPhotosPermission() async {
      var status = await Permission.photos.status;
      if (!status.isGranted) {
        status = await Permission.photos.request();
      }
      return status.isGranted;
    }

    Future<bool> requestCameraPermission() async {
      var status = await Permission.camera.status;
      if (!status.isGranted) {
        status = await Permission.camera.request();
      }
      return status.isGranted;
    }

    Future<bool> requestMicrophonePermission() async {
      var status = await Permission.microphone.status;
      if (!status.isGranted) {
        status = await Permission.microphone.request();
      }
      return status.isGranted;
    }

    // Add more as needed, e.g., storage for saving files if not using file_picker's save dialog
  }
  