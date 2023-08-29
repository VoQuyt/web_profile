import 'package:flutter/material.dart';

import '../../../controller/navigation.dart';
import 'text_widget.dart';

class ExperienceElement extends StatelessWidget {
  const ExperienceElement(
      {super.key,
      required this.jobName,
      required this.time,
      required this.jobTitle,
      required this.richPosContent,
      required this.richSkillContent,
      required this.achievements});

  final String jobName;
  final String time;
  final String jobTitle;
  final List<String> achievements;
  final String richPosContent;
  final String richSkillContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        _buildJobName(jobName),
        const SizedBox(height: 5),
        _buildTime(time),
        const SizedBox(height: 5),
        _buildTitleJob(jobTitle),
        const SizedBox(height: 5),
        buildRichText('Position :  ', richPosContent),
        const SizedBox(height: 5),
        _buildAchievement(achievements: achievements),
        const SizedBox(height: 5),
        buildRichText('Skill :  ', richSkillContent),
      ],
    );
  }

  _buildJobName(String projectName) => Text(projectName,
      style: Navigation.textTheme.subtitle1!.copyWith(color: Colors.black));

  _buildTime(String time) => Text(time,
      style: Navigation.textTheme.bodyText2!.copyWith(color: Colors.black45));

  _buildTitleJob(String titleJob) => Text(titleJob,
      textAlign: TextAlign.justify,
      style: Navigation.textTheme.bodyText1!.copyWith(color: Colors.black));
}

class _buildAchievement extends StatelessWidget {
  const _buildAchievement({super.key, required this.achievements});

  final List<String> achievements;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Achievement :',
            style: Navigation.textTheme.bodyText1!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        ...achievements.map((e) => _buildAchievementElement(e)).toList()
      ],
    );
  }

  _buildAchievementElement(String text) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 7),
            child: iconDot(),
          ),
          Expanded(
            child: Text(text,
                textAlign: TextAlign.justify,
                style: Navigation.textTheme.bodyText2!
                    .copyWith(color: Colors.black54)),
          )
        ],
      );

  iconDot({int radius = 10}) => Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        width: radius / 2,
        height: radius / 2,
      );
}
