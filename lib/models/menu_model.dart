import 'package:flutter/widgets.dart';

class MenuModel {
  String title;
  String subtitle;
  List<PageModel> pages;

  MenuModel({
    required this.title,
    required this.subtitle,
    required this.pages,
  });
}

class PageModel {
  String title;
  Widget page;

  PageModel({required this.title, required this.page});
}
