import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/chat_model.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/chat/secondary_chat_bubble.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Chat3Page extends StatefulWidget {
  const Chat3Page({super.key});

  @override
  State<Chat3Page> createState() => _Chat3PageState();
}

class _Chat3PageState extends State<Chat3Page> {
  int currentIndex = 4;
  final List<NavbarModel> navbars = [
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: 'Jeremy',
          actions: [
            UniversalImage(
              AssetPaths.icSetting,
              width: 20,
              color: AppColors.getColor(ColorKey.primary60),
            ),
            const SizedBox(width: 5),
          ],
        ),
        body: Column(children: [
          TabBar(
            indicatorWeight: 1,
            labelPadding: const EdgeInsets.symmetric(vertical: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.getColor(ColorKey.primary60),
            unselectedLabelColor: AppColors.getColor(ColorKey.grey50),
            labelStyle: AssetStyles.h4.copyWith(fontFamily: 'PlusJakartaSans'),
            tabs: ['Message', 'Details', 'Help'].asMap().entries.map((e) {
              return Text(e.value);
            }).toList(),
          ),
          Expanded(
            child: TabBarView(children: [
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                children: [
                  ChatModel(
                    message:
                        'Hey Jeremy! Thank you for your purchase. Let me know if you need something 🙌🏼',
                    time: '2.02 PM',
                    sender: 'other',
                  ),
                  ChatModel(
                    message: 'Purchased wrongly, I need to\ncheck again',
                    time: '2.04 PM',
                    sender: 'myself',
                  ),
                  ChatModel(
                    message: 'Sorry about this!',
                    time: '2.04 PM',
                    sender: 'myself',
                  ),
                  ChatModel(
                    message: 'No worries! Do you have any questions?',
                    time: '2.05 PM',
                    sender: 'other',
                  ),
                ].map((e) => SecondaryChatBubble(e)).toList(),
              ),
              const Center(child: Text('Details Tab', style: AssetStyles.pMd)),
              const Center(child: Text('Help Tab', style: AssetStyles.pMd)),
            ]),
          ),
        ]),
        bottomNavigationBar: PrimaryNavbar(
          index: currentIndex,
          data: navbars,
          onTap: (index) => setState(() => currentIndex = index),
        ),
      ),
    );
  }
}
