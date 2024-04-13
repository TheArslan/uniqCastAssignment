import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:uniqcastassignment/views/widgets/loading_animation.dart';
import 'package:video_player/video_player.dart';

// Video Player Screen
class VideoPlayerWidget extends StatefulWidget {
  final String? videoUrl;

  const VideoPlayerWidget({
    super.key,
    this.videoUrl,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    if (widget.videoUrl != null) {
      _initFilePlayer();
    }
  }

  _initFilePlayer() async {
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl!),
      videoPlayerOptions: VideoPlayerOptions(),
    )..initialize().then((_) {
        chewieController = ChewieController(
          videoPlayerController: videoController,
          showOptions: false,
          autoPlay: true,
          aspectRatio: videoController.value.aspectRatio,
        );
        setState(() {});
      });
  }

  @override
  void dispose() {
    chewieController?.dispose();
    videoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: chewieController?.videoPlayerController.value.isInitialized ?? false
          ? SafeArea(
              child: Chewie(
              controller: chewieController!,
            ))
          : const Center(child: LoadingAnimation()),
    );
  }
}
