import 'package:permission_handler/permission_handler.dart';

///Util for permission handling in application

// import 'dart:io';
// import 'package:permission_handler/permission_handler.dart' as ph;

// enum PermissionStatus {
//   granted,
//   denied;
// }

// extension XPermissionStatus on PermissionStatus {
//   bool get isGranted => this == PermissionStatus.granted;
//   bool get isDenied => this == PermissionStatus.denied;
// }

// enum _PermissionType {
//   photos,
//   notification,
//   camera,
// }

// PermissionStatus _fromPermissionHandler(ph.PermissionStatus permissionStatus) {
//   switch (permissionStatus) {
//     case ph.PermissionStatus.granted:
//     case ph.PermissionStatus.limited:
//       return PermissionStatus.granted;
//     case ph.PermissionStatus.denied:
//     case ph.PermissionStatus.restricted:
//     case ph.PermissionStatus.permanentlyDenied:
//       return PermissionStatus.denied;
//   }
// }

// /// Permission class is a wrapper for permission_handler package and others dependencies
// /// to be independent from the package / plugin in the future
// /// if we want to change the package, we can just change the implementation
// /// in this class without changing the code in other places.
// /// All the Platform checks should be done in this class
// abstract class Permission {
//   static Permission photoGallery = Permission._(_PermissionType.photos);
//   static Permission notification = Permission._(_PermissionType.notification);
//   static Permission camera = Permission._(_PermissionType.camera);

//   Permission();

//   factory Permission._(_PermissionType type) {
//     switch (type) {
//       case _PermissionType.photos:
//         return _ReadPhotoGalleryPermission();
//       case _PermissionType.notification:
//         return _NotificationPermission();
//       case _PermissionType.camera:
//         return _CameraPermission();
//     }
//   }

//   Future<PermissionStatus> request();
//   Future<PermissionStatus> status();

//   static Future<bool> openAppSettings() async {
//     return await ph.openAppSettings();
//   }
// }

// class _ReadPhotoGalleryPermission extends Permission {
//   @override
//   Future<PermissionStatus> request() async {
//     if (Platform.isIOS) {
//       final status = await ph.Permission.photos.request();
//       return _fromPermissionHandler(status);
//     } else if (Platform.isAndroid) {
//       final status = await ph.Permission.storage.request();
//       // on android 13 request is not showing prompt and always return denied
//       // even though the permission is granted.
//       // https://stackoverflow.com/a/73630987
//       // https://developer.android.com/about/versions/13/behavior-changes-13
//       final isAndroid13 = await DeviceInfoPlugin().androidVersion >= 13;
//       if (isAndroid13) {
//         return PermissionStatus.granted;
//       }
//       return _fromPermissionHandler(status);
//     } else {
//       throw UnimplementedError('Platform not implemented');
//     }
//   }

//   @override
//   Future<PermissionStatus> status() async {
//     if (Platform.isIOS) {
//       final status = await ph.Permission.photos.status;
//       return _fromPermissionHandler(status);
//     } else if (Platform.isAndroid) {
//       final status = await ph.Permission.storage.status;
//       // final isAndroid13 = await DeviceInfoPlugin().androidVersion >= 13;
//       // if (isAndroid13) {
//       //   return PermissionStatus.granted;
//       // }
//       return _fromPermissionHandler(status);
//     } else {
//       throw UnimplementedError('Platform not implemented');
//     }
//   }
// }

// class _NotificationPermission extends Permission {
//   @override
//   Future<PermissionStatus> request() async {
//     // if (Platform.isIOS || Platform.isAndroid) {
//     //   bool status =
//     //       await OneSignal.shared.promptUserForPushNotificationPermission();
//     //   return status ? PermissionStatus.granted : PermissionStatus.denied;
//     // } else {
//     //   throw UnimplementedError('Platform not implemented');
//     // }
//   }

//   @override
//   Future<PermissionStatus> status() async {
//     if (Platform.isIOS || Platform.isAndroid) {
//       final status = await ph.Permission.notification.status;
//       return _fromPermissionHandler(status);
//     } else {
//       throw UnimplementedError('Platform not implemented');
//     }
//   }
// }

// class _CameraPermission extends Permission {
//   @override
//   Future<PermissionStatus> request() async {
//     if (Platform.isIOS || Platform.isAndroid) {
//       final status = await ph.Permission.camera.request();
//       return _fromPermissionHandler(status);
//     } else {
//       throw UnimplementedError('Platform not implemented');
//     }
//   }

//   @override
//   Future<PermissionStatus> status() async {
//     if (Platform.isIOS || Platform.isAndroid) {
//       final status = await ph.Permission.camera.status;
//       return _fromPermissionHandler(status);
//     } else {
//       throw UnimplementedError('Platform not implemented');
//     }
//   }
// }

Future<PermissionStatus> getNotificationPermissionStatus() async {
  return await Permission.notification.status;
}