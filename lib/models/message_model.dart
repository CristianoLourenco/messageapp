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

  factory MessageModel.fromJson(Map<dynamic, String> json) {
    final model = MessageModel(
      senderId: json['senderId'] ?? '',
      receiverId: json['receiverId'] ?? '',
      content: json['content'] ?? '',
      createdDate: json['phoneNumber'] as DateTime,
      isDeleted: json['isDe,leted'] as bool,
      deletedDate: json['deletedDate'] as DateTime,
    );
    return model;
  }
}
