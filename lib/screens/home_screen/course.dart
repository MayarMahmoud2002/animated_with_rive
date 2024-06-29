import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description = 'Build and animate an ios app from scratch',
    this.iconSrc = "assets/icons/ios.svg",
    this.bgColor = const Color(0xFF7553F6),
  });
}
List <Course> courses =
[
  Course(title: 'State Machine'),
  Course(title: 'Animated Menu',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFF9CC5FF),
  ),
  Course(title: 'Flutter with Rive'),
  Course(title: 'Animated Menu',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFF9CC5FF),
  ),

];
List <Course> recentCourses
=
[
  Course(title: 'State Machine'),
  Course(title: 'Animated Menu',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFF9CC5FF),
  ),
  Course(title: 'Flutter with Rive'),
  Course(title: 'Animated Menu',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFF9CC5FF),
  ),

];


class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      width: 260,
      height: 280,
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    course.description,
                    style: TextStyle(color: Colors.white60),
                  ),
                  Text(
                    '61 SECTIONS - 11 HOURS',
                    style: TextStyle(color: Colors.white54),
                  ),
                  Spacer(),
                  Row(
                      children: List.generate(
                          3,
                              (index) => Transform.translate(
                            offset: Offset(-10 * index.toDouble(), 0),
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundImage: AssetImage(
                                  "assets/avaters/Avatar ${index + 1}.jpg"
                              ),
                            ),
                          ))),
                ],
              )),
          SvgPicture.asset(course.iconSrc),
        ],
      ),
    );

  }
}

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  course.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                ),
                Text('Watch video - 15 mins', style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                ),),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Colors.white70,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          SvgPicture.asset(course.iconSrc),
        ],
      ),
    );

  }
}

