import 'package:flutter/material.dart';

import '../../controller/navigation.dart';
import '../../pages/resume/widget/liner_progress.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  const HeaderTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Navigation.textTheme.headline3!.copyWith(
            color: const Color(0xff333333),
          ),
        ),
        const SizedBox(height: 10),
        divider(),
      ],
    );
  }

  static divider() => const LinerProgress();
}
