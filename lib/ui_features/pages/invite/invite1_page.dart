import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Invite1Page extends StatefulWidget {
  const Invite1Page({super.key});

  @override
  State<Invite1Page> createState() => _Invite1PageState();
}

class _Invite1PageState extends State<Invite1Page> {
  final listItem = [
    BasicModel(
      name: 'Owen Mitchell',
      icon: AssetPaths.imgUser1,
      value: false,
    ),
    BasicModel(
      name: 'Mason Hayes',
      icon: AssetPaths.imgUser2,
      value: false,
    ),
    BasicModel(
      name: 'Sophia Lawson',
      icon: AssetPaths.imgUser3,
      value: false,
    ),
    BasicModel(
      name: 'Caleb Parker',
      icon: AssetPaths.imgUser1,
      value: false,
    ),
    BasicModel(
      name: 'Lucas Anderson',
      icon: AssetPaths.imgUser7,
      value: false,
    ),
    BasicModel(
      name: 'Emma Fitzgerald',
      icon: AssetPaths.imgUser6,
      value: false,
    ),
    BasicModel(
      name: 'Olivia Reed',
      icon: AssetPaths.imgUser3,
      value: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Add friends'),
      body: ListView(shrinkWrap: true, children: [
        ...[
          (
            title: 'From contacts',
            icon: AssetPaths.icBookBold,
          ),
          (
            title: 'By username',
            icon: AssetPaths.icUserBold,
          ),
          (
            title: 'By phone number',
            icon: AssetPaths.icPhone,
          ),
        ].map((e) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Row(children: [
              UniversalImage(e.icon, height: 16),
              const SizedBox(width: 20),
              Text(e.title, style: AssetStyles.pMd)
            ]),
          );
        }),
        const SizedBox(height: 10),
        const PrimaryDivider(),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('You might know them', style: AssetStyles.h3),
        ),
        ...listItem.map((e) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Row(children: [
              UniversalImage(e.icon!, width: 40, height: 40),
              const SizedBox(width: 20),
              Text(e.name, style: AssetStyles.pMd),
              const Spacer(),
              Visibility(
                visible: e.value,
                replacement: Button.primary(
                  label: 'Add',
                  buttonSize: ButtonSize.small,
                  onPressed: () => setState(() => e.value = !e.value),
                ),
                child: Button.secondary(
                  label: 'Added',
                  buttonSize: ButtonSize.small,
                  onPressed: () => setState(() => e.value = !e.value),
                ),
              ),
            ]),
          );
        }),
      ]),
    );
  }
}
