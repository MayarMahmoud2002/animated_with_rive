import 'dart:ui';
import 'package:animation_with_rive/screens/onboarding_screen/widgets/animated_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Positioned(
                width: MediaQuery.of(context).size.width * 1.7,
                bottom: 200,
                left: 100,
                child: Image.asset('assets/Backgrounds/Spline.png')),
            RiveAnimation.asset(
              'assets/RiveAssets/shapes.riv',
              fit: BoxFit.cover,
            ),
            //to create blur
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: SizedBox(),
            )),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 260.w,
                      child: Column(
                        children: [
                          Text(
                            'Learn design & code',
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: "Poppins",
                              height: 1.2.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Don\'t skip design. Learn design and code, by building real apps with Flutter ans Swift. Complete courses about the best tools.',
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        showGeneralDialog(
                          barrierDismissible: true,
                            barrierLabel: 'Sign In',
                            context: context,
                            pageBuilder: (context, _, __) => Center(
                                  child: Container(
                                    height: 450.h,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16.w ),
                                    decoration: BoxDecoration(
                                      color: Colors.white10.withOpacity(0.94),
                                      borderRadius: BorderRadius.circular(40.r),
                                    ),
                                    padding:EdgeInsets.symmetric(horizontal: 24.w , vertical: 32.h) ,
                                    child: Scaffold(
                                      backgroundColor: Colors.transparent,
                                      resizeToAvoidBottomInset: true,
                                      body: Column(children: 
                                      [
                                        Text(
                                          'Sign In' ,
                                          style: TextStyle(fontSize: 34, fontFamily: 'Poppins'),),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 8.h , vertical: 16.h),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                              'Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.'
                                          ),
                                        ),
                                        SignInForm(),

                                      ],),
                                    ),
                                  ),
                                ));},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Text(
                        'Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email' , style: TextStyle(color: Colors.black54),),
      SizedBox(
        height: 5.h,
      ),
      Container(
        color: Colors.white,
        child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/icons/email.svg'),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white10, ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
            ),
      ),
        SizedBox(
          height: 10.h,
        ),
        Text('Password' , style: TextStyle(color: Colors.black54),),
        SizedBox(
          height: 5.h,
        ),
        Container(
          color: Colors.white,
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/password.svg'),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white38, ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

