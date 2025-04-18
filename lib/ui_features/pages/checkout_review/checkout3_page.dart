import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Checkout3Page extends StatefulWidget {
  const Checkout3Page({super.key});

  @override
  State<Checkout3Page> createState() => _Checkout3PageState();
}

class _Checkout3PageState extends State<Checkout3Page> {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const SizedBox(width: 16),
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: UniversalImage(
                AssetPaths.icArrowBack,
                width: 18,
                height: 18,
                fit: BoxFit.cover,
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
            const Spacer(),
            const Text('Checkout', style: AssetStyles.h3),
            const Spacer(),
          ]),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.getColor(ColorKey.primary60),
                child: const UniversalImage(
                  AssetPaths.icCheck,
                  width: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              const Text('My Cart', style: AssetStyles.h5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '—',
                  style: AssetStyles.h5.copyWith(
                    color: AppColors.getColor(ColorKey.grey40),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.getColor(ColorKey.primary60),
                child: Text(
                  '2',
                  style: AssetStyles.h5.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text('Payment & info', style: AssetStyles.h5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '—',
                  style: AssetStyles.h5.copyWith(
                    color: AppColors.getColor(ColorKey.grey40),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.getColor(ColorKey.grey30),
                child: Text(
                  '3',
                  style: AssetStyles.h5.copyWith(
                    color: AppColors.getColor(ColorKey.grey60),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text('Review', style: AssetStyles.pSm),
            ]),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Email', style: AssetStyles.h4),
              const SizedBox(height: 8),
              const PrimaryTextField(initialValue: 'james@nucleus-ui.com'),
              const SizedBox(height: 24),
              const Text('Card information', style: AssetStyles.h4),
              const SizedBox(height: 8),
              const PrimaryTextField(initialValue: '1234 1234 1234'),
              const SizedBox(height: 10),
              const Row(children: [
                Expanded(child: PrimaryTextField(hintText: 'MM/YY')),
                SizedBox(width: 10),
                Expanded(child: PrimaryTextField(hintText: 'CVC')),
              ]),
              const SizedBox(height: 10),
              const PrimaryTextField(initialValue: 'James Ryan'),
              const SizedBox(height: 24),
              const Text('Country', style: AssetStyles.h4),
              const SizedBox(height: 8),
              const PrimaryTextField(
                initialValue: 'Indonesia',
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 10, top: 2),
                  child: UniversalImage(AssetPaths.icArrowDownThin),
                ),
              ),
              SizedBox(height: screenHeight(context) / 6),
              const SizedBox(height: 16),
              Button.primary(
                label: 'Checkout',
                buttonSize: ButtonSize.full,
                onTap: () {},
              ),
              const SizedBox(height: 16),
            ]),
          ),
        ],
      ),
    );
  }
}
