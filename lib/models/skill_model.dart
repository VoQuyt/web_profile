import '../components/widget/icon_social.dart';

class SkillModel {
  final String skillType;
  final List<SkillItem> skills;
  SkillModel({
    required this.skillType,
    required this.skills,
  });
}

class SkillItem {
  final String skillIcon;
  final String skillName;
  double size;
  SkillItem({
    required this.skillIcon,
    required this.skillName,
    this.size = 80,
  }) {
    size = skillName.length * 10 + 30;
    if (skillName.length <= 3) size += 20;
  }
}

final dataSkill = [
  SkillModel(skillType: 'FontEnd', skills: [
    SkillItem(skillIcon: IconAssets.ic_flutter, skillName: 'flutter'),
    SkillItem(skillIcon: IconAssets.ic_android, skillName: 'android'),
    SkillItem(skillIcon: IconAssets.ic_ios, skillName: 'IOS'),
    SkillItem(skillIcon: IconAssets.ic_vue, skillName: 'Vue'),
  ]),
  SkillModel(skillType: 'BackEnd', skills: [
    SkillItem(skillIcon: IconAssets.ic_shelf, skillName: 'shelf'),
    SkillItem(skillIcon: IconAssets.ic_nodejs, skillName: 'nodejs'),
    SkillItem(
        skillIcon: IconAssets.ic_coroutines, skillName: 'kotlin coroutines'),
    SkillItem(skillIcon: IconAssets.ic_spring, skillName: 'spring boot'),
  ]),
  SkillModel(skillType: 'DataBase', skills: [
    SkillItem(skillIcon: IconAssets.ic_mysql, skillName: 'mysql'),
    SkillItem(skillIcon: IconAssets.ic_mongodb, skillName: 'mongodb'),
    SkillItem(skillIcon: IconAssets.ic_firebase, skillName: 'firebase'),
  ]),
  SkillModel(skillType: 'Devops/Cloud', skills: [
    SkillItem(skillIcon: IconAssets.ic_docker, skillName: 'docker'),
    SkillItem(skillIcon: IconAssets.ic_k8s, skillName: 'kubernetes'),
    SkillItem(skillIcon: IconAssets.ic_gcp, skillName: 'gcp'),
    SkillItem(skillIcon: IconAssets.ic_aws, skillName: 'aws'),
  ]),
  SkillModel(skillType: 'Programing Language', skills: [
    SkillItem(skillIcon: IconAssets.ic_dart, skillName: 'dart'),
    SkillItem(skillIcon: IconAssets.ic_c, skillName: 'c++'),
    SkillItem(skillIcon: IconAssets.ic_php, skillName: 'php'),
    SkillItem(skillIcon: IconAssets.ic_kotlin, skillName: 'kotlin'),
    SkillItem(skillIcon: IconAssets.ic_java, skillName: 'java'),
  ]),
  SkillModel(skillType: 'Tool', skills: [
    SkillItem(
        skillIcon: IconAssets.ic_androidstudio, skillName: 'android studio'),
    SkillItem(skillIcon: IconAssets.ic_vscode, skillName: 'visual studio code'),
    SkillItem(skillIcon: IconAssets.ic_intellij, skillName: 'intellij'),
    SkillItem(skillIcon: IconAssets.ic_github, skillName: 'github'),
    SkillItem(skillIcon: IconAssets.ic_gitlab, skillName: 'gitlab'),
    SkillItem(skillIcon: IconAssets.ic_bitbucket, skillName: 'bitbucket'),
  ]),
  SkillModel(skillType: 'CI/CD', skills: [
    SkillItem(skillIcon: IconAssets.ic_gitaction, skillName: 'github action'),
    SkillItem(skillIcon: IconAssets.ic_jenkins, skillName: 'jenkins')
  ]),
];
