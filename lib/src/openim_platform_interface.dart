import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'openim_method_channel.dart';

abstract class OpenIMPlatform extends PlatformInterface {
  /// Constructs a OpenIMPlatform.
  OpenIMPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenIMPlatform _instance = MethodChannelOpenIM();

  /// The default instance of [OpenIMPlatform] to use.
  ///
  /// Defaults to [MethodChannelHello].
  static OpenIMPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpenIMPlatform] when
  /// they register themselves.
  static set instance(OpenIMPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String getData() => "你好，你是哪位啊";

  IMManager get iMManager;
}
