import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/chat_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/chat/primary_chat_bubble.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class Chat5Page extends StatelessWidget {
  const Chat5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        titleWidget: PrimaryAssetImage(
          AssetPaths.imgUser1,
          width: 36,
          height: 36,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: screenHeight(context) / 3.5),
          ...[
            ChatModel(
              message: 'Hi! This is Jimmy from Nucleus',
              sender: 'other',
            ),
            ChatModel(
              message: 'Thank you for purchasing our\ndesign system kit',
              sender: 'other',
            ),
            ChatModel(
              message: 'Do you need any help?',
              sender: 'other',
            ),
            ChatModel(
              message: 'Yes please',
              sender: 'myself',
              transparent: true,
            ),
            ChatModel(
              message: 'What kind of help?',
              sender: 'other',
            ),
          ].map((e) => PrimaryChatBubble(e)),
          const SizedBox(height: 24),
          ...['Design System', 'UI Kit', 'I changed my mind'].map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PrimaryButton(
                label: e,
                transparent: true,
                labelStyle: AssetStyles.h4
                    .copyWith(color: AppColors.getColor(ColorKey.primary70)),
                border:
                    BorderSide(color: AppColors.getColor(ColorKey.primary70)),
                labelColor: AppColors.getColor(ColorKey.primary70),
                onTap: () {},
              ),
            );
          }),
        ],
      ),
    );
  }
}