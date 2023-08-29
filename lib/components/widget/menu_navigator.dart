import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/control_menu.dart';
import '../../controller/navigation.dart';

class MenuNavigator extends StatelessWidget {
  final bool isThemDark;
  const MenuNavigator({
    super.key,
    this.isThemDark = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildTextBtnMenu(context, 'Resume', 1, onPressed: () {
          context.read<MenuControllerVM>().setIndexView(1);
        }),
        _buildTextBtnMenu(context, 'Portfolio', 2, onPressed: () {
          context.read<MenuControllerVM>().setIndexView(2);
        }),
        // _buildTextBtnMenu(context, 'Blog', 3, onPressed: () {
        //   context.read<MenuControllerVM>().setIndexView(3);
        // }),
        _buildTextBtnMenu(context, 'Contact', 4, onPressed: () {
          context.read<MenuControllerVM>().setIndexView(4);
        }),
        _buildIconBtnMenu(context, Icons.home_filled, 0, onPressed: () {
          context.read<MenuControllerVM>().setIndexView(0);
        }),
      ],
    );
  }

  _buildTextBtnMenu(BuildContext context, String title, int index,
          {required Function onPressed}) =>
      GestureDetector(
        onTap: () => onPressed(),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              title,
              style: Navigation.textTheme.headline6!.copyWith(
                color: isThemDark
                    ? Colors.white
                    : const Color(0xff333333).withOpacity(
                        context.select((MenuControllerVM vm) => vm.currentIndex) ==
                                index
                            ? 1
                            : 0.5),
              ),
            ),
          ),
        ),
      );

  _buildIconBtnMenu(BuildContext context, IconData iconData, int index,
          {required Function onPressed}) =>
      GestureDetector(
        onTap: () => onPressed(),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Icon(iconData,
                color: isThemDark
                    ? Colors.white
                    : const Color(0xff333333).withOpacity(context.select(
                                (MenuControllerVM vm) => vm.currentIndex) ==
                            index
                        ? 1
                        : 0.5),
                size: 20),
          ),
        ),
      );
}
