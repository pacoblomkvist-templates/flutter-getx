import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/config/build_config.dart';
import 'package:template/config/env_config.dart';

import 'routes/app_pages.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final EnvConfig _envConfig = BuildConfig.instance.config;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.appName,
      initialRoute: AppPages.INITIAL,
      initialBinding: null,
      getPages: AppPages.routes,
      theme: null,
      debugShowCheckedModeBanner: false,
    );
  }
}
