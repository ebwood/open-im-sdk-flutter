import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/src/manager/im_manager.dart';
import 'package:flutter_openim_sdk/src/openim_platform_interface.dart';

import 'method_channel/im_manager.dart';

class MethodChannelOpenIM extends OpenIMPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_openim_sdk');

  late final IMManager _iMManager;

  MethodChannelOpenIM() : super() {
    _iMManager = MethodChannelIMManager(methodChannel);
  }

  @override
  IMManager get iMManager => _iMManager;
}
