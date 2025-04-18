import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class CartEmptyPage extends StatefulWidget {
  const CartEmptyPage({super.key});

  @override
  State<CartEmptyPage> createState() => _CartEmptyPageState();
}

class _CartEmptyPageState extends State<CartEmptyPage> {
  int currentIndex = 1;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Cart', hideLeading: true),
      body: Center(
        child: Column(children: [
          const Spacer(),
          Image.asset(
            AssetPaths.imgCart,
            width: 250,
            height: 250,
          ),
          const Text('Your cart is empty', style: AssetStyles.h2),
          const SizedBox(height: 12),
          Text(
            "Looks like you haven't added\nanything to your cart",
            textAlign: TextAlign.center,
            style: AssetStyles.pMd.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(24),
            child: Button.primary(
              label: 'Shop Now',
              onPressed: () {},
            ),
          ),
          const Spacer(),
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
