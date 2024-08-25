import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class GroupManager {
  late OnGroupListener listener;

  /// Group relationship listener
  Future setGroupListener(OnGroupListener listener);

  /// Invite users to a group, allowing them to join without approval.
  /// [groupID] Group ID
  /// [userIDList] List of user IDs
  Future inviteUserToGroup({
    required String groupID,
    required List<String> userIDList,
    String? reason,
    String? operationID,
  });

  /// Remove group members
  /// [groupID] Group ID
  /// [userIDList] List of user IDs
  /// [reason] Reason for removal
  Future kickGroupMember({
    required String groupID,
    required List<String> userIDList,
    String? reason,
    String? operationID,
  });

  /// Query group member information
  /// [groupID] Group ID
  /// [userIDList] List of user IDs
  Future<List<GroupMembersInfo>> getGroupMembersInfo({
    required String groupID,
    required List<String> userIDList,
    String? operationID,
  });

  /// Paginate and retrieve the group member list
  /// [groupID] Group ID
  /// [filter] Member filter (0: All, 1: Group owner, 2: Administrator, 3: Regular member, 4: Admin + Regular member, 5: Group owner + Admin)
  /// [offset] Starting index
  /// [count] Total count
  Future<List<GroupMembersInfo>> getGroupMemberList({
    required String groupID,
    int filter = 0,
    int offset = 0,
    int count = 0,
    String? operationID,
  });

  /// Paginate and retrieve the group member list as a map
  /// [groupID] Group ID
  /// [filter] Member filter (0: All, 1: Group owner, 2: Administrator, 3: Regular member, 4: Admin + Regular member, 5: Group owner + Admin)
  /// [offset] Starting index
  /// [count] Total count
  Future<List<dynamic>> getGroupMemberListMap({
    required String groupID,
    int filter = 0,
    int offset = 0,
    int count = 0,
    String? operationID,
  });

  /// Query the list of joined groups
  Future<List<GroupInfo>> getJoinedGroupList({String? operationID});

  Future<List<GroupInfo>> getJoinedGroupListPage(
      {String? operationID, int offset = 0, int count = 40});

  /// Query the list of joined groups
  Future<List<dynamic>> getJoinedGroupListMap({String? operationID});

  /// Check if the user has joined a group
  /// [groupID] Group ID
  Future<bool> isJoinedGroup({
    required String groupID,
    String? operationID,
  });

  /// Create a new group
  /// [groupInfo] Group information
  /// [memberUserIDs] List of user IDs to add as initial members
  /// [adminUserIDs] List of user IDs to add as administrators
  /// [ownerUserID] User ID of the owner
  Future<GroupInfo> createGroup({
    required GroupInfo groupInfo,
    List<String> memberUserIDs = const [],
    List<String> adminUserIDs = const [],
    String? ownerUserID,
    String? operationID,
  });

  /// Edit group information
  Future<dynamic> setGroupInfo(
    GroupInfo groupInfo, {
    String? operationID,
  });

  /// Query group information
  Future<List<GroupInfo>> getGroupsInfo({
    required List<String> groupIDList,
    String? operationID,
  });

  /// Apply to join a group, requiring approval from an administrator or the group.
  /// [joinSource] 2: Invited, 3: Searched, 4: Using a QR code
  Future<dynamic> joinGroup(
      {required String groupID,
      String? reason,
      String? operationID,
      int joinSource = 3,
      String? ex});

  /// Exit a group
  Future<dynamic> quitGroup({
    required String groupID,
    String? operationID,
  });

  // (Continuing the code)

  /// Transfer group ownership
  Future<dynamic> transferGroupOwner({
    required String groupID,
    required String userID,
    String? operationID,
  });

  /// Handle group membership applications received as a group owner or administrator
  Future<List<GroupApplicationInfo>> getGroupApplicationListAsRecipient(
      {String? operationID});

  /// Get the list of group membership applications sent by the user
  Future<List<GroupApplicationInfo>> getGroupApplicationListAsApplicant(
      {String? operationID});

  /// Accept a group membership application as an administrator or group owner
  /// Note: Membership applications require approval from administrators or the group.
  Future<dynamic> acceptGroupApplication({
    required String groupID,
    required String userID,
    String? handleMsg,
    String? operationID,
  });

  /// Refuse a group membership application as an administrator or group owner
  /// Note: Membership applications require approval from administrators or the group.
  Future<dynamic> refuseGroupApplication({
    required String groupID,
    required String userID,
    String? handleMsg,
    String? operationID,
  });

  // (Continuing the code)

  /// Dissolve a group
  /// [groupID] Group ID
  Future<dynamic> dismissGroup({
    required String groupID,
    String? operationID,
  });

  /// Enable or disable group mute, preventing all group members from sending messages
  /// [groupID] Group ID
  /// [mute] true: Enable, false: Disable
  Future<dynamic> changeGroupMute({
    required String groupID,
    required bool mute,
    String? operationID,
  });

  /// Mute a group member
  /// [groupID] Group ID
  /// [userID] Member ID to mute
  /// [seconds] Duration of the mute in seconds (set to 0 to unmute)
  Future<dynamic> changeGroupMemberMute({
    required String groupID,
    required String userID,
    int seconds = 0,
    String? operationID,
  });

  /// Set the nickname of a group member
  /// [groupID] Group ID
  /// [userID] User ID of the group member
  /// [groupNickname] Group nickname
  Future<dynamic> setGroupMemberNickname({
    required String groupID,
    required String userID,
    String? groupNickname,
    String? operationID,
  });

  /// Query a group
  /// [keywordList] Search keywords; currently, only one keyword is supported, and it cannot be empty.
  /// [isSearchGroupID] Whether to search by group ID (Note: cannot set both to false at the same time); defaults to false if not set.
  /// [isSearchGroupName] Whether to search by group name; defaults to false if not set.
  Future<List<GroupInfo>> searchGroups({
    List<String> keywordList = const [],
    bool isSearchGroupID = false,
    bool isSearchGroupName = false,
    String? operationID,
  });

  /// Set group member role
  /// [groupID] Group ID
  /// [userID] User ID of the group member
  /// [roleLevel] Role level; see [GroupRoleLevel]
  Future<dynamic> setGroupMemberRoleLevel({
    required String groupID,
    required String userID,
    required int roleLevel,
    String? operationID,
  });

  /// Get a group member list based on join time
  Future<List<GroupMembersInfo>> getGroupMemberListByJoinTime({
    required String groupID,
    int offset = 0,
    int count = 0,
    int joinTimeBegin = 0,
    int joinTimeEnd = 0,
    List<String> filterUserIDList = const [],
    String? operationID,
  });

  /// Set group verification for joining
  /// [groupID] Group ID
  /// [needVerification] Verification setting; see [GroupVerification] class
  Future<dynamic> setGroupVerification({
    required String groupID,
    required int needVerification,
    String? operationID,
  });

  /// Allow/disallow members to view each other's information through the group
  /// [groupID] Group ID
  /// [status] 0: Disable, 1: Enable
  Future<dynamic> setGroupLookMemberInfo({
    required String groupID,
    required int status,
    String? operationID,
  });

  /// Allow/disallow members to add friends through the group
  /// [groupID] Group ID
  /// [status] 0: Disable, 1: Enable
  Future<dynamic> setGroupApplyMemberFriend({
    required String groupID,
    required int status,
    String? operationID,
  });

  /// Get group owners and administrators
  /// [groupId] Group ID
  Future<List<GroupMembersInfo>> getGroupOwnerAndAdmin({
    required String groupID,
    String? operationID,
  });

  /// Search for group members
  /// [groupID] Group ID
  /// [keywordList] Search keywords; currently, only one keyword is supported, and it cannot be empty.
  /// [isSearchUserID] Whether to search by member ID
  /// [isSearchMemberNickname] Whether to search by member nickname
  /// [offset] Start index
  /// [count] Total count to retrieve
  Future<List<GroupMembersInfo>> searchGroupMembers({
    required String groupID,
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchMemberNickname = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  });

  /// Query a group
  /// [groupID] Group ID
  /// [keywordList] Search keyword, currently only supports searching with one keyword, and it cannot be empty
  /// [isSearchUserID] Whether to search member IDs with the keyword
  /// [isSearchMemberNickname] Whether to search member nicknames with the keyword
  /// [offset] Starting index
  /// [count] Total number to retrieve each time
  Future<List<dynamic>> searchGroupMembersListMap({
    required String groupID,
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchMemberNickname = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  });

  /// Modify the GroupMemberInfo ex field
  Future<dynamic> setGroupMemberInfo({
    required GroupMembersInfo groupMembersInfo,
    String? operationID,
  });

  Future<dynamic> getUsersInGroup(
    String groupID,
    List<String> userIDs, {
    String? operationID,
  });
}
