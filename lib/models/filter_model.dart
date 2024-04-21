class FilterModel {
  String title;
  String? subtitle;
  bool active;
  bool isRadio;
  List<FilterItemModel> items;

  FilterModel({
    required this.title,
    this.subtitle,
    this.active = false,
    this.isRadio = false,
    this.items = const [],
  });
}

class FilterItemModel {
  String title;
  bool active;

  FilterItemModel({required this.title, required this.active});
}
