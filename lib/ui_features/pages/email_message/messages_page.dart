import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        iconColor: AppColors.getColor(ColorKey.primary60),
        actions: [
          PrimaryInkWell(
            onTap: () {},
            child: UniversalImage(
              AssetPaths.icPlusThin,
              width: 18,
              height: 18,
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
          const SizedBox(width: 20),
          PrimaryInkWell(
            onTap: () {},
            child: UniversalImage(
              AssetPaths.icSearch,
              width: 18,
              height: 18,
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Text('Messages', style: AssetStyles.h1),
          const SizedBox(height: 8),
          ...[
            (
              image: AssetPaths.imgUser1,
              name: 'James Ryan',
              message:
                  "That's wonderful to hear. Accessibility should always be at the forefront of design. It sounds like you've put a lot of thought into this project.",
              time: '8:22 PM',
              online: true,
              unread: 2,
            ),
            (
              image: AssetPaths.imgUser7,
              name: 'Amanda Gonzales',
              message:
                  "Let me know if you need any help during the testing phase. I'd love to be involved.",
              time: 'Yesterday',
              online: false,
              unread: 0,
            ),
            (
              image: AssetPaths.imgUser2,
              name: 'Andy Wyatt',
              message:
                  "Thanks a lot! I'll definitely keep you in the loop. Your feedback would be invaluable.",
              time: '8/7/22',
              online: true,
              unread: 12,
            ),
            (
              image: AssetPaths.imgUser3,
              name: 'Shanice Smith',
              message:
                  "Absolutely! One of the key features is a dynamic dashboard that users can personalize according to...",
              time: '8/7/22',
              online: false,
              unread: 0,
            ),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Stack(alignment: Alignment.topRight, children: [
                      UniversalImage(
                        e.image,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      if (e.unread != 0)
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const UniversalImage(
                                AssetPaths.icCircleFill,
                                width: 16,
                                height: 16,
                                color: AssetColors.danger,
                              ),
                              Text(
                                e.unread.toString(),
                                style: AssetStyles.pXs.copyWith(
                                  fontSize: 9,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ]),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.name,
                          overflow: TextOverflow.ellipsis,
                          style: AssetStyles.h4,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          e.online ? 'Online' : 'Offline',
                          style: AssetStyles.pSm.copyWith(
                            fontWeight: e.online ? FontWeight.w700 : null,
                            color: e.online
                                ? AssetColors.green
                                : AppColors.getColor(ColorKey.grey50),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 12),
                  Text(e.message, style: AssetStyles.pSm),
                  const SizedBox(height: 5),
                  Text(
                    e.time,
                    style: AssetStyles.pXs.copyWith(
                      color: AppColors.getColor(ColorKey.grey50),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
