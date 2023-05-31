import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/Screens/login_screen.dart';
import 'package:tiktok_clone/views/widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'TikTok Clone',
                  style: TextStyle(
                      color: buttonColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 24.sp),
                ),
                SizedBox(height: 3.h),
                Text(
                  'Register',
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 22.sp),
                ),
                SizedBox(height: 3.h),
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35.sp,
                    ),
                    Positioned(
                        bottom: -1.5.h,
                        right: -1.w,
                        child: IconButton(
                          iconSize: 25.sp,
                          color: buttonColor,
                          icon: const Icon(Icons.add_a_photo),
                          onPressed: () {
                            authController.pickImage();
                          },
                        ))
                  ],
                ),
                SizedBox(height: 3.h),
                TextInputField(
                  labelText: 'User Name',
                  controller: _usernameController,
                  prefixIcon: Icons.lock,
                ),
                SizedBox(height: 3.h),
                TextInputField(
                  labelText: 'Email',
                  controller: _emailController,
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 3.h),
                TextInputField(
                  labelText: 'Password',
                  controller: _passwordController,
                  prefixIcon: Icons.lock,
                ),
                InkWell(
                  onTap: () {
                    authController.registerUSer(
                      _usernameController.text,
                      _emailController.text,
                      _passwordController.text,
                      authController.profilePhoto,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 3.h),
                    height: 8.h,
                    width: double.infinity,
                    child: Center(
                        child: Text('Register',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w600))),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ?  ',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginSreen())));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: buttonColor, fontSize: 18.sp),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
