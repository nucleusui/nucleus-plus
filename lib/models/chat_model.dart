class ChatModel {
  String message;
  String? time;
  String sender;
  bool seen;
  bool transparent;

  ChatModel({
    required this.message,
    this.time,
    required this.sender,
    this.seen = true,
    this.transparent = false,
  });
}
