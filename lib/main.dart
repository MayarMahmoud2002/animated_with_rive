import 'package:animation_with_rive/screens/signIn_form/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_ , child)
      {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInForm(),
        );
      },
      designSize:const Size(360, 640),
    );
  }
}


