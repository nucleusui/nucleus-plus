import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/chat_model.dart';

class PrimaryChatBubble extends StatelessWidget {
  const PrimaryChatBubble(this.data, {super.key});

  final ChatModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: data.time != null ? 24 : 0),
      child: Column(
        crossAxisAlignment: data.sender == 'myself'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: data.time != null
                ? const EdgeInsets.fromLTRB(16, 8, 16, 8)
                : const EdgeInsets.fromLTRB(16, 12, 16, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: data.transparent
                  ? null
                  : AppColors.getColor(ColorKey.primary20),
              border: !data.transparent
                  ? null
                  : Border.all(color: AppColors.getColor(ColorKey.grey20)),
            ),
            child: Text(data.message, style: AssetStyles.pMd),
          ),
          if (data.time != null)
            Text(
              data.time!,
              style: AssetStyles.pXs.copyWith(
                color: AppColors.getColor(ColorKey.grey50),
              ),
            ),
        ],
      ),
    );
  }
}
