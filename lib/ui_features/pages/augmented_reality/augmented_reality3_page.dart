import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class AugemntedReality3Page extends StatefulWidget {
  const AugemntedReality3Page({super.key});

  @override
  State<AugemntedReality3Page> createState() => _AugemntedReality3PageState();
}

class _AugemntedReality3PageState extends State<AugemntedReality3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(ColorKey.grey40),
      body: Stack(alignment: Alignment.center, children: [
        const UniversalImage(
          AssetPaths.imgPlaceholder19,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 128),
          child: UniversalImage(AssetPaths.imgPlaceholder18, width: 244),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Chair',
                style: AssetStyles.h0.copyWith(color: Colors.white),
              ),
              Text(
                '573',
                style: AssetStyles.pLg.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const UniversalImage(
                    AssetPaths.icLike,
                    width: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 48),
                  PrimaryInkWell(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.getColor(ColorKey.primary60),
                      child: const UniversalImage(
                        AssetPaths.icCheck,
                        width: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                  const UniversalImage(
                    AssetPaths.icTrash,
                    width: 20,
                    color: Colors.white,
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
