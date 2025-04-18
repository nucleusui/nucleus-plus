import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/utils/form_validator.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Signup2Page extends StatefulWidget {
  const Signup2Page({super.key});

  @override
  State<Signup2Page> createState() => _Signup2PageState();
}

class _Signup2PageState extends State<Signup2Page> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          Button.ghost(
            label: "Login",
            padding: EdgeInsets.zero,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          const Text(
            'Join Nucleus',
            textAlign: TextAlign.center,
            style: AssetStyles.h1,
          ),
          const SizedBox(height: 8),
          Text(
            'Start building your design system with our\ncomponent library',
            textAlign: TextAlign.center,
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey60)),
          ),
          const SizedBox(height: 24),
          TextFields(
            controller: emailController,
            labelText: "Email",
            hintText: "example@org.com",
            textInputType: TextInputType.emailAddress,
            validator: FormValidator.email,
            textInputAction: TextInputAction.done,
            onChanged: (e) => setState(() {}),
          ),
          const SizedBox(height: 16),
          Button.primary(
            label: "Get Started",
            buttonSize: ButtonSize.full,
            onPressed: emailController.text.isEmpty ? null : () {},
          ),
          const SizedBox(height: 24),
          Stack(alignment: Alignment.center, children: [
            Divider(thickness: 1, color: AppColors.getColor(ColorKey.grey20)),
            Container(
              color: AppColors.getColor(ColorKey.background),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'OR',
                style: AssetStyles.labelXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ]),
          const SizedBox(height: 24),
          Button.social(
            label: 'Continue with Apple',
            color: Colors.black,
            prefixIcon: const UniversalImage(AssetPaths.icApple),
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          Button.social(
            label: 'Continue with Google',
            labelColor: Colors.black,
            color: AppColors.getColor(ColorKey.grey10),
            prefixIcon: const UniversalImage(AssetPaths.icGoogle),
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          Button.social(
            label: 'Continue with Facebook',
            color: AssetColors.facebook,
            prefixIcon: const UniversalImage(AssetPaths.icFacebook),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'By registering you agree to\nour ',
            style: AssetStyles.pXs.copyWith(
              height: 1.4,
              color: AppColors.getColor(ColorKey.grey50),
            ),
            children: [
              TextSpan(
                text: 'Terms of Use',
                style: AssetStyles.pXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey100),
                ),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: AssetStyles.pXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
