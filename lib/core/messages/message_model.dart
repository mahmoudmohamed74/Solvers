class MessageModel {
  String? message;
  String? senderId;
  String? receiverId;
  String? messageDate;
  MessageModel({
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.messageDate,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
      'messageDate': messageDate,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'] != null ? json['message'] as String : null,
      senderId: json['senderId'] != null ? json['senderId'] as String : null,
      receiverId:
          json['receiverId'] != null ? json['receiverId'] as String : null,
      messageDate:
          json['messageDate'] != null ? json['messageDate'] as String : null,
    );
  }
}
