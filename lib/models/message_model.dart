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
    final model = MessageModel(
      senderId: json['senderId'] ?? '',
      receiverId: json['receiverId'] ?? '',
      content: json['content'] ?? '',
      createdDate: DateTime.parse(json['createdDate']),
      isDeleted: json['isDeleted'] as bool,
      deletedDate: DateTime.parse(json['deletedDate']),
    );
    return model;
  }
}
