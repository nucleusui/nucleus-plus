class EmailModel {
  String image;
  String name;
  String message;
  String time;
  bool isRead;
  bool? hasAttachment;
  bool? isFavorite;

  EmailModel({
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    required this.isRead,
    this.hasAttachment,
    this.isFavorite,
  });
}
