import 'package:flutter/material.dart';
import '../../components/widget/header_page.dart';
import 'widget/iphone.dart';

class PagePortfolio extends StatefulWidget {
  const PagePortfolio({super.key});

  @override
  State<PagePortfolio> createState() => _PagePortfolioState();
}

class _PagePortfolioState extends State<PagePortfolio> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        children: [
          HeaderTitle(title: 'PORTFOLIO'),
          SizedBox(height: 30),
          IphoneWidget(),
        ],
      ),
    );
  }
}
