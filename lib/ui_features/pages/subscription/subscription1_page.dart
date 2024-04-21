import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/dialog/primary_dialog.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Subscription1Page extends StatefulWidget {
  const Subscription1Page({super.key});

  @override
  State<Subscription1Page> createState() => _Subscription1PageState();
}

class _Subscription1PageState extends State<Subscription1Page> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showModalDialog(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryButton(
            label: 'Show Modal Dialog',
            onTap: () => showModalDialog(context),
          ),
        ]),
      ),
    );
  }

  void showModalDialog(BuildContext context) {
    return primaryDialog(
      context,
      radius: 16,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: PrimaryAssetImage(
                AssetPaths.icClose,
                width: 16,
                height: 16,
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
            const Spacer(),
            const Text('Upgrade', style: AssetStyles.h3),
            const Spacer(),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 32),
        PrimaryAssetImage(
          AssetPaths.imgPlaceholder1,
          height: 234,
          width: double.infinity,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(16),
        ),
        const SizedBox(height: 24),
        Text(
          'Get Premium Membership',
          textAlign: TextAlign.center,
          style: AssetStyles.h1.copyWith(height: 1.2),
        ),
        const SizedBox(height: 16),
        Text(
          'Full access to 1000+ UI components, Style library, icons and illustration.',
          textAlign: TextAlign.center,
          style: AssetStyles.pMd.copyWith(
            color: AppColors.getColor(ColorKey.grey60),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '\$5.66/month',
          style: AssetStyles.h3.copyWith(
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const Text(
          'Billed yearly',
          style: AssetStyles.pSm,
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          label: 'Subscribe',
          onTap: () {},
        ),
        const SizedBox(height: 16),
        Text(
          'You won’t be charged until after your free week ends.',
          style: AssetStyles.pXs.copyWith(
            color: AppColors.getColor(ColorKey.grey60),
          ),
        ),
      ]),
    );
  }
}