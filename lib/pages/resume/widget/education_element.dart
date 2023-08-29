import 'package:flutter/material.dart';

import '../../../controller/navigation.dart';

class EducationElement extends StatelessWidget {
  const EducationElement(
      {super.key,
      required this.eduName,
      required this.eduTitle,
      required this.time});

  final String eduName;
  final String eduTitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        _buildEduName(eduName),
        const SizedBox(height: 5),
        _buildTime(time),
        const SizedBox(height: 5),
        _buildEduTitle(eduTitle),
      ],
    );
  }

  _buildEduName(String text) => Text(text,
      style: Navigation.textTheme.subtitle1!.copyWith(color: Colors.black));

  _buildTime(String text) => Text(text,
      style: Navigation.textTheme.bodyText2!.copyWith(color: Colors.black45));

  _buildEduTitle(String text) => Text(text,
      textAlign: TextAlign.justify,
      style: Navigation.textTheme.bodyText1!.copyWith(color: Colors.black));
}
