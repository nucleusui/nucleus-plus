import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Map1Page extends StatefulWidget {
  const Map1Page({super.key});

  @override
  State<Map1Page> createState() => _Map1PageState();
}

class _Map1PageState extends State<Map1Page> with TickerProviderStateMixin {
  int currentIndex = 2;
  LatLng _latLng = const LatLng(41.44685613087005, -81.7093551010844);
  late final _animatedMapController = AnimatedMapController(
    vsync: this,
    curve: Curves.easeInOut,
  );
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

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
                child: const UniversalImage(
                  AssetPaths.icMapPinLarge,
                  fit: BoxFit.cover,
                ),
              ),
            ]),
          ],
        ),
        Positioned(
          top: kToolbarHeight,
          left: 16,
          right: 16,
          child: PrimaryTextField(
            height: 48,
            hintText: 'Search',
            contentPadding: const EdgeInsets.only(top: 9),
            fillColor: AppColors.getColor(ColorKey.background),
            borderRadius: BorderRadius.circular(100),
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 8, 10),
              child: UniversalImage(
                AssetPaths.icSearch,
                width: 16,
                height: 16,
                color: AppColors.getColor(ColorKey.grey100),
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: AppColors.getColor(ColorKey.background),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.getColor(ColorKey.grey30),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Amici’s Eat Coast Pizzeria",
                    style: AssetStyles.h3,
                  ),
                  Row(children: [
                    Text(
                      "\$\$ . Pizza, Pasta, Salads, Wings",
                      style: AssetStyles.pSm.copyWith(
                        color: AppColors.getColor(ColorKey.grey50),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "3 min walk",
                      style: AssetStyles.pSm.copyWith(
                        color: AppColors.getColor(ColorKey.grey50),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                children: [
                  (
                    name: "New York",
                    price: "\$11.75",
                    image: AssetPaths.imgPlaceholder21
                  ),
                  (
                    name: "Build Your Pizza (Medium)",
                    price: "\$24.75",
                    image: AssetPaths.imgPlaceholder23
                  ),
                  (
                    name: "Build Your Pizza (Large)",
                    price: "\$31.75)",
                    image: AssetPaths.imgPlaceholder21
                  )
                ].map((e) {
                  return SizedBox(
                    width: 124,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UniversalImage(
                          e.image,
                          width: 130,
                          height: 124,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          e.name,
                          style: AssetStyles.h6.copyWith(height: 1.2),
                        ),
                        const SizedBox(height: 4),
                        Text(e.price, style: AssetStyles.pXs),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
