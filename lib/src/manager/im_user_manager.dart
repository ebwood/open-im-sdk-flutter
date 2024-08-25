import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class UserManager {
  late OnUserListener listener;

  /// User profile change listener
  Future setUserListener(OnUserListener listener);

  /// Get user information
  /// [userIDList] List of user IDs
  Future<List<FullUserInfo>> getUsersInfo({
    required List<String> userIDList,
    String? operationID,
  });

  /// Get information of the currently logged-in user
  Future<UserInfo> getSelfUserInfo({
    String? operationID,
  });

  /// Modify the profile of the currently logged-in user
  /// [nickname] Nickname
  /// [faceURL] Profile picture
  /// [appManagerLevel]
  /// [ex] Additional fields
  Future<String?> setSelfInfo({
    String? nickname,
    String? faceURL,
    int? appManagerLevel,
    String? ex,
    String? operationID,
  });

  Future<List<UserStatusInfo>> subscribeUsersStatus(
    List<String> userIDs, {
    String? operationID,
  });

  Future unsubscribeUsersStatus(
    List<String> userIDs, {
    String? operationID,
  });

  Future<List<UserStatusInfo>> getSubscribeUsersStatus({
    String? operationID,
  });

  Future<List<UserStatusInfo>> getUserStatus(
    List<String> userIDs, {
    String? operationID,
  });

  Future<List<FullUserInfo>> getUsersInfoWithCache(
    List<String> userIDs, {
    String? groupID,
    String? operationID,
  });

/*
  Future<String?> setSelfUserInfoEx(
    UserInfo userInfo, {
    String? operationID,
  }) {
    return _channel.invokeMethod(
        'setSelfUserInfoEx',
        _buildParam({
          ...userInfo.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        }));
  }
*/
}
