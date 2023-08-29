import 'package:flutter/material.dart';
import 'package:web_profile/models/app_model.dart';
import 'package:web_profile/pages/portfolio/widget/icon_app.dart';

import '../../../components/hover/hover_widget.dart';
import '../../../components/widget/btn_circle_icon.dart';

class IphoneWidget extends StatefulWidget {
  const IphoneWidget({super.key});

  @override
  State<IphoneWidget> createState() => _IphoneWidgetState();
}

class _IphoneWidgetState extends State<IphoneWidget>
    with SingleTickerProviderStateMixin {
  final List<String> bgphone = [
    "https://ik.imagekit.io/qavoxs3/qavox-site/bgphone.png"
  ];

  bool isVisible = true;
  late List<String> bg;
  final double width = 250;
  final double height = 480;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    bg = bgphone;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      alignment: isVisible ? Alignment.center : Alignment.centerLeft,
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            _buildPageViewApp(),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 4.0,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Visibility(
                visible: !isVisible,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CirleIconBtn(
                        icon: Icons.arrow_left_outlined,
                        onPressed: () {
                          setState(() {
                            _pageController.previousPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          });
                        },
                      ),
                      CirleIconBtn(
                        icon: Icons.arrow_right_outlined,
                        onPressed: () {
                          setState(() {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: dataApps
                        .map((app) => IconApp(
                              appIcon: app.appIcon,
                              appName: app.appName,
                              onPressed: () {
                                setState(() {
                                  bg = app.images;
                                  isVisible = false;
                                });
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: _buildCamera(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildNavigate(),
            ),
          ],
        ),
      ),
    );
  }

  _buildPageViewApp() {
    return PageView(
      controller: _pageController,
      children: bg
          .map(
            (e) => ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.network(e, fit: BoxFit.fill),
            ),
          )
          .toList(),
    );
  }

  _buildNavigate() {
    return GestureDetector(
      onTap: () {
        setState(() {
          bg = bgphone;
          isVisible = true;
        });
      },
      child: HoverTranslate(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 5,
              width: 100,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
      ),
    );
  }

  _buildCamera() {
    return Container(
      height: 20,
      width: 70,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
