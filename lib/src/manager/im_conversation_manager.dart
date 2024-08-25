import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class ConversationManager {
  late OnConversationListener listener;

  /// Conversation Listener
  Future setConversationListener(OnConversationListener listener);

  /// Get All Conversations
  Future<List<ConversationInfo>> getAllConversationList({String? operationID});

  /// Paginate Through Conversations
  /// [offset] Starting index
  /// [count] Number of items per page
  Future<List<ConversationInfo>> getConversationListSplit({
    int offset = 0,
    int count = 20,
    String? operationID,
  });

  /// Query a Conversation; if it doesn't exist, it will be created
  /// [sourceID] UserID for one-on-one conversation, GroupID for group conversation
  /// [sessionType] Reference [ConversationType]
  Future<ConversationInfo> getOneConversation({
    required String sourceID,
    required int sessionType,
    String? operationID,
  });

  /// Get Multiple Conversations by Conversation ID
  /// [conversationIDList] List of conversation IDs
  Future<List<ConversationInfo>> getMultipleConversation({
    required List<String> conversationIDList,
    String? operationID,
  });

  /// Set Conversation Draft
  /// [conversationID] Conversation ID
  /// [draftText] Draft text
  Future setConversationDraft({
    required String conversationID,
    required String draftText,
    String? operationID,
  });

  /// Pin a Conversation
  /// [conversationID] Conversation ID
  /// [isPinned] true: pin, false: unpin
  Future pinConversation({
    required String conversationID,
    required bool isPinned,
    String? operationID,
  });

  /// Hide a Conversation
  /// [conversationID] Conversation ID
  Future hideConversation({
    required String conversationID,
    String? operationID,
  });

  /// Hide All Conversations
  Future hideAllConversations({
    String? operationID,
  });

  /// Query Conversation ID
  /// [sourceID] UserID for one-on-one, GroupID for group
  /// [sessionType] Reference [ConversationType]
  Future<dynamic> getConversationIDBySessionType({
    required String sourceID,
    required int sessionType,
    String? operationID,
  });

  /// get total unread message count
  /// int.tryParse(count) ?? 0;
  Future<dynamic> getTotalUnreadMsgCount({
    String? operationID,
  });

  /// Message Do-Not-Disturb Setting
  /// [conversationID] Conversation ID
  /// [status] 0: normal; 1: not receiving messages; 2: receive online messages but not offline messages
  Future<dynamic> setConversationRecvMessageOpt({
    required String conversationID,
    required int status,
    String? operationID,
  });

  /// Query Do-Not-Disturb Status
  /// [conversationIDList] List of conversation IDs
  /// Returns: [{"conversationId":"single_13922222222","result":0}], result values: 0: normal; 1: not receiving messages; 2: receive online messages but not offline messages
  Future<List<dynamic>> getConversationRecvMessageOpt({
    required List<String> conversationIDList,
    String? operationID,
  });

  /// Self-Destruct Messages
  /// [conversationID] Conversation ID
  /// [isPrivate] true: enable, false: disable
  Future<dynamic> setConversationPrivateChat({
    required String conversationID,
    required bool isPrivate,
    String? operationID,
  });

  /// Delete a Conversation Locally and from the Server
  /// [conversationID] Conversation ID
  Future<dynamic> deleteConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  });

  /// Clear Messages in a Conversation
  /// [conversationID] Conversation ID
  Future<dynamic> clearConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  });

  /// Delete All Local Conversations
  @Deprecated('use hideAllConversations instead')
  Future<dynamic> deleteAllConversationFromLocal({
    String? operationID,
  });

  /// Reset Mentioned (Group At) Flags [GroupAtType]
  /// [conversationID] Conversation ID
  Future<dynamic> resetConversationGroupAtType({
    required String conversationID,
    String? operationID,
  });

  /// Query @ All Flag
  Future<dynamic> getAtAllTag({
    String? operationID,
  });

  /// Get @ All Tag
  String get atAllTag => 'AtAllTag';

  /// Global Do-Not-Disturb
  /// [status] 0: normal; 1: not receiving messages; 2: receive online messages but not offline messages
  Future<dynamic> setGlobalRecvMessageOpt({
    required int status,
    String? operationID,
  });

  /// Set Self-Destruct Message Duration
  /// [conversationID] Conversation ID
  /// [burnDuration] Duration in seconds, default: 30s
  Future<dynamic> setConversationBurnDuration({
    required String conversationID,
    int burnDuration = 30,
    String? operationID,
  });

  /// Mark Messages as Read
  /// [conversationID] Conversation ID
  Future markConversationMessageAsRead({
    required String conversationID,
    String? operationID,
  });

  /// Enable Regular Deletion
  /// [isMsgDestruct] true: enable
  Future<dynamic> setConversationIsMsgDestruct({
    required String conversationID,
    bool isMsgDestruct = true,
    String? operationID,
  });

  /// Regularly Delete Chat Records
  /// [duration] Seconds
  Future<dynamic> setConversationMsgDestructTime({
    required String conversationID,
    int duration = 1 * 24 * 60 * 60,
    String? operationID,
  });

  /// search Conversations
  Future<List<ConversationInfo>> searchConversations(
    String name, {
    String? operationID,
  });

  Future setConversationEx(
    String conversationID, {
    String? ex,
    String? operationID,
  });

  /// Custom Sort for Conversation List
  List<ConversationInfo> simpleSort(List<ConversationInfo> list) => list
    ..sort((a, b) {
      if ((a.isPinned == true && b.isPinned == true) ||
          (a.isPinned != true && b.isPinned != true)) {
        int aCompare = a.draftTextTime! > a.latestMsgSendTime!
            ? a.draftTextTime!
            : a.latestMsgSendTime!;
        int bCompare = b.draftTextTime! > b.latestMsgSendTime!
            ? b.draftTextTime!
            : b.latestMsgSendTime!;
        if (aCompare > bCompare) {
          return -1;
        } else if (aCompare < bCompare) {
          return 1;
        } else {
          return 0;
        }
      } else if (a.isPinned == true && b.isPinned != true) {
        return -1;
      } else {
        return 1;
      }
    });

  Future changeInputStates({
    required String conversationID,
    required bool focus,
    String? operationID,
  });

  Future<List<int>?> getInputStates(
    String conversationID,
    String userID, {
    String? operationID,
  });
}
