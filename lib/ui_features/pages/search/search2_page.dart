import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Search2Page extends StatelessWidget {
  const Search2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(children: [
          const SizedBox(height: 16),
          PrimaryAppBar(
            hideLeading: true,
            heightAppBar: 64,
            titleWidget: InputField(
              hintText: 'Search',
              autofocus: true,
              fillColor: AppColors.getColor(ColorKey.grey10),
              borderRadius: BorderRadius.circular(100),
              prefixIcon: UniversalImage(
                AssetPaths.icSearch,
                width: 16,
                height: 16,
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TabBar(
            indicatorWeight: 1,
            labelPadding: const EdgeInsets.symmetric(vertical: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.getColor(ColorKey.primary60),
            unselectedLabelColor: AppColors.getColor(ColorKey.grey50),
            labelStyle: AssetStyles.h4.copyWith(fontFamily: 'PlusJakartaSans'),
            tabs: ['Top', 'Design', 'Designer'].asMap().entries.map((e) {
              return Text(e.value);
            }).toList(),
          ),
          Expanded(
            child: TabBarView(children: [
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                children: [
                  Row(children: [
                    Text(
                      'Design',
                      style: AssetStyles.h5.copyWith(
                        color: AppColors.getColor(ColorKey.grey60),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'View All',
                      style: AssetStyles.h5.copyWith(
                        color: AppColors.getColor(ColorKey.primary60),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 8),
                  ...[
                    'B2B Agency Website',
                    'Architectural Agency website',
                    'Furniture Landing Page',
                  ].map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(e, style: AssetStyles.pMd),
                    );
                  }),
                  const SizedBox(height: 16),
                  const PrimaryDivider(),
                  const SizedBox(height: 16),
                  Row(children: [
                    Text(
                      'Designer',
                      style: AssetStyles.h5.copyWith(
                        color: AppColors.getColor(ColorKey.grey60),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'View All',
                      style: AssetStyles.h5.copyWith(
                        color: AppColors.getColor(ColorKey.primary60),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 16),
                  ...[
                    (
                      image: AssetPaths.imgUser2,
                      name: 'Andy Wyatt',
                    ),
                    (
                      image: AssetPaths.imgUser1,
                      name: 'James Ryan',
                    ),
                    (
                      image: AssetPaths.imgUser7,
                      name: 'Amanda Gonzales',
                    ),
                  ].map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          UniversalImage(
                            e.image,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          const SizedBox(width: 16),
                          Text(e.name, style: AssetStyles.pMd),
                        ],
                      ),
                    );
                  }),
                ],
              ),
              const Center(child: Text('Design Tab', style: AssetStyles.pMd)),
              const Center(child: Text('Designer Tab', style: AssetStyles.pMd)),
            ]),
          ),
        ]),
      ),
    );
  }
}
