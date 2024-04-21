import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class InboxEmptyPage extends StatefulWidget {
  const InboxEmptyPage({super.key});

  @override
  State<InboxEmptyPage> createState() => _InboxEmptyPageState();
}

class _InboxEmptyPageState extends State<InboxEmptyPage> {
  int currentIndex = 3;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        Text(
          'Action',
          style: AssetStyles.h3.copyWith(
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Column(children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('My messages', style: AssetStyles.h1),
          ),
          const Spacer(),
          Text(
            'No messages yet',
            style: AssetStyles.pLg.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: PrimaryButton(
              onTap: () {},
              label: 'Start a Message',
            ),
          ),
          const SizedBox(height: 16),
        ]),
      ),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
