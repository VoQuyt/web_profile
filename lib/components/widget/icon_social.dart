import 'package:flutter/material.dart';

import '../hover/hover_widget.dart';

class IconAssets {
  static const String path = "assets/icons";

  static const String ic_google = "$path/ic_google.png";
  static const String ic_linkedin = "$path/ic_linkedin.png";
  static const String ic_telegram = "$path/ic_telegram.png";

  static const String ic_android = "$path/ic_android.png";
  static const String ic_ios = "$path/ic_ios.png";
  static const String ic_flutter = "$path/ic_flutter.png";
  static const String ic_vue = "$path/ic_vue.png";

  static const String ic_shelf = "$path/ic_dart.png";
  static const String ic_nodejs = "$path/ic_nodejs.png";
  static const String ic_coroutines = "$path/ic_kotlin.png";
  static const String ic_spring = "$path/ic_springboot.png";

  static const String ic_docker = "$path/ic_docker.png";
  static const String ic_k8s = "$path/ic_k8s.png";
  static const String ic_gcp = "$path/ic_gcp.png";
  static const String ic_aws = "$path/ic_aws.png";

  static const String ic_mysql = "$path/ic_mysql.png";
  static const String ic_mongodb = "$path/ic_mongodb.png";
  static const String ic_firebase = "$path/ic_firebase.png";

  static const String ic_dart = "$path/ic_dart.png";
  static const String ic_c = "$path/ic_c.png";
  static const String ic_php = "$path/ic_php.png";
  static const String ic_kotlin = "$path/ic_kotlin.png";
  static const String ic_java = "$path/ic_java.png";
  static const String ic_js = "$path/ic_js.png";

  static const String ic_vscode = "$path/ic_vscode.png";
  static const String ic_androidstudio = "$path/ic_androidstudio.png";
  static const String ic_intellij = "$path/ic_intellij.png";
  static const String ic_github = "$path/ic_github.png";
  static const String ic_gitlab = "$path/ic_gitlab.png";
  static const String ic_bitbucket = "$path/ic_bitbucket.png";

  static const String ic_gitaction = "$path/ic_github.png";
  static const String ic_jenkins = "$path/ic_jenkins.png";
}

class IconSocial extends StatelessWidget {
  const IconSocial({super.key, required this.onPressed, required this.icon});
  final Function onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return HoverTranslate(
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            //color: const Color(0xff333333),
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            icon,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
