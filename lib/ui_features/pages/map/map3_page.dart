import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/map_model.dart';
import 'package:nucles_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Map3Page extends StatefulWidget {
  const Map3Page({super.key});

  @override
  State<Map3Page> createState() => _Map3PageState();
}

class _Map3PageState extends State<Map3Page> {
  LatLng _latLng = const LatLng(41.44685613087005, -81.7093551010844);
  final listItem = [
    MapModel(
      coordinate: const LatLng(41.446688, -81.706691),
      price: '\$88',
      active: true,
    ),
    MapModel(
      coordinate: const LatLng(41.447386, -81.707819),
      price: '\$123',
      active: false,
    ),
    MapModel(
      coordinate: const LatLng(41.448863, -81.709126),
      price: '\$76',
      active: false,
    ),
    MapModel(
      coordinate: const LatLng(41.449237, -81.706069),
      price: '\$50',
      active: false,
    ),
    MapModel(
      coordinate: const LatLng(41.450291, -81.708759),
      price: '\$190',
      active: false,
    ),
    MapModel(
      coordinate: const LatLng(41.451473, -81.706887),
      price: '\$110',
      active: false,
    ),
    MapModel(
      coordinate: const LatLng(41.451602, -81.712682),
      price: '\$200',
      active: false,
    ),
    MapModel(
      coordinate: const LatLng(41.450787, -81.71162),
      price: '\$90',
      active: false,
    ),
    MapModel(
      coordinate: const LatLng(41.450064, -81.711007),
      price: '\$140',
      active: false,
    ),
    MapModel(
      coordinate: const LatLng(41.448679, -81.71211),
      price: '\$130',
      active: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: _latLng,
            initialZoom: 16,
            onTap: (tapPosition, point) => setState(
                () => _latLng = LatLng(point.latitude, point.longitude)),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.spklayanan',
            ),
            MarkerLayer(
              markers: listItem.map((e) {
                return Marker(
                  height: 45,
                  width: 69,
                  point: e.coordinate,
                  child: PrimaryChip(
                    text: e.price,
                    isActive: e.active,
                    backgroundColor: e.active ? null : Colors.white,
                    onTap: () => setState(() => e.active = !e.active),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 16, top: kToolbarHeight),
          child: PrimaryInkWell(
            onTap: () => Navigator.pop(context),
            child: UniversalImage(
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
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Select property",
                style: AssetStyles.h4.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 16,
                children: [
                  (
                    title: "Entire House",
                    subtitle: "Huntington Beach Bungalow",
                    price: 250,
                    image: AssetPaths.imgPlaceholder24,
                    rating: 4.65,
                  ),
                  (
                    title: "Entire House",
                    subtitle: "Perfect Beach House in New...",
                    price: 250,
                    image: AssetPaths.imgPlaceholder25,
                    rating: 4.65,
                  ),
                  (
                    title: "Entire House",
                    subtitle: "Perfect Beach House in New...",
                    price: 250,
                    image: AssetPaths.imgPlaceholder2,
                    rating: 4.65,
                  ),
                ].map((e) {
                  return SizedBox(
                    width: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UniversalImage(
                          e.image,
                          width: 240,
                          height: 160,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        const SizedBox(height: 10),
                        Text(e.title, style: AssetStyles.pSm),
                        Text(
                          e.subtitle,
                          overflow: TextOverflow.ellipsis,
                          style: AssetStyles.h4.copyWith(height: 1.2),
                        ),
                        const SizedBox(height: 16),
                        Row(children: [
                          Text.rich(
                            style: AssetStyles.h4,
                            TextSpan(
                              text: '\$${e.price}',
                              children: const [
                                TextSpan(
                                  text: '/night',
                                  style: AssetStyles.pSm,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const UniversalImage(
                            AssetPaths.icStarBold,
                            width: 16,
                          ),
                          const SizedBox(width: 5),
                          Text('${e.rating}', style: AssetStyles.h4),
                        ]),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
