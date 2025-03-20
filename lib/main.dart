import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nucles_app/app/app.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kIsWeb,
      tools: const [DeviceSection(), SettingsSection()],
      builder: (BuildContext context) => const App(),
    ),
  );
}
