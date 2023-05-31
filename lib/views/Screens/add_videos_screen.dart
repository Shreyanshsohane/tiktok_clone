import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/Screens/Confirmation_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConfirmScreen(
                  videoPath: video.path, videoFile: File(video.path))));
    }
  }

  ShowOptionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.camera, context);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.camera_alt),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Camera'),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.gallery, context);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.image),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gallery'),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.cancel),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Cancel'),
                      )
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {
          ShowOptionDialog(context);
        },
        child: Container(
          width: 40.w,
          height: 7.h,
          decoration: BoxDecoration(color: buttonColor),
          child: Center(
            child: Text(
              'Add Video',
              style: TextStyle(
                  fontSize: 19.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      )),
    );
  }
}
