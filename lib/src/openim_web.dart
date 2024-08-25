import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'manager/im_manager.dart';
import 'openim_platform_interface.dart';
import 'web/im_manager.dart';

class OpenIMWeb extends OpenIMPlatform {
  late final IMManager _iMManager;

  OpenIMWeb() {
    _iMManager = WebIMManager();
  }

  static void registerWith(Registrar registrar) {
    OpenIMPlatform.instance = OpenIMWeb();
  }

  @override
  IMManager get iMManager => _iMManager;

  String getData() => "我是web啊";
}
