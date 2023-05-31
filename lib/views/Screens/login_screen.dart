import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/Screens/HomeScreen.dart';
import 'package:tiktok_clone/views/Screens/signup_screen.dart';
import 'package:tiktok_clone/views/widgets/text_field.dart';

class LoginSreen extends StatefulWidget {
  const LoginSreen({super.key});

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                'Login',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.sp),
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
                  authController.loginUser(
                      _emailController.text, _passwordController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HomeScreen())));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 3.h),
                  height: 8.h,
                  width: double.infinity,
                  child: Center(
                      child: Text('Login',
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
                    'Don\' have an account ?  ',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SignupScreen())));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: buttonColor, fontSize: 18.sp),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
