import 'package:flutter/material.dart';
import 'package:web_profile/controller/navigation.dart';
import 'package:web_profile/models/skill_model.dart';
import 'package:web_profile/pages/resume/widget/education_element.dart';
import 'package:web_profile/pages/resume/widget/skill_element.dart';
import '../../components/widget/header_page.dart';
import '../../services/local_data.dart';
import 'widget/experience_element.dart';
import 'widget/text_widget.dart';

class PageResume extends StatefulWidget {
  const PageResume({super.key});

  @override
  State<PageResume> createState() => _PageResumeState();
}

class _PageResumeState extends State<PageResume> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderTitle(title: 'PROFILE'),
          const SizedBox(height: 20),
          _buildSologan(),
          const SizedBox(height: 40),
          _buildBasicInfo(),
          const SizedBox(height: 50),
          const HeaderTitle(title: 'EXPERIENCE'),
          _buildExperience(),
          const SizedBox(height: 50),
          const HeaderTitle(title: 'EDUCATION'),
          _buildEducation(),
          const SizedBox(height: 50),
          const HeaderTitle(title: 'SKILL'),
          const SizedBox(height: 30),
          _buildSkill(),
        ],
      ),
    );
  }

  _buildSologan() => Text(
      'I am a software developer with 4 years of experience, including 3 years of Flutter experience. In my view, coding and technology is not only passion but also can make a big impact, so I would like to contribute to the growth of your business with my knowledge and experience.',
      textAlign: TextAlign.justify,
      style: Navigation.textTheme.bodyText1!.copyWith(color: Colors.black54));

  _buildBasicInfo() => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRichText('Name: ', ' Anh Quyet Vo'),
                const SizedBox(height: 10),
                buildRichText('Address: ', ' Ho Chi Minh - Viet Nam'),
                const SizedBox(height: 10),
                buildRichText('Phone: ', ' +84 385804***'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRichText('Date of birth: ', ' january 19, 1998'),
                const SizedBox(height: 10),
                buildRichText('Email: ', ' quyet.vox@gmail.com'),
                const SizedBox(height: 10),
                buildRichText('Interest: ', ' full-time, freelance'),
              ],
            ),
          ),
        ],
      );

  _buildExperience() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: dataExperiences
            .map(
              (e) => ExperienceElement(
                jobName: e['jobName'],
                jobTitle: e['jobTitle'],
                time: e['time'],
                richPosContent: e['position'],
                richSkillContent: e['skills'],
                achievements: e['achievements'],
              ),
            )
            .toList(),
      );

  _buildEducation() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: dataEducations
            .map((e) => EducationElement(
                eduName: e['eduName'],
                eduTitle: e['eduTitle'],
                time: e['time']))
            .toList(),
      );

  Widget _buildSkillType(String skillType, List<SkillItem> skills) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(skillType,
              style: Navigation.textTheme.bodyText2!
                  .copyWith(color: Colors.black)),
          Wrap(
              runSpacing: 5,
              spacing: 5,
              children: skills
                  .map(
                    (e) => SkillElement(
                        skillIcon: e.skillIcon,
                        skillName: e.skillName,
                        width: e.size),
                  )
                  .toList()),
        ],
      );

  _buildSkill() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: dataSkill
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildSkillType(e.skillType, e.skills),
                ))
            .toList(),
      );

  // _buildSkill() => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         _buildElementSkill('Flutter/Dart - ', '90%', 0.9),
  //         const SizedBox(height: 20),
  //         _buildElementSkill('DataBase - ', '70%', 0.7),
  //         const SizedBox(height: 20),
  //         _buildElementSkill('C/C++ - ', '70%', 0.7),
  //         const SizedBox(height: 20),
  //         _buildElementSkill('GIT - ', '80%', 0.8),
  //         const SizedBox(height: 20),
  //         _buildElementSkill('Firebase - ', '50%', 0.5),
  //         const SizedBox(height: 20),
  //         _buildElementSkill('Devops (K8s, AWS, GCP) - ', '50%', 0.5),
  //       ],
  //     );

  // _buildElementSkill(String title, String content, double percent) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         buildRichText(title, content),
  //         const SizedBox(height: 10),
  //         LinerProgress(
  //           value: percent,
  //           valueColor: Colors.black,
  //           minHeight: 3,
  //         ),
  //       ],
  //     );
}
