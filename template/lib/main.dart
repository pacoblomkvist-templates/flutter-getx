import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/app.dart';
import 'app/routes/app_pages.dart';
import 'config/build_config.dart';
import 'config/env_config.dart';
import 'config/environment.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "FBlmk Template",
    baseUrl: "https://api",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const App());
}
