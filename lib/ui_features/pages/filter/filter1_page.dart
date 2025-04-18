import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_radio.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Filter1Page extends StatefulWidget {
  const Filter1Page({super.key});

  @override
  State<Filter1Page> createState() => _Filter1PageState();
}

class _Filter1PageState extends State<Filter1Page> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Show Bottom Sheet',
          buttonSize: ButtonSize.large,
          onPressed: () => showBottomSheet(context),
        ),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    int? currentIndex;
    String? selectedFilter;

    return primaryBottomSheet(
      context,
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Row(children: [
              const SizedBox(width: 48),
              const Spacer(),
              const Text('Filters', style: AssetStyles.h3),
              const Spacer(),
              PrimaryInkWell(
                onTap: () => setInnerState(() {
                  currentIndex = null;
                  selectedFilter = null;
                }),
                child: Text(
                  'Reset',
                  style: AssetStyles.h3.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 16),
            ...[
              (
                title: 'Sort by',
                items: ['Relevance', 'Most recent', 'Highest priced', 'Label']
              ),
              (
                title: 'Categories',
                items: ['Categories 1', 'Categories 2', 'Categories 3']
              ),
              (
                title: 'Item type',
                items: ['Item type 1', 'Item type 2', 'Item type 3']
              ),
              (
                title: 'Price',
                items: ['Price 1', 'Price 2', 'Price 3', 'Price 4']
              ),
              (
                title: 'Delivery',
                items: ['Delivery 1', 'Delivery 2', 'Delivery 3']
              ),
            ].asMap().entries.map((e) {
              final active = currentIndex == e.key;
              return Column(children: [
                const SizedBox(height: 24),
                PrimaryInkWell(
                  onTap: () =>
                      setInnerState(() => currentIndex = active ? null : e.key),
                  child: Row(children: [
                    Text(e.value.title, style: AssetStyles.h4),
                    const Spacer(),
                    Transform.rotate(
                      angle: currentIndex == e.key ? 3.1 : 0,
                      child: const UniversalImage(
                        AssetPaths.icArrowDownThin,
                        fit: BoxFit.cover,
                        width: 8,
                        height: 8,
                      ),
                    ),
                  ]),
                ),
                if (active) ...[
                  const SizedBox(height: 16),
                  ...e.value.items.asMap().entries.map((f) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: PrimaryRadio(
                        title: f.value,
                        selected: selectedFilter == f.value,
                        divider: false,
                        onTap: () =>
                            setInnerState(() => selectedFilter = f.value),
                      ),
                    );
                  })
                ],
                const SizedBox(height: 24),
                const PrimaryDivider(),
              ]);
            }),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Button.primary(
                label: 'Show results',
                buttonSize: ButtonSize.full,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ]),
        );
      }),
    );
  }
}
