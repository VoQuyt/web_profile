import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
      
  //static PageController scrollController = PageController();

  static NavigatorState get stateRoot => navigatorKey.currentState!;
  static BuildContext get contextRoot => navigatorKey.currentContext!;
  static Size get size => MediaQuery.of(contextRoot).size;
  static double get widthPC => size.width / 5 * 4;
  static TextTheme get textTheme => Theme.of(contextRoot).textTheme;

  static readContext<VM>() => contextRoot.read<VM>();
  static watchContext<VM>() => contextRoot.watch<VM>();
  static selectContext<VM>() => contextRoot.select((VM vm) => vm);
}
