import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tiktok_clone/controller/video_controller.dart';
import 'package:tiktok_clone/views/widgets/circle_animated.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/views/widgets/video_player.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});

  final VideoController videoControlleR = Get.put(VideoController());

  buildProfile(String profilePhoto) {
    return Container(
      //color: Colors.amber,
      width: 12.w,
      height: 12.w,
      // child: Image(
      //   image: NetworkImage(profilePhoto),
      //   fit: BoxFit.cover,
      // ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.amber),
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(11),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          itemCount: videoControlleR.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoControlleR.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(videoUrl: data.videoUrl),
                Positioned(
                  left: 13,
                  bottom: 12,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        data.username,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data.caption,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.music_note,
                            size: 18.sp,
                            color: Colors.white,
                          ),
                          Text(
                            data.songname,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 3,
                  top: 25.h,
                  child: Container(
                    // color: Colors.pink,
                    height: 60.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildProfile(
                            'https://images.pexels.com/photos/1557652/pexels-photo-1557652.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(Icons.favorite,
                                  size: 40, color: Colors.red),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              data.likes.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.comment,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              data.commentCount.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.reply,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              data.commentCount.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        CircleAnimation(
                          child: buildMusicAlbum("data.profilePhoto"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      }),
    );
  }
}
