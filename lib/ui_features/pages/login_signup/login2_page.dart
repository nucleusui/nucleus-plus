import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/input/primary_switch.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucles_app/utils/form_validator.dart';

class Login2Page extends StatefulWidget {
  const Login2Page({super.key});

  @override
  State<Login2Page> createState() => _Login2PageState();
}

class _Login2PageState extends State<Login2Page> {
  bool rememberSignIn = true;
  final emailController = TextEditingController(text: 'nucleus.ui@gmail.com');
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: "Log In"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          PrimaryTextField(
            controller: emailController,
            labelText: "Email",
            hintText: "example@org.com",
            textInputType: TextInputType.emailAddress,
            validator: FormValidator.email,
          ),
          const SizedBox(height: 20),
          PrimaryTextField(
            controller: passwordController,
            labelText: "Password",
            isPassword: true,
            validator: FormValidator.password,
            textInputAction: TextInputAction.send,
          ),
          Row(children: [
            PrimaryButton(
              label: "Forgot password?",
              transparent: true,
              padding: EdgeInsets.zero,
              labelStyle: AssetStyles.h4
                  .copyWith(color: AppColors.getColor(ColorKey.primary60)),
              onTap: () => debugPrint("Forgot password"),
            ),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Text(
              'Remember sign in details',
              style: AssetStyles.pMd
                  .copyWith(color: AppColors.getColor(ColorKey.grey50)),
            ),
            const Spacer(),
            PrimarySwitch(
              value: rememberSignIn,
              onChanged: (e) =>
                  setState(() => rememberSignIn = !rememberSignIn),
            ),
            const SizedBox(width: 16),
          ]),
        ]),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          label: "Log in",
          width: double.infinity,
          onTap: () {},
        ),
      ),
    );
  }
}
