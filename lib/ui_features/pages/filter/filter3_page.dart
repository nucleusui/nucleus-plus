import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_checkbox.dart';
import 'package:nucles_app/ui_features/components/input/primary_switch.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Filter3Page extends StatefulWidget {
  const Filter3Page({super.key});

  @override
  State<Filter3Page> createState() => _Filter3PageState();
}

class _Filter3PageState extends State<Filter3Page> {
  bool byNewest = true;
  bool onSale = true;
  bool favorite = true;
  bool men = true;
  bool women = true;
  double startValue = 300;
  double endValue = 700;

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
          onTap: () => showBottomSheet(context),
        ),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              PrimaryInkWell(
                onTap: () => Navigator.pop(context),
                child: const UniversalImage(
                  AssetPaths.icClose,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              const SizedBox(width: 52),
              const Text('Filters', style: AssetStyles.h3),
              const Spacer(),
              PrimaryInkWell(
                onTap: () {},
                child: Text(
                  'Clear All',
                  style: AssetStyles.h4.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 16),
              const Text('Sort by', style: AssetStyles.h2),
              const SizedBox(height: 16),
              Row(children: [
                const Text('Newest', style: AssetStyles.pMd),
                const Spacer(),
                PrimarySwitch(
                  value: byNewest,
                  onChanged: (value) => setInnerState(() => byNewest = value!),
                ),
                const SizedBox(width: 16),
              ]),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: PrimaryDivider(),
              ),
              Row(children: [
                const Text('On sale', style: AssetStyles.pMd),
                const Spacer(),
                PrimaryCheckBox(
                  value: onSale,
                  onChanged: (value) => setInnerState(() => onSale = value!),
                ),
              ]),
              const SizedBox(height: 24),
              Row(children: [
                const Text('Favorite shops', style: AssetStyles.pMd),
                const Spacer(),
                PrimaryCheckBox(
                  value: favorite,
                  onChanged: (value) => setInnerState(() => favorite = value!),
                ),
              ]),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: PrimaryDivider(),
              ),
              Text.rich(
                style: AssetStyles.pMd,
                TextSpan(text: 'Price between: ', children: [
                  TextSpan(
                    text:
                        '\$${startValue.toStringAsFixed(0)} - \$${endValue.toStringAsFixed(0)}',
                    style: AssetStyles.h4.copyWith(
                      color: AppColors.getColor(ColorKey.primary70),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(trackHeight: 8),
            child: RangeSlider(
              min: 10,
              max: 1000,
              activeColor: AppColors.getColor(ColorKey.primary60),
              inactiveColor: AppColors.getColor(ColorKey.primary20),
              labels: RangeLabels(
                  startValue.toStringAsFixed(0), endValue.toStringAsFixed(0)),
              values: RangeValues(startValue, endValue),
              onChanged: (values) {
                setInnerState(() {
                  startValue = values.start;
                  endValue = values.end;
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              Text('\$10', style: AssetStyles.pSm),
              Spacer(),
              Text('\$1000', style: AssetStyles.pSm),
            ]),
          ),
          Container(
            height: 12,
            margin: const EdgeInsets.only(bottom: 24, top: 16),
            color: AppColors.getColor(ColorKey.grey10),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Category', style: AssetStyles.h2),
                const SizedBox(height: 16),
                Row(children: [
                  const Text('Men', style: AssetStyles.pMd),
                  const Spacer(),
                  PrimaryCheckBox(
                    value: men,
                    onChanged: (value) => setInnerState(() => men = value!),
                  ),
                ]),
                const SizedBox(height: 24),
                Row(children: [
                  const Text('Women', style: AssetStyles.pMd),
                  const Spacer(),
                  PrimaryCheckBox(
                    value: women,
                    onChanged: (value) => setInnerState(() => women = value!),
                  ),
                ]),
                const SizedBox(height: 32),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Button.primary(
              label: 'Filter',
              buttonSize: ButtonSize.full,
              onTap: () => Navigator.pop(context),
            ),
          ),
        ]);
      }),
    );
  }
}
