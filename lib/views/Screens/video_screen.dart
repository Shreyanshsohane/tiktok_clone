import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tiktok_clone/views/widgets/video_player.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});
  buildProfile(String profilePhoto) {
    return Container(
      //color: Colors.amber,
      width: 40.w,
      height: 10.h,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            padding: EdgeInsets.all(1),
            width: 40.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: CircleAvatar(
              radius: 30,
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        // itemCount: ,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              //VideoPlayerItem(videoUrl: ),
              Column(
                children: [
                  // SizedBox(height: 10.),
                  Expanded(
                      child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Username',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Caption',
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
                                    'Song name',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.sp),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 20.h,
                        //color: Colors.white,
                        // margin: EdgeInsets.only(top: 1.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildProfile(
                                'https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg')
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
