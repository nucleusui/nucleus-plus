import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_radio.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Subscription3Page extends StatefulWidget {
  const Subscription3Page({super.key});

  @override
  State<Subscription3Page> createState() => _Subscription3PageState();
}

class _Subscription3PageState extends State<Subscription3Page> {
  int selected = 1;

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
    return primaryBottomSheet(
      context,
      child: StatefulBuilder(builder: (context, setInnerState) {
        return ListView(shrinkWrap: true, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: UniversalImage(
                AssetPaths.icClose,
                width: 16,
                height: 16,
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const UniversalImage(
            AssetPaths.imgPlaceholder2,
            height: 211,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unlock Unlimited\nAccess Nucleus UI',
                  style: AssetStyles.h1.copyWith(height: 1.2),
                ),
                const SizedBox(height: 32),
                ...[
                  (title: 'Standard', subtitle: '\$99,99/year.'),
                  (title: 'Plus', subtitle: '\$120,84/year.'),
                ].asMap().entries.map((e) {
                  return PrimaryRadio(
                    title: e.value.title,
                    subtitle: e.value.subtitle,
                    selected: selected == e.key,
                    divider: false,
                    onTap: () => setInnerState(() => selected = e.key),
                  );
                }),
                const SizedBox(height: 112),
                Button.primary(
                  label: 'Subscribe',
                  buttonSize: ButtonSize.full,
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 16),
                Text(
                  'Save 45% + 7 day trial with the yearly plan. Payment will be made automatically after the trial ends.',
                  textAlign: TextAlign.center,
                  style: AssetStyles.pXs.copyWith(
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                ),
              ],
            ),
          ),
        ]);
      }),
    );
  }
}
