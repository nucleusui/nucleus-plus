import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

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
          margin: const EdgeInsets.only(bottom: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            PrimaryButton(
              label: 'Show Bottom Sheet',
              onTap: () => showBottomSheet(context),
            ),
          ]),
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
            child: PrimaryAssetImage(
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
                child: PrimaryButton(
                  onTap: () {},
                  label: 'Allow access',
                  width: double.infinity,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PrimaryButton(
                  onTap: () => Navigator.pop(context),
                  label: 'Nope',
                  width: double.infinity,
                  color: AppColors.getColor(ColorKey.primary20),
                  labelColor: AppColors.getColor(ColorKey.primary70),
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
