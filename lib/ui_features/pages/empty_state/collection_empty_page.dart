import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class CollectionEmptyPage extends StatefulWidget {
  const CollectionEmptyPage({super.key});

  @override
  State<CollectionEmptyPage> createState() => _CollectionEmptyPageState();
}

class _CollectionEmptyPageState extends State<CollectionEmptyPage> {
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
      child: Column(children: [
        const Text(
          'Add to collection',
          textAlign: TextAlign.center,
          style: AssetStyles.h3,
        ),
        SizedBox(height: screenHeight(context) / 5),
        const Text(
          'No collections',
          textAlign: TextAlign.center,
          style: AssetStyles.h2,
        ),
        const SizedBox(height: 5),
        Text(
          'Looks like you haven’t created any collections.',
          textAlign: TextAlign.center,
          style: AssetStyles.pMd.copyWith(
            color: AppColors.getColor(ColorKey.grey50),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(24),
          child: Button.primary(
            label: 'Browse Items',
            buttonSize: ButtonSize.large,
            onPressed: () {},
          ),
        ),
        SizedBox(height: screenHeight(context) / 5),
      ]),
    );
  }
}
