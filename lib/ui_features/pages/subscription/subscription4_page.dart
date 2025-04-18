import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_radio.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Subscription4Page extends StatefulWidget {
  const Subscription4Page({super.key});

  @override
  State<Subscription4Page> createState() => _Subscription4PageState();
}

class _Subscription4PageState extends State<Subscription4Page> {
  int selected = 1;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Column(children: [
        const SizedBox(height: 32),
        const UniversalImage(
          AssetPaths.imgCrown,
          height: 140,
          width: 140,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 32),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            children: [
              Center(
                child: Text(
                  'Try Nucleus membership free',
                  textAlign: TextAlign.center,
                  style: AssetStyles.h1.copyWith(height: 1.2),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Full access to 1000+ UI components, Style\nlibrary, icons and illustration.',
                  textAlign: TextAlign.center,
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.getColor(ColorKey.grey10),
                ),
                child: Wrap(
                  spacing: 4,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: ['Annual', 'Monthly'].asMap().entries.map((e) {
                    final active = selectedTab == e.key;
                    return PrimaryInkWell(
                      onTap: () => setState(() => selectedTab = e.key),
                      child: Container(
                        height: 28,
                        alignment: Alignment.center,
                        width: (screenWidth(context) / 2) - 20,
                        decoration: BoxDecoration(
                          color: !active
                              ? AppColors.getColor(ColorKey.grey10)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: !active
                              ? null
                              : const [
                                  BoxShadow(
                                    offset: Offset(0.5, 0.5),
                                    blurRadius: 2,
                                    color: Colors.grey,
                                  ),
                                ],
                        ),
                        child: Text(
                          e.value,
                          textAlign: TextAlign.center,
                          style: AssetStyles.h6,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),
              ...[
                (
                  title: 'Standard',
                  subtitle: '\$99,99/year.',
                  icon: AssetPaths.icBox,
                ),
                (
                  title: 'Plus',
                  subtitle: '\$120,84/year.',
                  icon: AssetPaths.icColumnBold,
                ),
              ].asMap().entries.map((e) {
                return PrimaryRadio(
                  title: e.value.title,
                  subtitle: e.value.subtitle,
                  selected: selected == e.key,
                  divider: false,
                  titleStyle: AssetStyles.h4,
                  icon: e.value.icon,
                  onTap: () => setState(() => selected = e.key),
                );
              }),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Subscribe',
          buttonSize: ButtonSize.full,
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
