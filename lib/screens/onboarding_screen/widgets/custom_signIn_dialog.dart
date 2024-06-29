import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../signIn_form/signin_form.dart';

Future<Object?> customShowDialog(BuildContext context) {
  return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'Sign In',
      transitionDuration: Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAanimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
      context: context,
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 530.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white10.withOpacity(0.94),
            borderRadius: BorderRadius.circular(40.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 34, fontFamily: 'Poppins'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.h, vertical: 16.h),
                      child: Text(
                          textAlign: TextAlign.center,
                          'Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.'),
                    ),
                    SignInForm(),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Text('Sign up with Email, Apple or Google',
                          style: TextStyle(
                            color: Colors.black26,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/email_box.svg',
                              height: 50,
                              width: 50,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/apple_box.svg',
                              height: 50,
                              width: 50,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/google_box.svg',
                              height: 50,
                              width: 50,
                            )),
                      ],
                    ),
                  ],
                ),
                 Positioned(
                  left: 0,
                  right: 0,
                  bottom: -48,
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}
