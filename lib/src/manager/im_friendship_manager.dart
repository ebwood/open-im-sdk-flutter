import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class FriendshipManager {
  late OnFriendshipListener listener;

  /// Friend Relationship Listener
  Future setFriendshipListener(OnFriendshipListener listener);

  /// Query Friend Information
  /// [userIDList] List of user IDs
  Future<List<FullUserInfo>> getFriendsInfo({
    required List<String> userIDList,
    String? operationID,
  });

  /// Send a Friend Request, the other party needs to accept the request to become friends.
  /// [userID] User ID to be invited
  /// [reason] Remark description
  Future<dynamic> addFriend({
    required String userID,
    String? reason,
    String? operationID,
  });

  /// Get Friend Requests Sent to Me
  Future<List<FriendApplicationInfo>> getFriendApplicationListAsRecipient(
      {String? operationID});

  /// Get Friend Requests Sent by Me
  Future<List<FriendApplicationInfo>> getFriendApplicationListAsApplicant(
      {String? operationID});

  /// Get Friend List, including friends who have been put into the blacklist
  Future<List<FullUserInfo>> getFriendList({String? operationID});

  Future<List<FullUserInfo>> getFriendListPage(
      {String? operationID, int offset = 0, int count = 40});

  /// Get Friend List, including friends who have been put into the blacklist (returns a map)
  Future<List<dynamic>> getFriendListMap({String? operationID});

  Future<List<dynamic>> getFriendListPageMap(
      {String? operationID, int offset = 0, int count = 40});

  /// Set Friend's Remark
  /// [userID] Friend's userID
  /// [remark] Friend's remark
  Future<dynamic> setFriendRemark({
    required String userID,
    required String remark,
    String? operationID,
  });

  /// Add to Blacklist
  /// [userID] Friend's ID to be added to the blacklist
  Future<dynamic> addBlacklist({
    required String userID,
    String? ex,
    String? operationID,
  });

  /// Get Blacklist
  Future<List<BlacklistInfo>> getBlacklist({String? operationID});

  /// Remove from Blacklist
  /// [userID] User ID
  Future<dynamic> removeBlacklist({
    required String userID,
    String? operationID,
  });

  /// Check Friendship Status
  /// [userIDList] List of user IDs
  Future<List<FriendshipInfo>> checkFriend({
    required List<String> userIDList,
    String? operationID,
  });

  /// Delete Friend
  /// [userID] User ID
  Future<dynamic> deleteFriend({
    required String userID,
    String? operationID,
  });

  /// Accept Friend Request
  /// [userID] User ID
  /// [handleMsg] Remark description
  Future<dynamic> acceptFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  });

  /// Reject Friend Request
  /// [userID] User ID
  /// [handleMsg] Remark description
  Future<dynamic> refuseFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  });

  /// Search for Friends
  /// [keywordList] Search keywords, currently supports only one keyword search, cannot be empty
  /// [isSearchUserID] Whether to search for friend IDs with keywords (note: cannot be false at the same time), defaults to false if empty
  /// [isSearchNickname] Whether to search by nickname with keywords, defaults to false if empty
  /// [isSearchRemark] Whether to search by remark name with keywords, defaults to false if empty
  Future<List<SearchFriendsInfo>> searchFriends({
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchNickname = false,
    bool isSearchRemark = false,
    String? operationID,
  });

  Future<String?> setFriendsEx(
    List<String> friendIDs, {
    String? ex,
    String? operationID,
  });
}
