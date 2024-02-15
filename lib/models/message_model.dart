class MessageModel {
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime? createdDate;
  final DateTime? deletedDate;
  final bool isDeleted;

  MessageModel({
    this.senderId = '',
    this.receiverId = '',
    this.content = '',
    this.createdDate,
    this.deletedDate,
    this.isDeleted = false,
  });

  factory MessageModel.fromJson(dynamic json) {
    MessageModel model;
    try {
      model = MessageModel(
        senderId: json['senderId'] ?? '',
        receiverId: json['receiverId'] ?? '',
        content: json['content'] ?? '',
        createdDate: DateTime.parse(json['createdDate']),
        isDeleted: json['isDeleted'] as bool,
        deletedDate: DateTime.parse(json['deletedDate']),
      );
      return model;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    try {
      final json = {
        'senderId': senderId,
        'receiverId': receiverId,
        'content': content,
        'createdDate': createdDate.toString(),
        'isDeleted': isDeleted,
        'deletedDate': deletedDate.toString(),
      };
      return json;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
