import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera1Page extends StatefulWidget {
  const Camera1Page({super.key});

  @override
  State<Camera1Page> createState() => _Camera1PageState();
}

class _Camera1PageState extends State<Camera1Page> {
  bool initialized = false;
  late CameraController cameraController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final camera = await Permission.camera.status;
      if (camera.isGranted) {
        final cameras = await availableCameras();
        cameraController = CameraController(cameras[0], ResolutionPreset.max);
        cameraController.initialize().then((_) {
          if (!mounted) return;
          setState(() => initialized = true);
        }).catchError((Object e) {
          if (kDebugMode) print(e);
        });
      } else if (camera.isDenied || camera.isPermanentlyDenied) {
        await Permission.camera.request();
      } else {
        await Permission.camera.request();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        if (initialized)
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CameraPreview(cameraController),
          ),
        const Positioned(
          left: 20,
          top: kToolbarHeight,
          child: PrimaryAssetImage(
            AssetPaths.icSetting,
            width: 21,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 20,
          top: kToolbarHeight,
          child: PrimaryInkWell(
            onTap: () => Navigator.pop(context),
            child: const PrimaryAssetImage(
              AssetPaths.icClose,
              width: 16,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryAssetImage(AssetPaths.icFlashOff, color: Colors.white),
              SizedBox(height: 32),
              PrimaryAssetImage(AssetPaths.icLayout, color: Colors.white),
              SizedBox(height: 32),
              PrimaryAssetImage(AssetPaths.icType, color: Colors.white),
              SizedBox(height: 32),
              PrimaryAssetImage(
                AssetPaths.icArrowDownThin,
                color: Colors.white,
                width: 16,
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomRight,
          child: _BottomBarAction(),
        ),
      ]),
      floatingActionButton: CircleAvatar(
        radius: 17,
        backgroundColor: AppColors.getColor(ColorKey.primary60),
        child: const PrimaryAssetImage(
          AssetPaths.icRefreshCw,
          width: 13,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _BottomBarAction extends StatefulWidget {
  const _BottomBarAction();

  @override
  State<_BottomBarAction> createState() => __BottomBarActionState();
}

class __BottomBarActionState extends State<_BottomBarAction> {
  JustTheController tooltipController = JustTheController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      tooltipController.showTooltip(immediately: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            const PrimaryAssetImage(AssetPaths.imgPlaceholder11, width: 34),
            const Spacer(flex: 3),
            JustTheTooltip(
              tailLength: 8,
              tailBaseWidth: 16,
              content: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                child: Text(
                  "Tap for photo or\nhold for video",
                  textAlign: TextAlign.center,
                  style: AssetStyles.pSm.copyWith(color: Colors.white),
                ),
              ),
              preferredDirection:
                  kIsWeb ? AxisDirection.left : AxisDirection.up,
              controller: tooltipController,
              backgroundColor: AppColors.getColor(ColorKey.primary60),
              child: Container(
                width: 72,
                height: 72,
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      width: 1.5,
                      color: Colors.black.withValues(alpha: .5),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const PrimaryAssetImage(
              AssetPaths.imgPlaceholder9,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 24),
            const PrimaryAssetImage(
              AssetPaths.imgPlaceholder10,
              width: 34,
              height: 34,
            ),
          ],
        ),
        const SizedBox(height: 42),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "POST",
            style: AssetStyles.h4.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          const SizedBox(width: 24),
          Text("STORY", style: AssetStyles.h4.copyWith(color: Colors.white)),
          const SizedBox(width: 24),
          Text(
            "LIVE",
            style: AssetStyles.h4.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
        ]),
        const SizedBox(height: 24),
      ]),
    );
  }
}
