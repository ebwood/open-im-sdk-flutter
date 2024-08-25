import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class IMManager {
  late ConversationManager conversationManager;
  late FriendshipManager friendshipManager;
  late MessageManager messageManager;
  late GroupManager groupManager;
  late UserManager userManager;

  late String userID;
  late UserInfo userInfo;
  bool isLogined = false;
  String? token;

  Future<bool?> init(
    InitConfig config,
    OnConnectListener listener, {
    String? operationID,
  });

  /// Initialize the SDK
  /// [platform] Platform ID [IMPlatform]
  /// [apiAddr] SDK API address
  /// [wsAddr] SDK WebSocket address
  /// [dataDir] SDK database storage directory
  /// [objectStorage] Object storage minio
  /// [logLevel] Log level, 1: no printing
  /// [enabledEncryption] true: encryption
  /// [enabledCompression] true: compression
  Future<dynamic> initSDK({
    required int platformID,
    required String apiAddr,
    required String wsAddr,
    required String dataDir,
    required OnConnectListener listener,
    int logLevel = 6,
    bool isCompression = false,
    bool isLogStandardOutput = true,
    String? logFilePath,
    String? operationID,
  });

  /// Deinitialize the SDK
  Future<dynamic> unInitSDK();

  /// Login
  /// [userID] User ID
  /// [token] Login token obtained from the business server
  /// [defaultValue] Default value to use if login fails
  Future<UserInfo> login({
    required String userID,
    required String token,
    String? operationID,
    Future<UserInfo> Function()? defaultValue,
    bool checkLoginStatus = true,
  });

  /// Logout
  Future<dynamic> logout({String? operationID});

  /// Get login status
  /// 1: logout 2: logging  3: logged
  Future<int?> getLoginStatus({
    String? operationID,
  });

  /// Get the current logged-in user ID
  Future<String> getLoginUserID() async => userID;

  /// Get the current logged-in user information
  Future<UserInfo> getLoginUserInfo() async => userInfo;

  /// [id] Same as [OnUploadFileListener] ID, to distinguish which file callback it is
  Future uploadFile({
    required String id,
    required String filePath,
    required String fileName,
    String? contentType,
    String? cause,
    String? operationID,
  });

  /// Update the Firebase client registration token
  /// [fcmToken] Firebase token
  Future updateFcmToken({
    required String fcmToken,
    required int expireTime,
    String? operationID,
  });

  /// 上传日志
  Future uploadLogs({
    String? ex,
    int line = 0,
    String? operationID,
  });

  void setUploadLogsListener(OnUploadLogsListener listener);

  void setUploadFileListener(OnUploadFileListener listener);

  ///
  Future setListenerForService(OnListenerForService listener);
}
