import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/extension/context.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/input/chat_textfield.dart';

class Chat2Page extends StatelessWidget {
  const Chat2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'General', actions: [
        UniversalImage(
          AssetPaths.icUserPlus,
          width: 20,
          color: AppColors.getColor(ColorKey.primary60),
        ),
        const SizedBox(width: 5),
      ]),
      bottomSheet: ChatTextfield(
        backgroundColor: AppColors.getColor(ColorKey.primary20),
        iconColor: AppColors.getColor(ColorKey.primary70),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: context.heightBy(3.75)),
          const Align(
            alignment: Alignment.centerLeft,
            child: UniversalImage(
              AssetPaths.imgChat,
              height: 76,
              width: 76,
            ),
          ),
          const SizedBox(height: 16),
          const Text('Welcome to Necleus', style: AssetStyles.h2),
          const SizedBox(height: 6),
          Text(
            'This is your new room',
            style: AssetStyles.pSm.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.getColor(ColorKey.primary20),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(children: [
              const UniversalImage(AssetPaths.icChat),
              const SizedBox(width: 12),
              Text(
                'Setting up room',
                style: AssetStyles.h5.copyWith(
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              ),
              const Spacer(),
              const UniversalImage(
                AssetPaths.icCheckCircle,
                height: 24,
                width: 24,
              ),
            ]),
          ),
          const SizedBox(height: 16),
          ...[
            (
              image: AssetPaths.imgUser4,
              name: 'Nucleus',
              time: '10:13 PM',
              message: 'Hello! Welcome to your new room',
            ),
            (
              image: AssetPaths.imgUser1,
              name: 'Andy',
              time: '10:13 PM',
              message: 'Hello! Welcome to your new room',
            ),
            (
              image: AssetPaths.imgUser2,
              name: 'Shanice',
              time: '10:13 PM',
              message: 'Hello! Welcome to your new room',
            ),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(children: [
                CircleAvatar(
                  backgroundColor: AppColors.getColor(ColorKey.primary20),
                  radius: 20,
                  child: UniversalImage(e.image),
                ),
                const SizedBox(width: 14),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text(e.name, style: AssetStyles.h5),
                    const SizedBox(width: 4),
                    Text(
                      e.time,
                      style: AssetStyles.pSm.copyWith(
                        color: AppColors.getColor(ColorKey.grey60),
                      ),
                    )
                  ]),
                  Text(e.message, style: AssetStyles.pXs)
                ])
              ]),
            );
          })
        ],
      ),
    );
  }
}
