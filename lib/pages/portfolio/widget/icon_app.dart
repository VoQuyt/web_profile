import 'package:flutter/material.dart';
import 'package:web_profile/components/hover/hover_widget.dart';
import 'package:web_profile/controller/navigation.dart';

class IconApp extends StatelessWidget {
  const IconApp(
      {super.key,
      required this.appIcon,
      required this.appName,
      required this.onPressed});
  final String appIcon;
  final String appName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAppIcon(),
        _buildAppName(),
      ],
    );
  }

  _buildAppIcon() => GestureDetector(
        onTap: () => onPressed(),
        child: HoverTranslate(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(appIcon), fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
          ),
        ),
      );

  _buildAppName() => Text(appName, style: Navigation.textTheme.subtitle2!);
}
