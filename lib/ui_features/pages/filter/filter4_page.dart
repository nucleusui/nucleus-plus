import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/filter_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_checkbox.dart';
import 'package:nucles_app/ui_features/components/input/primary_radio.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Filter4Page extends StatefulWidget {
  const Filter4Page({super.key});

  @override
  State<Filter4Page> createState() => _Filter4PageState();
}

class _Filter4PageState extends State<Filter4Page> {
  final listItem = [
    FilterModel(
      title: 'Apps',
      subtitle: 'Categories of a mobile application',
      active: false,
      items: [
        FilterItemModel(title: 'Apps 1', active: false),
        FilterItemModel(title: 'Apps 2', active: false),
        FilterItemModel(title: 'Apps 3', active: false),
      ],
    ),
    FilterModel(
      title: 'Screens',
      subtitle: 'The look and feel of a mobile application',
      active: true,
      items: [
        FilterItemModel(title: 'Feeback', active: false),
        FilterItemModel(title: 'Featured info', active: false),
        FilterItemModel(title: 'Carts & bags', active: false),
        FilterItemModel(title: 'Payment method', active: false),
        FilterItemModel(title: 'Pricing', active: false),
        FilterItemModel(title: 'Subscription', active: false),
      ],
    ),
    FilterModel(
      title: 'Components',
      subtitle: 'Building blocks for creating a user interface',
      active: false,
      isRadio: true,
      items: [
        FilterItemModel(title: 'Light Mode', active: false),
        FilterItemModel(title: 'Dark Mode', active: false),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Filters',
        actions: [
          Button.ghost(
            label: 'Reset',
            padding: EdgeInsets.zero,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          ...listItem.map((e) {
            return Column(children: [
              const SizedBox(height: 24),
              PrimaryInkWell(
                onTap: () => setState(() => e.active = !e.active),
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title, style: AssetStyles.pMd),
                      Text(
                        e.subtitle ?? '',
                        style: AssetStyles.pSm.copyWith(
                          color: AppColors.getColor(ColorKey.grey50),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Transform.rotate(
                    angle: e.active ? 3.1 : 0,
                    child: const UniversalImage(
                      AssetPaths.icArrowDownThin,
                      fit: BoxFit.cover,
                      width: 8,
                      height: 8,
                    ),
                  ),
                ]),
              ),
              if (e.active) ...[
                if (e.isRadio) const SizedBox(height: 16),
                ...e.items.map((f) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Builder(builder: (context) {
                      if (e.isRadio) {
                        return PrimaryRadio(
                          title: f.title,
                          selected: f.active,
                          divider: false,
                          onTap: () {
                            for (final f in e.items) {
                              f.active = false;
                            }
                            setState(() => f.active = !f.active);
                          },
                        );
                      }
                      return PrimaryInkWell(
                        onTap: () => setState(() => f.active = !f.active),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(children: [
                            Expanded(
                              child: Text(f.title, style: AssetStyles.pMd),
                            ),
                            PrimaryCheckBox(
                              value: f.active,
                              size: 24,
                              scale: 1.1,
                              onChanged: (_) =>
                                  setState(() => f.active = !f.active),
                            ),
                          ]),
                        ),
                      );
                    }),
                  );
                })
              ],
              const SizedBox(height: 8),
            ]);
          })
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Apply',
          buttonSize: ButtonSize.full,
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
