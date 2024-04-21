import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/email_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Email1Page extends StatefulWidget {
  const Email1Page({super.key});

  @override
  State<Email1Page> createState() => _Email1PageState();
}

class _Email1PageState extends State<Email1Page> {
  final listItem = [
    EmailModel(
      image: AssetPaths.imgUser1,
      name: 'James Ryan',
      message: 'Hello, this is the new concept concept conceptconcept',
      time: 'Nov 6',
      isRead: false,
    ),
    EmailModel(
      image: AssetPaths.imgUser3,
      name: 'Amanda Gonzales',
      message: 'Hello, this is the new concept concept conceptconcept',
      time: 'Nov 2',
      isRead: false,
    ),
    EmailModel(
      image: AssetPaths.imgUser2,
      name: 'Andy Wyatt',
      message: 'Can you send me the photos',
      time: 'Oct 15',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser7,
      name: 'Mathilde Langevin',
      message: 'Just a reminder, can you',
      time: 'Oct 12',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser1,
      name: 'James Ryan',
      message: 'Hello, this is the new concept concept conceptconcept',
      time: 'Nov 6',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser3,
      name: 'Amanda Gonzales',
      message: 'Hello, this is the new concept concept conceptconcept',
      time: 'Nov 2',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser2,
      name: 'Andy Wyatt',
      message: 'Can you send me the photos',
      time: 'Oct 15',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser7,
      name: 'Mathilde Langevin',
      message: 'Just a reminder, can you',
      time: 'Oct 12',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser1,
      name: 'James Ryan',
      message: 'Hello, this is the new concept concept conceptconcept',
      time: 'Nov 6',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser3,
      name: 'Amanda Gonzales',
      message: 'Hello, this is the new concept concept conceptconcept',
      time: 'Nov 2',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser2,
      name: 'Andy Wyatt',
      message: 'Can you send me the photos',
      time: 'Oct 15',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser7,
      name: 'Mathilde Langevin',
      message: 'Just a reminder, can you',
      time: 'Oct 12',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser1,
      name: 'James Ryan',
      message: 'Hello, this is the new concept concept conceptconcept',
      time: 'Nov 6',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser3,
      name: 'Amanda Gonzales',
      message: 'Hello, this is the new concept concept conceptconcept',
      time: 'Nov 2',
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Inbox',
        leading: const PrimaryAssetImage(
          AssetPaths.icMenu,
          fit: BoxFit.scaleDown,
        ),
        actions: [
          PrimaryAssetImage(
            AssetPaths.icSearch,
            width: 20,
            fit: BoxFit.scaleDown,
            color: AppColors.getColor(ColorKey.grey100),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: listItem.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: PrimaryInkWell(
              onTap: () => setState(() => e.isRead = !e.isRead),
              child: Row(children: [
                PrimaryAssetImage(
                  e.image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.scaleDown,
                  borderRadius: BorderRadius.circular(100),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.name,
                        style: AssetStyles.h5.copyWith(
                          fontWeight:
                              e.isRead ? FontWeight.w400 : FontWeight.w700,
                          color: AppColors.getColor(ColorKey.grey100),
                        ),
                      ),
                      Text(
                        e.message,
                        maxLines: 1,
                        style: AssetStyles.pSm.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: e.isRead
                              ? AppColors.getColor(ColorKey.grey60)
                              : AppColors.getColor(ColorKey.grey100),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                Text(
                  e.time,
                  style: AssetStyles.h6.copyWith(
                    fontWeight: e.isRead ? FontWeight.w400 : FontWeight.w700,
                    color: e.isRead
                        ? AppColors.getColor(ColorKey.grey60)
                        : AppColors.getColor(ColorKey.primary70),
                  ),
                )
              ]),
            ),
          );
        }).toList(),
      ),
    );
  }
}
