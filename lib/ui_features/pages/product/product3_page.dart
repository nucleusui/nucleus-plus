import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Product3Page extends StatefulWidget {
  const Product3Page({super.key});

  @override
  State<Product3Page> createState() => _Product3PageState();
}

class _Product3PageState extends State<Product3Page> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Nucleus UI', actions: [
        PrimaryInkWell(
          onTap: () {},
          child: UniversalImage(
            AssetPaths.icBag,
            width: 20,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const SizedBox(width: 5),
      ]),
      body: ListView(shrinkWrap: true, children: [
        SizedBox(
          height: 393,
          child: PageView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) => setState(() => currentIndex = value),
            itemBuilder: (_, __) => const UniversalImage(
              AssetPaths.imgPlaceholder7,
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Wrap(
              spacing: 5,
              alignment: WrapAlignment.center,
              children: List.generate(5, (index) {
                return UniversalImage(
                  AssetPaths.icCircleFill,
                  width: 8,
                  color: index == currentIndex
                      ? AppColors.getColor(ColorKey.primary60)
                      : AppColors.getColor(ColorKey.grey20),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            const Row(children: [
              UniversalImage(AssetPaths.icLoveFill),
              Spacer(),
              UniversalImage(AssetPaths.icBookmarkBold),
              SizedBox(width: 16),
              UniversalImage(AssetPaths.icShare),
            ]),
            const SizedBox(height: 20),
            const Text('Product Name', style: AssetStyles.h2),
            const SizedBox(height: 8),
            Text(
              'The ultimate UI components for your next project. UI kit that provides you the building blocks you need to design your next mobile app.',
              style: AssetStyles.pSm.copyWith(
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.25,
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\$97', style: AssetStyles.h3),
              Text('include tax', style: AssetStyles.pSm),
            ],
          ),
          const Spacer(),
          Button.primary(
            label: 'Add to Cart',
            onPressed: () => Navigator.pop(context),
          ),
        ]),
      ),
    );
  }
}
