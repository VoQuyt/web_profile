import 'package:flutter/material.dart';
import 'package:web_profile/controller/navigation.dart';

class SkillElement extends StatelessWidget {
  const SkillElement(
      {super.key,
      required this.skillIcon,
      required this.skillName,
      required this.width});
  final String skillIcon;
  final String skillName;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 35,
      color: const Color(0xff333333),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            skillIcon,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 5),
          Text(skillName, style: Navigation.textTheme.bodyText2!),
        ],
      ),
    );
  }
}
