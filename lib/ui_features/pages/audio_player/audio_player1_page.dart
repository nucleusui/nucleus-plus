import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class AudioPlayer1Page extends StatefulWidget {
  const AudioPlayer1Page({super.key});

  @override
  State<AudioPlayer1Page> createState() => _AudioPlayer1PageState();
}

class _AudioPlayer1PageState extends State<AudioPlayer1Page> {
  late Timer _timer;
  double _sliderValue = 15;
  bool play = false;

  @override
  void dispose() {
    _timer = Timer(Duration.zero, () {});
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      if (_sliderValue == 59) _sliderValue = 0;
      play = true;
    });
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      if (_sliderValue < 59) {
        setState(() => _sliderValue++);
      } else {
        _timer.cancel();
        setState(() => play = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Album name',
        actions: [
          UniversalImage(AssetPaths.icMore),
          SizedBox(width: 5),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UniversalImage(
                  AssetPaths.imgPlaceholder2,
                  height: 343,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(16),
                ),
                const SizedBox(height: 16),
                const Text('Title', style: AssetStyles.h2),
                const Text('Singer', style: AssetStyles.pMd),
              ],
            ),
          ),
          const SizedBox(height: 24),
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
                onChanged: (value) => setState(() => _sliderValue = value),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '00:${_sliderValue.toStringAsFixed(0).padLeft(2, '0')}',
                        style: AssetStyles.pXs),
                    const Text('00:59', style: AssetStyles.pXs)
                  ],
                ),
                const SizedBox(height: 47),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const UniversalImage(AssetPaths.icShuffle),
                    const UniversalImage(AssetPaths.icSkipBack),
                    PrimaryInkWell(
                      onTap: () {
                        if (play) {
                          _timer.cancel();
                          setState(() => play = false);
                        } else {
                          _startTimer();
                        }
                      },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.getColor(ColorKey.primary60),
                        child: play
                            ? const Icon(Icons.pause, color: Colors.white)
                            : const UniversalImage(
                                AssetPaths.icPlay,
                                width: 16,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    const UniversalImage(AssetPaths.icSkipForward),
                    UniversalImage(
                      AssetPaths.icRefreshCw,
                      color: AppColors.getColor(ColorKey.grey60),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UniversalImage(
              AssetPaths.icShare2,
              height: 16,
              color: AppColors.getColor(ColorKey.grey70),
            ),
            UniversalImage(
              AssetPaths.icList,
              height: 12,
              color: AppColors.getColor(ColorKey.grey70),
            ),
          ],
        ),
      ),
    );
  }
}
