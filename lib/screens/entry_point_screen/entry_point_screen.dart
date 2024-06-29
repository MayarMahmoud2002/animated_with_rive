import 'package:animation_with_rive/utilis/rive_utilis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../home_screen/home_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
{
  RiveAsset selectedBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          body: HomeScreen(),
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(57, 64, 83, 1.0).withOpacity(0.8),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(bottomNavs.length, (index) => GestureDetector(
                    onTap: () {
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index]!= selectedBottomNav)
                      {
                        setState(() {
                          selectedBottomNav = bottomNavs[index];
                        });
                      }
                      Future.delayed(Duration(seconds: 1),()
                      {
                        bottomNavs[index].input!.change(false);
                      });
                      // searchTigger.change(true);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          margin: EdgeInsets.only(bottom: 2),
                          height: 4,
                          width: bottomNavs[index] == selectedBottomNav ? 20 : 0,
                          decoration: BoxDecoration(
                            color: Color(0xFF81B4FF),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ), duration: Duration(milliseconds: 200),
                        ),
                        SizedBox(
                          height: 36.h,
                          width: 36.w,
                          child: Opacity(
                            opacity: bottomNavs[index]==selectedBottomNav ? 1 : 0.5 ,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                RiveUtils.getRiveController(artboard,
                                    stateMachineName: bottomNavs[index].stateMachineName);
                                bottomNavs[index].input = controller.findSMI(
                                    'active') as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),),

                ],
              ),
            ),
          ),
        ));
  }}

  class RiveAsset {
  final String artboard, stateMachineName, title , src;
  late SMIBool? input;

  RiveAsset(
      this.src,
      {required this.artboard,
  required this.stateMachineName,
  required this.title,
  this.input,
  });
  set setInput (SMIBool status)
  {
    input = status;
  }
  }
  List <RiveAsset> bottomNavs = [
    RiveAsset('assets/RiveAssets/icons.riv', artboard: 'CHAT', stateMachineName: 'CHAT_Interactivity', title: 'Chat'),
    RiveAsset('assets/RiveAssets/icons.riv', artboard: 'SEARCH', stateMachineName: 'SEARCH_Interactivity', title: 'Search'),
    RiveAsset('assets/RiveAssets/icons.riv', artboard: 'TIMER', stateMachineName: 'TIMER_Interactivity', title: 'Timer'),
    RiveAsset('assets/RiveAssets/icons.riv', artboard: 'BELL', stateMachineName: 'BELL_Interactivity', title: 'Bell'),
    RiveAsset('assets/RiveAssets/icons.riv', artboard: 'USER', stateMachineName: 'USER_Interactivity', title: 'User'),
  ];

List <RiveAsset> sideMenu =
[
  RiveAsset(
      'assets/RiveAssets/icons.riv',
      artboard: 'HOME',
      stateMachineName: 'HOME_interactivity',
      title: 'HOME',
  ),



  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'SEARCH',
    stateMachineName: 'SEARCH_interactivity',
    title: 'Search',
  ),

  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'LIKE/STAR',
    stateMachineName: 'LIKE_interactivity',
    title: 'favorite',
  ),
];



