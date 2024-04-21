import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/chat_model.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class SecondaryChatBubble extends StatelessWidget {
  const SecondaryChatBubble(this.data, {super.key});

  final ChatModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (data.sender != 'myself') ...[
          const PrimaryAssetImage(AssetPaths.imgUser5, width: 40, height: 40),
          const SizedBox(width: 16),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: data.sender == 'myself'
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: data.sender == 'myself'
                      ? AppColors.getColor(ColorKey.primary20)
                      : null,
                  border: data.sender == 'myself'
                      ? null
                      : Border.all(color: AppColors.getColor(ColorKey.grey20)),
                ),
                child: Text(data.message, style: AssetStyles.pMd),
              ),
              Row(
                mainAxisAlignment: data.sender == 'myself'
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  if (data.sender == 'myself' && data.seen) ...[
                    Text(
                      'Read',
                      style: AssetStyles.h6.copyWith(
                        color: AppColors.getColor(ColorKey.primary60),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  if (data.time != null)
                    Text(
                      data.time!,
                      style: AssetStyles.h6.copyWith(
                        color: AppColors.getColor(ColorKey.grey50),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
