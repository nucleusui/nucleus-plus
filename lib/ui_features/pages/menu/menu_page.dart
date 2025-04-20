import 'package:flutter/material.dart';
import 'package:nucles_app/app/app_theme.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/menu_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/pages/menu/menu_detail_page.dart';
import 'package:nucles_app/ui_features/pages/menu/menu_list.dart';
import 'package:nucleus_ui/nucleus_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late SharedPreferences prefs;
  String currentTab = 'Screen List';
  final searchController = TextEditingController();
  List<MenuModel> searchList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      prefs = await SharedPreferences.getInstance();
      setState(() => themeNotifier.value = prefs.getBool('darkMode') ?? false);
    });
  }

  @override
  void dispose() {
    themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        hideLeading: true,
        centerTitle: false,
        title: 'Nucleus Plus',
        systemOverlayStyle: currentSystemUiOverlayStyle,
        titleStyle: AssetStyles.h2.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: themeNotifier,
            builder: (BuildContext context, bool darkMode, Widget? child) {
              return IconButton(
                onPressed: () async {
                  final value = !darkMode;
                  await prefs.setBool('darkMode', value);
                  setState(() => themeNotifier.value = value);
                },
                tooltip: 'Switch theme',
                icon: Icon(darkMode ? Icons.dark_mode : Icons.light_mode),
              );
            },
          ),
          const SizedBox(width: 8),
          Button.primary(
            label: 'Buy Now',
            buttonSize: ButtonSize.small,
            borderRadius: BorderRadius.circular(5),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            labelStyle: AssetStyles.labelSm.copyWith(color: Colors.white),
            onPressed: () => launchUrl(Uri.parse(
                'https://nucleusui.gumroad.com/l/nucleus-ui-plus-all-in-one-figma-ui-kit-design-system')),
          ),
        ],
      ),
      body: Column(children: [
        const SizedBox(height: 12),
        Visibility(
          visible: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['Screen List', 'Widget List'].map((e) {
                final active = currentTab == e;
                return PrimaryInkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => setState(() => currentTab = e),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: (screenWidth(context) / 2) - 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: active
                          ? AppColors.getColor(ColorKey.primary20)
                          : null,
                    ),
                    child: Text(
                      e,
                      style: AssetStyles.labelMd.copyWith(
                        color: active
                            ? AppColors.getColor(ColorKey.primary60)
                            : AppColors.getColor(ColorKey.grey100)
                                .withValues(alpha: .8),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InputField(
            hintText: 'Search screen',
            controller: searchController,
            prefixIcon: UniversalImage(
              AssetPaths.icSearch,
              width: 18,
              height: 18,
              color: AppColors.getColor(searchController.text.isNotEmpty
                  ? ColorKey.primary60
                  : ColorKey.grey50),
            ),
            suffixIcon: Visibility(
              visible: searchController.text.isNotEmpty,
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  searchController.clear();
                  setState(() {});
                },
                child: UniversalImage(
                  AssetPaths.icClose,
                  width: 15,
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              ),
            ),
            onChanged: (value) {
              searchList = screenList.where((e) {
                return e.title.toLowerCase().contains(value.toLowerCase()) ||
                    e.subtitle.toLowerCase().contains(value.toLowerCase()) ||
                    e.pages
                        .where((f) =>
                            f.title.toLowerCase().contains(value.toLowerCase()))
                        .isNotEmpty;
              }).toList();
              setState(() {});
            },
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
            child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 16),
          children: (searchController.text.isNotEmpty
                  ? searchList
                  : (currentTab == 'Screen List' ? screenList : widgetList))
              .asMap()
              .entries
              .map((e) {
            return PrimaryInkWell(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                nextScreen(MenuDetailPage(e.value));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.getColor(ColorKey.primary60),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '${e.key + 1}',
                        style: AssetStyles.h4.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        decoration: BoxDecoration(
                          color: AppColors.getColor(ColorKey.primary20),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.value.title,
                              style: AssetStyles.labelMd.copyWith(height: 1.3),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              e.value.subtitle,
                              style: AssetStyles.pSm.copyWith(
                                color: AppColors.getColor(ColorKey.grey60),
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        )),
      ]),
    );
  }
}
