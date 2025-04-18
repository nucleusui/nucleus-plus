import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/extension/context.dart';
import 'package:nucles_app/models/chat_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/chat/primary_chat_bubble.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/input/chat_textfield.dart';

class Chat1Page extends StatelessWidget {
  const Chat1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Andy',
        actions: [
          UniversalImage(
            AssetPaths.icBookmark,
            width: 16,
            color: AppColors.getColor(ColorKey.primary60),
          ),
          const SizedBox(width: 16),
          UniversalImage(
            AssetPaths.icSearch,
            width: 20,
            color: AppColors.getColor(ColorKey.primary60),
          ),
          const SizedBox(width: 5),
        ],
      ),
      bottomSheet: ChatTextfield(
        iconColor: Colors.white,
        backgroundColor: AppColors.getColor(ColorKey.primary60),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: context.heightBy(2.5)),
          Center(
            child: Column(children: [
              const Stack(alignment: Alignment.bottomRight, children: [
                UniversalImage(
                  AssetPaths.imgUser1,
                  fit: BoxFit.cover,
                  height: 64,
                  width: 64,
                ),
                UniversalImage(
                  AssetPaths.icCircleFill,
                  width: 20,
                  color: AssetColors.green,
                ),
              ]),
              const SizedBox(height: 8),
              const Text('Andy Wyatt', style: AssetStyles.h4),
              Text(
                'Jakarta, Indonesia',
                style: AssetStyles.pSm.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 24),
          ...[
            ChatModel(
              message: 'Just wanna pop in to say hi!',
              time: '12:49',
              sender: 'myself',
            ),
            ChatModel(
              message: 'Thanks, hope you have a great day!',
              time: '13:00',
              sender: 'other',
            ),
          ].map((e) => PrimaryChatBubble(e)),
        ],
      ),
    );
  }
}
