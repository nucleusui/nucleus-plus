import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class AudioPlayer2Page extends StatefulWidget {
  const AudioPlayer2Page({super.key});

  @override
  State<AudioPlayer2Page> createState() => _AudioPlayer2PageState();
}

class _AudioPlayer2PageState extends State<AudioPlayer2Page> {
  late Timer _timer;
  double _sliderValue = 15;
  bool play = false;

  void _startTimer({
    required void Function() onStart,
    required void Function(Timer) callback,
  }) {
    onStart();
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, callback);
  }

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showBottomSheet(context));
    super.initState();
  }

  @override
  void dispose() {
    _timer = Timer(Duration.zero, () {});
    _timer.cancel();
    super.dispose();
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
        return Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              const SizedBox(height: 8),
              PrimaryInkWell(
                onTap: () => Navigator.pop(context),
                child: UniversalImage(
                  AssetPaths.icClose,
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              ),
              const Spacer(),
              const Text('Nucleus', style: AssetStyles.h3),
              const Spacer(),
            ]),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              UniversalImage(
                AssetPaths.imgPlaceholder1,
                height: 240,
                width: 240,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(16),
              ),
              const SizedBox(height: 24),
              Text(
                'DESIGN',
                style: AssetStyles.h5.copyWith(
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Educating design system\nwithin organization',
                textAlign: TextAlign.center,
                style: AssetStyles.h2.copyWith(height: 1.2),
              ),
            ]),
          ),
          const SizedBox(height: 36),
          SizedBox(
            height: 24,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(trackHeight: 8),
              child: Slider(
                min: 0,
                max: 59,
                value: _sliderValue,
                activeColor: AppColors.getColor(ColorKey.primary60),
                inactiveColor: AppColors.getColor(ColorKey.primary20),
                onChanged: (value) => setInnerState(() => _sliderValue = value),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('00:${_sliderValue.toStringAsFixed(0).padLeft(2, '0')}',
                    style: AssetStyles.pXs),
                const Text('00:59', style: AssetStyles.pXs)
              ]),
              const SizedBox(height: 32),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const UniversalImage(
                  AssetPaths.icRefreshCcwThin,
                  width: 22,
                  height: 22,
                ),
                PrimaryInkWell(
                  onTap: () {
                    if (play) {
                      _timer.cancel();
                      setInnerState(() => play = false);
                    } else {
                      _startTimer(
                        onStart: () {
                          setInnerState(() {
                            if (_sliderValue == 59) _sliderValue = 0;
                            play = true;
                          });
                        },
                        callback: (Timer timer) {
                          if (_sliderValue < 59) {
                            setInnerState(() => _sliderValue++);
                          } else {
                            _timer.cancel();
                            setInnerState(() => play = false);
                          }
                        },
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.getColor(ColorKey.primary20),
                    child: play
                        ? Icon(
                            Icons.pause,
                            size: 48,
                            color: AppColors.getColor(ColorKey.primary60),
                          )
                        : UniversalImage(
                            AssetPaths.icPlayFill,
                            width: 28,
                            color: AppColors.getColor(ColorKey.primary60),
                          ),
                  ),
                ),
                const UniversalImage(
                  AssetPaths.icRefreshCwThin,
                  width: 22,
                  height: 22,
                ),
              ]),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 72, 16, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const UniversalImage(AssetPaths.ic1x, width: 16),
                const UniversalImage(AssetPaths.icSignal, width: 16),
                UniversalImage(
                  AssetPaths.icMore,
                  width: 16,
                  color: AppColors.getColor(ColorKey.grey100),
                ),
              ],
            ),
          ),
        ]);
      }),
    ).whenComplete(() => play = false);
  }
}
