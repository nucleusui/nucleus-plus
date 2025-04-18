import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucleus_ui/nucleus_ui.dart';
import 'package:video_player/video_player.dart';

class Video2Page extends StatefulWidget {
  const Video2Page({super.key});

  @override
  State<Video2Page> createState() => _Video2PageState();
}

class _Video2PageState extends State<Video2Page> {
  bool isLoading = true;
  bool subscribed = false;
  late VideoPlayerController _controller;
  String sortBy = 'asc';
  final listComment = [
    (
      image: AssetPaths.imgUser4,
      text: 'This could’ve been a hit but everyone slept on it.',
    ),
    (
      image: AssetPaths.imgUser1,
      text: 'This is the Bruno\'s best era.',
    ),
    (
      image: AssetPaths.imgUser4,
      text: 'It’s crazy how many people in 2022 will return',
    ),
    (
      image: AssetPaths.imgUser1,
      text: 'Listening to this during quarantine.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/bee.mp4')
      ..initialize().then((_) => setState(() => isLoading = false));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 232,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Visibility(
                  visible: !isLoading,
                  replacement: const UniversalImage(
                    AssetPaths.imgPlaceholder5,
                    height: 232,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  child: VideoPlayer(_controller),
                ),
                ClosedCaption(text: _controller.value.caption.text),
                if (!_controller.value.isPlaying)
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 50),
                    reverseDuration: const Duration(milliseconds: 200),
                    child: Container(
                      alignment: Alignment.center,
                      color: _controller.value.isPlaying
                          ? Colors.transparent
                          : Colors.black.withValues(alpha: .5),
                      child: const UniversalImage(
                        AssetPaths.icPlayFill,
                        width: 40,
                      ),
                    ),
                  ),
                GestureDetector(
                  onTap: () {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4, right: 8),
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 20,
                          semanticLabel: 'Play',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: AppColors.getColor(ColorKey.primary70),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller
                            .setVolume(_controller.value.volume == 0 ? 100 : 0);
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4, left: 8),
                        child: Icon(
                          _controller.value.volume == 0.0
                              ? Icons.volume_off_rounded
                              : Icons.volume_up,
                          size: 16,
                          semanticLabel: 'Sound',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
                ),
              ]),
            ),
          ),
          Expanded(
            child: ListView(padding: const EdgeInsets.all(16), children: [
              Row(children: [
                Expanded(
                  child: Text(
                    '#Bruno Mars #Anderson Paak #SilkSonic',
                    style: AssetStyles.h6.copyWith(
                      color: AppColors.getColor(ColorKey.primary70),
                    ),
                  ),
                ),
                const UniversalImage(AssetPaths.icArrowDown),
              ]),
              const SizedBox(height: 12),
              Text(
                'Bruno Mars, Anderson.Paak, Silk Sonic - Leave the Door Open (Official Video)',
                style: AssetStyles.h3.copyWith(height: 1.2),
              ),
              const SizedBox(height: 12),
              Text(
                '623.007.286 x views · 22 Sep 2010',
                style: AssetStyles.pXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  (icon: AssetPaths.icLike, value: '4.4M'),
                  (icon: AssetPaths.icDislike, value: '54K'),
                  (icon: AssetPaths.icShare2, value: 'Share'),
                  (icon: AssetPaths.icDownload, value: 'Download'),
                  (icon: AssetPaths.icSaveFolder, value: 'Save'),
                ].map((e) {
                  return Column(
                    children: [
                      UniversalImage(
                        e.icon,
                        color: AppColors.getColor(ColorKey.grey100),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        e.value,
                        style: AssetStyles.pXs.copyWith(
                          color: AppColors.getColor(ColorKey.grey50),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              const PrimaryDivider(),
              const SizedBox(height: 16),
              Row(children: [
                const UniversalImage(
                  AssetPaths.imgUser1,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('James Ryan', style: AssetStyles.h5),
                    Text(
                      '31.6M subscribers',
                      style: AssetStyles.pXs.copyWith(
                        color: AppColors.getColor(ColorKey.grey50),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Button.secondary(
                  label: subscribed ? 'Unsubscribe' : 'Subscribe',
                  labelColor: subscribed ? AssetColors.red : null,
                  buttonSize: ButtonSize.small,
                  onTap: () => setState(() => subscribed = !subscribed),
                ),
              ]),
              const SizedBox(height: 16),
              const PrimaryDivider(),
              const SizedBox(height: 16),
              Row(children: [
                const Expanded(
                    child: Text('12 Comments', style: AssetStyles.h5)),
                PrimaryInkWell(
                  onTap: () => setState(() {
                    if (sortBy == 'asc') {
                      sortBy = 'desc';
                      listComment.sort((a, b) => a.text.compareTo(b.text));
                    } else {
                      sortBy = 'asc';
                      listComment.sort((a, b) => b.text.compareTo(a.text));
                    }
                  }),
                  child: const UniversalImage(AssetPaths.icSort),
                ),
              ]),
              const SizedBox(height: 16),
              ...listComment.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(children: [
                    UniversalImage(
                      e.image,
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(e.text, style: AssetStyles.pSm),
                    ),
                  ]),
                );
              }),
            ]),
          ),
        ]),
      ),
    );
  }
}
