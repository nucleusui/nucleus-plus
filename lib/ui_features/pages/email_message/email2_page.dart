import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/email_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Email2Page extends StatefulWidget {
  const Email2Page({super.key});

  @override
  State<Email2Page> createState() => _Email2PageState();
}

class _Email2PageState extends State<Email2Page> {
  final listItem = [
    EmailModel(
      image: AssetPaths.imgUser1,
      name: 'James Ryan',
      message:
          'Hello, this is the new concept for you to review, please consider the...',
      time: '08:12 AM',
      isRead: false,
      hasAttachment: true,
      isFavorite: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser7,
      name: 'Mathilde Langevin',
      message:
          'Hello, this is the new concept for you to review, please consider the...',
      time: '05:00 PM',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser3,
      name: 'Amanda Gonzales',
      message:
          'NBA’s December restart: Why do it, who’s ready to drink out of the fir...',
      time: '11:12 AM',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser2,
      name: 'Andy Wyatt',
      message:
          'NBA’s December restart: Why do it, who’s ready to drink out of the fir...',
      time: '01:09 PM',
      isRead: true,
      hasAttachment: true,
      isFavorite: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser6,
      name: 'Shanice Smith',
      message: 'Can you send me the photos from last trip to Bali last month? ',
      time: 'Yesterday, 05:10 PM',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser7,
      name: 'Mathilde Langevin',
      message:
          'Hello, this is the new concept for you to review, please consider the...',
      time: '05:00 PM',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser3,
      name: 'Amanda Gonzales',
      message:
          'NBA’s December restart: Why do it, who’s ready to drink out of the fir...',
      time: '11:12 AM',
      isRead: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser2,
      name: 'Andy Wyatt',
      message:
          'NBA’s December restart: Why do it, who’s ready to drink out of the fir...',
      time: '01:09 PM',
      isRead: true,
      hasAttachment: true,
      isFavorite: true,
    ),
    EmailModel(
      image: AssetPaths.imgUser6,
      name: 'Shanice Smith',
      message: 'Can you send me the photos from last trip to Bali last month? ',
      time: 'Yesterday, 05:10 PM',
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        hideLeading: true,
        titleWidget: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: PrimaryTextField(
            height: 40,
            hintText: 'Search',
            contentPadding: const EdgeInsets.only(top: 7),
            fillColor: AppColors.getColor(ColorKey.grey10),
            borderRadius: BorderRadius.circular(100),
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 8, 10),
              child: UniversalImage(
                AssetPaths.icSearch,
                width: 20,
                height: 20,
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
            suffixPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            suffixIcon: UniversalImage(
              AssetPaths.icMicrophone,
              width: 20,
              height: 20,
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
        ),
      ),
      floatingActionButton: Button.primary(
        label: 'Compose',
        buttonSize: ButtonSize.large,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: UniversalImage(AssetPaths.icPlus),
        ),
        onTap: () {},
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Text(
          'INBOX',
          style: AssetStyles.h5.copyWith(
            color: AppColors.getColor(ColorKey.grey50),
          ),
        ),
        const SizedBox(height: 4),
        ...listItem.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: PrimaryInkWell(
              onTap: () => setState(() => e.isRead = !e.isRead),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UniversalImage(
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
                        Row(children: [
                          Text(
                            e.name,
                            style: AssetStyles.h5.copyWith(
                              fontWeight:
                                  e.isRead ? FontWeight.w400 : FontWeight.w700,
                              color: AppColors.getColor(ColorKey.grey100),
                            ),
                          ),
                          const Spacer(),
                          if (e.hasAttachment ?? false)
                            UniversalImage(
                              AssetPaths.icAttachment,
                              width: 11,
                              color: AppColors.getColor(ColorKey.grey60),
                            ),
                          const SizedBox(width: 6),
                          Text(
                            e.time,
                            style: AssetStyles.h6.copyWith(
                              fontWeight:
                                  e.isRead ? FontWeight.w400 : FontWeight.w700,
                              color: e.isRead
                                  ? AppColors.getColor(ColorKey.grey60)
                                  : AppColors.getColor(ColorKey.primary70),
                            ),
                          )
                        ]),
                        const SizedBox(height: 4),
                        Row(children: [
                          Expanded(
                            child: Text(
                              e.message,
                              maxLines: 2,
                              style: AssetStyles.pSm.copyWith(
                                overflow: TextOverflow.ellipsis,
                                color: e.isRead
                                    ? AppColors.getColor(ColorKey.grey60)
                                    : AppColors.getColor(ColorKey.grey100),
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          UniversalImage(
                            AssetPaths.icStarBold,
                            width: 18,
                            color: AppColors.getColor(ColorKey.grey50),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ]),
    );
  }
}
