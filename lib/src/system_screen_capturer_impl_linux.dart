import 'dart:io';

import 'capture_mode.dart';
import 'system_screen_capturer.dart';

final Map<CaptureMode, List<String>> _knownCaptureModeArgs = {
  CaptureMode.region: ['-s'],
  CaptureMode.screen: [],
  CaptureMode.window: ['-w'],
};

class SystemScreenCapturerImplLinux extends SystemScreenCapturer {
  SystemScreenCapturerImplLinux();

  @override
  Future<void> capture({
    required String imagePath,
    CaptureMode mode = CaptureMode.region,
    bool silent = true,
  }) async {
    await Process.run(
      'maim',
      [
        ..._knownCaptureModeArgs[mode]!,
        imagePath,
      ],
    );
  }
}
