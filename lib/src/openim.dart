import 'package:flutter_openim_sdk/src/openim_platform_interface.dart';

class OpenIM {
  static const version = '3.8.1-rc.0';

  static final iMManager = OpenIMPlatform.instance.iMManager;

  OpenIM._();
}
