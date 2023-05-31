import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10.w,
      height: 3.5.h,
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(left: 3.w),
          width: 20.w,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 45, 108),
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          margin: EdgeInsets.only(right: 3.w),
          width: 20.w,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 211, 234),
              borderRadius: BorderRadius.circular(8)),
        ),
        Center(
          child: Container(
            height: double.infinity,
            width: 30.w,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        )
      ]),
    );
  }
}
