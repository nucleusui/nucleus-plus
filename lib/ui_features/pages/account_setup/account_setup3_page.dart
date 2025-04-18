import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/utils/form_validator.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class AccountSetup3Page extends StatefulWidget {
  const AccountSetup3Page({super.key});

  @override
  State<AccountSetup3Page> createState() => _AccountSetup3PageState();
}

class _AccountSetup3PageState extends State<AccountSetup3Page> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        titleWidget: SizedBox(
          width: 80,
          child: Stack(alignment: Alignment.centerLeft, children: [
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.getColor(ColorKey.grey20),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 4,
              width: 24,
              decoration: BoxDecoration(
                color: AppColors.getColor(ColorKey.primary60),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ]),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: Button.primary(
          label: "Next",
          buttonSize: ButtonSize.full,
          onTap: () {},
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          const Text(
            'Email address',
            style: AssetStyles.h2,
          ),
          const SizedBox(height: 12),
          TextFields(
            autofocus: true,
            controller: emailController,
            hintText: "Text you just entered",
            textInputType: TextInputType.emailAddress,
            validator: FormValidator.email,
          ),
        ],
      ),
    );
  }
}
