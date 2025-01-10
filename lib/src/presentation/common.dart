import 'package:dgis_mobile_sdk_full/dgis.dart' as sdk;
import 'package:permission_handler/permission_handler.dart';

// SDK is initialized here. If you need to modify parameters of initialization,
// do it in initializeSdk() method.

Future<void> checkLocationPermissions(
    sdk.LocationService locationService,
    ) async {
  final permission = await Permission.location.request();
  if (permission.isGranted) {
    locationService.onPermissionGranted();
  }
}

class AppContainer {
  static sdk.Context? _sdkContext;

  sdk.Context initializeSdk() {
    _sdkContext ??= sdk.DGis.initialize(
      logOptions: const sdk.LogOptions(
        systemLevel: sdk.LogLevel.verbose,
        customLevel: sdk.LogLevel.verbose,
      ),
    );
    return _sdkContext!;
  }
}
