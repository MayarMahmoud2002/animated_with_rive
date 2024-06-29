
import 'package:animation_with_rive/screens/entry_point_screen/entry_point_screen.dart';
import 'package:animation_with_rive/utilis/rive_utilis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;


  bool isShowLoading = false;

  void SignIn (BuildContext context ) {
    setState(() {
      isShowLoading = true;
    });
    Future.delayed(Duration(seconds: 1),
            ()
        {
          if (_formKey.currentState!.validate())
          {
            check.fire();
            Future.delayed(Duration(seconds: 2), ()
            {
              setState(() {
                isShowLoading = false;
              });
              confetti.fire();
              Future.delayed(Duration(seconds: 1),
                    ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EntryPoint()));
                },);

            });
          }else
          {
            error.fire();
            Future.delayed(Duration(seconds: 2),
                    ()
                {
                  isShowLoading = false;
                });
          }
        });

  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8 , bottom: 8),
                    child: Container(
                      color: Colors.white,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return "";
                          }
                          return null;
                        },
                        onSaved: (password)
                        {

                        },
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/icons/email.svg'),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white10,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8 , bottom: 16),
                    child: Container(
                      color: Colors.white,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        validator: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return "";
                          }
                          return null;
                        },
                        onSaved: (password)
                        {

                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/icons/password.svg'),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white38,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0 , bottom: 24),
                    child: ElevatedButton.icon(

                      onPressed: ()
                      {
                        //hereeeeeeeeeeeeeee
                        SignIn(context);

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF77D8E),
                          minimumSize: Size(double.infinity , 56),

                          // Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),

                            ),
                          )
                      ),
                      icon: Icon(CupertinoIcons.arrow_right , color: Color(0xFFFE0037)),
                      label: Text('Sign In' , style: TextStyle(color: Colors.white),),
                    ),


                  ),
                ],
              ),
            )
        ),
        isShowLoading ? CustomPositioned(child:RiveAnimation.asset("assets/RiveAssets/check.riv",
          onInit: (artboard)
          {
            StateMachineController controller = RiveUtils.getRiveController(artboard);
            check  = controller.findSMI("Check") as SMITrigger;
            error  = controller.findSMI("Error") as SMITrigger;
            reset  = controller.findSMI("Reset") as SMITrigger;

          },
        ),
            ) : const SizedBox(),
        CustomPositioned(

          child: Transform.scale(
            scale: 7,
            child: RiveAnimation.asset('assets/RiveAssets/confetti.riv',
            onInit: (artboard)
            {
              StateMachineController controller= RiveUtils.getRiveController(artboard);
              confetti = controller.findSMI("Trigger explosion") as SMITrigger;
            },
            ),
          ),
        ),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100.0});

  final Widget child;
  final double size;


  @override
  Widget build(BuildContext context) {
    return Positioned.fill(child: Column(
      children: [
        Spacer(),
        Center(
          child: Column(
            children: [
              SizedBox(
                height : size,
                width: size,
                child: child,
              ),
            ],
          ),
        ),
        Spacer(flex: 2,),
      ],
    ));
  }
}


