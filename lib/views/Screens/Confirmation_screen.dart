import 'dart:io';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tiktok_clone/controller/upload_video_controller.dart';
import 'package:tiktok_clone/views/widgets/text_field.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    super.key,
    required this.videoFile,
    required this.videoPath,
  });

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();

  UploadVideoController _uploadVideoController =
      Get.put(UploadVideoController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              width: 60.w,
              height: 40.h,
              child: VideoPlayer(controller),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    width: 80.w,
                    child: TextInputField(
                      controller: _songController,
                      labelText: 'Song Name',
                      prefixIcon: Icons.music_note,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    width: 80.w,
                    child: TextInputField(
                      controller: _captionController,
                      labelText: 'Caption',
                      prefixIcon: Icons.music_note,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  ElevatedButton(
                      onPressed: () {
                        _uploadVideoController.uploadVideo(_songController.text,
                            _captionController.text, widget.videoPath);
                      },
                      child: Text(
                        'Share',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
