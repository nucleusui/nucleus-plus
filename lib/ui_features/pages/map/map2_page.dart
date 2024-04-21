import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Map2Page extends StatefulWidget {
  const Map2Page({super.key});

  @override
  State<Map2Page> createState() => _Map2PageState();
}

class _Map2PageState extends State<Map2Page> with TickerProviderStateMixin {
  LatLng _latLng = const LatLng(41.44685613087005, -81.7093551010844);
  late final _animatedMapController = AnimatedMapController(
    vsync: this,
    curve: Curves.easeInOut,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        FlutterMap(
          mapController: _animatedMapController.mapController,
          options: MapOptions(
            initialCenter: _latLng,
            initialZoom: 16,
            onTap: (tapPosition, point) => setState(() {
              _latLng = LatLng(point.latitude, point.longitude);
              _animatedMapController.centerOnPoint(_latLng);
            }),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.spklayanan',
            ),
            MarkerLayer(markers: [
              Marker(
                height: 62,
                width: 42,
                point: _latLng,
                child: const PrimaryAssetImage(
                  AssetPaths.icMapPinLarge,
                  fit: BoxFit.cover,
                ),
              ),
            ]),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 16, top: kToolbarHeight),
          child: PrimaryInkWell(
            onTap: () => Navigator.pop(context),
            child: PrimaryAssetImage(
              AssetPaths.icClose,
              width: 16,
              height: 16,
              color: AppColors.getColor(ColorKey.grey100),
            ),
          ),
        ),
      ]),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: AppColors.getColor(ColorKey.background),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 12),
          Container(
            width: 50,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.getColor(ColorKey.grey30),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Set your pick-up location",
            style: AssetStyles.h3,
          ),
          const SizedBox(height: 16),
          const PrimaryDivider(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text('1226 University of California'),
                const Spacer(),
                PrimaryButton(
                  height: 32,
                  label: 'Search',
                  color: AppColors.getColor(ColorKey.primary20),
                  labelColor: AppColors.getColor(ColorKey.primary70),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              label: 'Set location',
              onTap: () {},
            ),
          ),
        ]),
      ),
    );
  }
}
