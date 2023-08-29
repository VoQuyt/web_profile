import 'package:flutter/material.dart';
import '../../components/widget/header_page.dart';

class PageBlog extends StatefulWidget {
  const PageBlog({super.key});

  @override
  State<PageBlog> createState() => _PageBlogState();
}

class _PageBlogState extends State<PageBlog> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: HeaderTitle(title: 'BLOG'),
        ),
      ],
    );
  }
}