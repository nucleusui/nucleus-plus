import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/extension/context.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/input/chat_textfield.dart';

class Chat4Page extends StatelessWidget {
  const Chat4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        centerTitle: false,
        titleWidget: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Andy Wyatt', style: AssetStyles.h5),
            SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3, right: 4),
                  child: UniversalImage(
                    AssetPaths.icCircleFill,
                    width: 8,
                    color: AssetColors.green,
                  ),
                ),
                Text(
                  'Mobile · 19h ago',
                  style: AssetStyles.pXs,
                ),
              ],
            ),
          ],
        ),
        actions: [
          UniversalImage(
            AssetPaths.icSetting,
            width: 20,
            color: AppColors.getColor(ColorKey.primary60),
          ),
          const SizedBox(width: 5),
        ],
      ),
      bottomSheet: ChatTextfield(
        prefixIcon: UniversalImage(
          AssetPaths.icAttachment,
          width: 18,
          height: 18,
          color: AppColors.getColor(ColorKey.grey100),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: UniversalImage(
            AssetPaths.icMicrophone,
            width: 18,
            height: 18,
            color: AppColors.getColor(ColorKey.grey100),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: context.heightBy(2.1)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(alignment: Alignment.bottomRight, children: [
              const UniversalImage(
                AssetPaths.imgUser1,
                fit: BoxFit.cover,
                height: 48,
                width: 48,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const UniversalImage(
                  AssetPaths.icCircleFill,
                  width: 14,
                  color: AssetColors.green,
                ),
              ),
            ]),
            const SizedBox(height: 8),
            const Text('Andy Wyatt', style: AssetStyles.h4),
            Text(
              'Product Design at Nucleus',
              style: AssetStyles.pSm.copyWith(
                color: AppColors.getColor(ColorKey.grey50),
              ),
            ),
          ]),
          const SizedBox(height: 16),
          Stack(alignment: Alignment.center, children: [
            Divider(thickness: 1, color: AppColors.getColor(ColorKey.grey20)),
            Container(
              color: AppColors.getColor(ColorKey.background),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'OR',
                style: AssetStyles.labelXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ]),
          const SizedBox(height: 16),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const UniversalImage(
              AssetPaths.imgUser2,
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Jeremy', style: AssetStyles.h4),
                      Text(
                        '  ・ 10:13 pm',
                        style: AssetStyles.pXs.copyWith(
                          color: AppColors.getColor(ColorKey.grey50),
                        ),
                      ),
                    ],
                  ),
                  const Row(children: [
                    Expanded(
                      child: Text(
                        'Hello! Thanks for connecting!',
                        style: AssetStyles.pSm,
                      ),
                    ),
                    UniversalImage(
                      AssetPaths.icCheckOutlined,
                      width: 16,
                      height: 16,
                    )
                  ]),
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(
                      child: Text(
                        '@Andy Wyatt',
                        style: AssetStyles.pSm.copyWith(
                          color: AppColors.getColor(ColorKey.primary60),
                        ),
                      ),
                    ),
                    const UniversalImage(
                      AssetPaths.icCheckOutlined,
                      width: 16,
                      height: 16,
                    )
                  ]),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
