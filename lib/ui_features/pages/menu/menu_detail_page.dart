import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/menu_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage(this.menu, {super.key});

  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: menu.title),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 12),
          child: Text(menu.subtitle, style: AssetStyles.labelMd),
        ),
        ...menu.pages.asMap().entries.map((e) {
          return PrimaryInkWell(
            onTap: () => nextScreen(e.value.page),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    decoration: BoxDecoration(
                      color: AppColors.getColor(ColorKey.primary20),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 16,
                          child: Text(
                            '${e.key + 1}.',
                            textAlign: TextAlign.center,
                            style: AssetStyles.pMd,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            e.value.title,
                            style: AssetStyles.pMd,
                          ),
                        ),
                        const SizedBox(width: 16),
                        SvgPicture.asset(
                          AssetPaths.icArrowNext,
                          width: 8,
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        })
      ]),
    );
  }
}
