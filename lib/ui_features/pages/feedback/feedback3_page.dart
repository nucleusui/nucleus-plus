import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Feedback3Page extends StatefulWidget {
  const Feedback3Page({super.key});

  @override
  State<Feedback3Page> createState() => _Feedback3PageState();
}

class _Feedback3PageState extends State<Feedback3Page> {
  double rating = 0;

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Show Bottom Sheet',
          buttonSize: ButtonSize.large,
          onPressed: () => showBottomSheet(context),
        ),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: PrimaryInkWell(
                onTap: () => Navigator.pop(context),
                child: const UniversalImage(AssetPaths.icClose),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'How was your experience with\nour design system??',
              textAlign: TextAlign.center,
              style: AssetStyles.h2.copyWith(height: 1.2),
            ),
            const SizedBox(height: 16),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              itemCount: 5,
              glowRadius: 0,
              itemSize: 28,
              allowHalfRating: false,
              glowColor: Colors.amber,
              direction: Axis.horizontal,
              itemPadding: const EdgeInsets.only(right: 10, bottom: 15),
              itemBuilder: (context, index) => UniversalImage(
                AssetPaths.icStar,
                color: rating <= index
                    ? null
                    : AppColors.getColor(ColorKey.primary60),
              ),
              onRatingUpdate: (double value) =>
                  setInnerState(() => rating = value),
            ),
            const SizedBox(height: 16),
            const InputField(
              minLines: 4,
              maxLines: 10,
              height: null,
              hintText: 'Let us know what you think',
              initialValue:
                  'It’s been a great experience using Nucleus for our design system',
            ),
            const SizedBox(height: 24),
            Button.primary(
              label: 'Send',
              buttonSize: ButtonSize.full,
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(height: screenHeight(context) / 3),
          ]),
        );
      }),
    );
  }
}
