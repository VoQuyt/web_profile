import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'navigation.dart';

enum CurrentPage { HOME, RESUME, PORTFOLIO, BLOG, CONTACT }

class MenuControllerVM with ChangeNotifier, DiagnosticableTreeMixin {
  int currentIndex = 0;

  void jumpToView(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      // Navigation.scrollController.animateToPage(index,
      //     duration: const Duration(milliseconds: 500),
      //     curve: Curves.fastOutSlowIn);
      //Navigation.scaffoldKey.currentState!.openEndDrawer();
      notifyListeners();
    }
  }

  void setIndexView(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      notifyListeners();
    }
  }

  void controlMenu() {
    if (!Navigation.scaffoldKey.currentState!.isDrawerOpen) {
      Navigation.scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('count', '0'));
  }
}
