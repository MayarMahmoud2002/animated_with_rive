import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
   AnimatedBtn({
    Key? key,
    required RiveAnimationController btnAnimationController, required this.press,

  }) :  _btnAnimationController = btnAnimationController ,
  super(key: key);
  late RiveAnimationController _btnAnimationController;
  final VoidCallback press;


  @override
  Widget build(BuildContext context) {

    return   GestureDetector(
      onTap: press,
      child: SizedBox(
          height: 64.h,
          width: 260.w,
          child: Stack(
            children: [
              RiveAnimation.asset('assets/RiveAssets/button.riv',
                controllers: [_btnAnimationController],
              ),
              Positioned.fill(
                top: 8.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.arrow_right),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Start the Course',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );

  }

}
