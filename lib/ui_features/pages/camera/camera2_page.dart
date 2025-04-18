import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera2Page extends StatefulWidget {
  const Camera2Page({super.key});

  @override
  State<Camera2Page> createState() => _Camera2PageState();
}

class _Camera2PageState extends State<Camera2Page> {
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
          left: 16,
          top: kToolbarHeight,
          child: UniversalImage(
            AssetPaths.icMenu,
            width: 21,
            color: Colors.white,
          ),
        ),
        const Positioned(
          right: 16,
          top: kToolbarHeight,
          child: Row(children: [
            UniversalImage(
              AssetPaths.icClockBold,
              width: 23,
              color: Colors.white,
            ),
            SizedBox(width: 16),
            UniversalImage(
              AssetPaths.icQuestion,
              color: Colors.white,
            ),
          ]),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: _BottomBarAction(),
        ),
      ]),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: JustTheTooltip(
        tailLength: 8,
        tailBaseWidth: 16,
        content: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Text(
            "Tap to take a picture",
            textAlign: TextAlign.center,
            style: AssetStyles.pSm.copyWith(color: Colors.white),
          ),
        ),
        preferredDirection: kIsWeb ? AxisDirection.left : AxisDirection.up,
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
                color: Colors.transparent.withValues(alpha: .5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
