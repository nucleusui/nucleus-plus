import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Permission3Page extends StatefulWidget {
  const Permission3Page({super.key});

  @override
  State<Permission3Page> createState() => _Permission3PageState();
}

class _Permission3PageState extends State<Permission3Page> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(41.44685613087005, -81.7093551010844),
            initialZoom: 16,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.spklayanan',
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.all(16),
          child: Button.primary(
            label: 'Show Bottom Sheet',
            buttonSize: ButtonSize.large,
            onPressed: () => showBottomSheet(context),
          ),
        ),
      ]),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.getColor(ColorKey.primary20),
            child: UniversalImage(
              AssetPaths.icMapPin,
              width: 24,
              height: 24,
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Allow access location',
            textAlign: TextAlign.center,
            style: AssetStyles.h2.copyWith(height: 1.2),
          ),
          const SizedBox(height: 16),
          Text(
            'Before we start we will need to access your location so we can track your location while you are using the app.',
            textAlign: TextAlign.center,
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey50)),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: Button.primary(
                  label: 'Allow access',
                  buttonSize: ButtonSize.full,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Button.secondary(
                  label: 'Nope',
                  buttonSize: ButtonSize.full,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
