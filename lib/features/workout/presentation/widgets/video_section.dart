import 'package:lottie/lottie.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/utils/app_colors.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({
    super.key,
    required this.url,
  });
  final String url;

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url))
          ..initialize().then((_) {
            _chewieController = ChewieController(
              videoPlayerController: _videoPlayerController,
              autoPlay: false,
              looping: false,
            );
            setState(() {});
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: context.width,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: (_videoPlayerController.value.isInitialized)
          ? SizedBox(
              height: 150.h,
              width: context.width,
              child: Chewie(controller: _chewieController),
            )
          : Center(
              child: Lottie.asset(
                'assets/animation/loading_animation.json',
                height: 70.h,
                width: 70.w,
              ),
            ),
    );
  }
}
