import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class PrimaryNavbar extends StatelessWidget {
  const PrimaryNavbar({
    super.key,
    required this.index,
    required this.data,
    this.onTap,
  });

  final int index;
  final List<NavbarModel> data;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: index,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: AppColors.getColor(ColorKey.background),
        selectedItemColor: AppColors.getColor(ColorKey.primary70),
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: data.asMap().entries.map((e) {
          final selected = index == e.key;
          return BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(children: [
                Visibility(
                  visible: e.value.icon == null,
                  replacement: PrimaryAssetImage(
                    selected
                        ? '${e.value.activeIcon ?? e.value.icon}'
                        : '${e.value.icon}',
                    height: 16,
                    width: 16,
                    fit: BoxFit.scaleDown,
                    color: selected
                        ? AppColors.getColor(ColorKey.primary70)
                        : AppColors.getColor(ColorKey.grey50),
                  ),
                  child: PrimaryAssetImage(
                    selected ? AssetPaths.icCircleFill : AssetPaths.icCircle,
                    color: selected
                        ? AppColors.getColor(ColorKey.primary70)
                        : AppColors.getColor(ColorKey.grey70),
                  ),
                ),
                if (e.value.title != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      e.value.title!,
                      style: AssetStyles.pXs.copyWith(
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w400,
                        color: selected
                            ? AppColors.getColor(ColorKey.primary70)
                            : AppColors.getColor(ColorKey.grey50),
                      ),
                    ),
                  )
              ]),
            ),
          );
        }).toList(),
      ),
    );
  }
}
