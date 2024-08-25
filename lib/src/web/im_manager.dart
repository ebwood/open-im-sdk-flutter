import 'package:flutter_openim_sdk/src/listener/connect_listener.dart';
import 'package:flutter_openim_sdk/src/listener/listener_for_service.dart';
import 'package:flutter_openim_sdk/src/listener/upload_file_listener.dart';
import 'package:flutter_openim_sdk/src/manager/im_manager.dart';
import 'package:flutter_openim_sdk/src/models/init_config.dart';
import 'package:flutter_openim_sdk/src/models/user_info.dart';

class WebIMManager extends IMManager {
  @override
  Future<int?> getLoginStatus({String? operationID}) {
    // TODO: implement getLoginStatus
    throw UnimplementedError();
  }

  @override
  Future<bool?> init(InitConfig config, OnConnectListener listener, {String? operationID}) {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future initSDK({required int platformID, required String apiAddr, required String wsAddr, required String dataDir, required OnConnectListener listener, int logLevel = 6, bool isCompression = false, bool isLogStandardOutput = true, String? logFilePath, String? operationID}) {
    // TODO: implement initSDK
    throw UnimplementedError();
  }

  @override
  Future<UserInfo> login({required String userID, required String token, String? operationID, Future<UserInfo> Function()? defaultValue, bool checkLoginStatus = true}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future logout({String? operationID}) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future setListenerForService(OnListenerForService listener) {
    // TODO: implement setListenerForService
    throw UnimplementedError();
  }

  @override
  void setUploadFileListener(OnUploadFileListener listener) {
    // TODO: implement setUploadFileListener
  }

  @override
  void setUploadLogsListener(OnUploadLogsListener listener) {
    // TODO: implement setUploadLogsListener
  }

  @override
  Future unInitSDK() {
    // TODO: implement unInitSDK
    throw UnimplementedError();
  }

  @override
  Future updateFcmToken({required String fcmToken, required int expireTime, String? operationID}) {
    // TODO: implement updateFcmToken
    throw UnimplementedError();
  }

  @override
  Future uploadFile({required String id, required String filePath, required String fileName, String? contentType, String? cause, String? operationID}) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }

  @override
  Future uploadLogs({String? ex, int line = 0, String? operationID}) {
    // TODO: implement uploadLogs
    throw UnimplementedError();
  }
}
