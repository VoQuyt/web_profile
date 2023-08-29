// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_profile/components/widget/icon_social.dart';
import 'package:web_profile/helper/url_strategy/url_strategy.dart';
import 'package:web_profile/pages/blog/blog_page.dart';
import 'package:web_profile/pages/contact/contact_page.dart';
import 'package:web_profile/pages/portfolio/portfolio_page.dart';
import 'package:web_profile/pages/resume/resume_page.dart';
import 'package:web_profile/style/text_style.dart';
import 'components/hover/hover_widget.dart';
import 'components/widget/menu_navigator.dart';
import 'controller/control_menu.dart';
import 'controller/navigation.dart';
import 'controller/responsive.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuControllerVM(),
        ),
      ],
      child: MaterialApp(
        title: 'Vo Anh Quyet',
        navigatorKey: Navigation.navigatorKey,
        scaffoldMessengerKey: Navigation.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: TextThemeCustom().buildTextTheme(),
        ),
        initialRoute: MyHomePage.route,
        routes: {
          MyHomePage.route: (context) => const MyHomePage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String route = '/';
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroud(),
          _buildMenuNavigator(),
          _buildHello(),
          _buildPages(),
        ],
      ),
    );
  }

  _buildPages() {
    return context.watch<MenuControllerVM>().currentIndex == 0
        ? const SizedBox.shrink()
        : Align(
            alignment: Alignment.centerRight,
            child: Material(
              elevation: 2.0,
              child: Container(
                width: Responsive.isDesktop(context)
                    ? Navigation.size.width / 1.5
                    : Navigation.size.width,
                height: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: Responsive.isDesktop(context) ? 50 : 10,
                          top: 10,
                          bottom: 10),
                      child: const MenuNavigator(
                        isThemDark: false,
                      ),
                    ),
                    Expanded(child: _getPage())
                  ],
                ),
              ),
            ),
          );
  }

  _getPage() {
    switch (context.watch<MenuControllerVM>().currentIndex) {
      case 1:
        return const PageResume();
      case 2:
        return const PagePortfolio();
      case 3:
        return const PageBlog();
      case 4:
        return const PageContact();
      default:
        return const SizedBox.shrink();
    }
  }

  _buildBackgroud() => FadeTransition(
        opacity: _animation,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "assets/images/bg1.jpg",
            fit: BoxFit.cover,
          ),
        ),
      );

  _buildHello() => Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi! I'm",
              style: Navigation.textTheme.headline4,
            ),
            const SizedBox(height: 10),
            Text(
              "ANH QUYET, VO",
              style: Navigation.textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(
              "Software Developer",
              style: Navigation.textTheme.headline4!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),
            _buildButtonDownloadCV(),
            const SizedBox(height: 50),
            _buildIconSocial(),
          ],
        ),
      );

  _downloadFile(url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = "Vo-Anh-Quyet_CV";
    anchorElement.click();
  }

  _buildButtonDownloadCV() => HoverTranslate(
        child: GestureDetector(
          // onTap: () => _downloadFile('https://ik.imagekit.io/qavoxs3/qavox-site/Vo-Anh-Quyet_CV.pdf'),
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: const Color(0xff333333),
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('DOWNLOAD RESUME', style: Navigation.textTheme.headline6),
                const SizedBox(width: 5),
                const Icon(Icons.file_download_outlined,
                    color: Colors.white, size: 25)
              ],
            ),
          ),
        ),
      );

  _buildIconSocial() => Container(
        child: Row(
          children: [
            IconSocial(
                onPressed: () {
                  context.read<MenuControllerVM>().setIndexView(4);
                },
                icon: IconAssets.ic_google),
            const SizedBox(width: 30),
            IconSocial(
                onPressed: () {
                  window.open('https://t.me/vo_quyt', 'new tab');
                },
                icon: IconAssets.ic_telegram),
            const SizedBox(width: 30),
            IconSocial(
                onPressed: () {
                  window.open(
                      'https://www.linkedin.com/in/quyetvoanh/', 'new tab');
                },
                icon: IconAssets.ic_linkedin)
          ],
        ),
      );

  _buildMenuNavigator() => Padding(
        padding: EdgeInsets.only(
            right: Responsive.isDesktop(context) ? 50 : 10, top: 10),
        child: const MenuNavigator(),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
